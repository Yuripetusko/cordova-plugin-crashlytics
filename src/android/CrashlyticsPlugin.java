package com.checkroom.plugin.crashlytics;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.crashlytics.android.Crashlytics;

import android.util.Log;

public class CrashlyticsPlugin extends CordovaPlugin {
	private final String pluginName = "CrashlyticsPlugin";

	@Override
	public boolean execute(final String action, final JSONArray data,
			final CallbackContext callbackContext) {
		Log.d(pluginName, pluginName + " called with options: " + data);

		if (action.equals("sendCrash")) {
			sendCrash(data, callbackContext);
		} else if (action.equals("addLog")) {
			addLog(data, callbackContext);
		} else if (action.equals("setUserIdentifier")) {
			setUserIdentifier(data, callbackContext);
		} else if (action.equals("setUserName")) {
			setUserName(data, callbackContext);
		} else if (action.equals("setUserEmail")) {
			setUserEmail(data, callbackContext);
		}
		return true;
	}

	private void sendCrash(final JSONArray data,
			final CallbackContext callbackContext) {
		this.cordova.getActivity().runOnUiThread(new Runnable() {
			@Override
			public void run() {
				throw new RuntimeException("This is a crash");
			}
		});
	}

	private void sendNonFatalCrash(final JSONArray data,
			final CallbackContext callbackContext) {
		this.cordova.getActivity().runOnUiThread(new Runnable() {
			@Override
			public void run() {
				Crashlytics.logException(new Throwable(
						"Sending non fatal crash from JS"));
			}
		});
	}

	private void addLog(final JSONArray data,
			final CallbackContext callbackContext) {
		try {
			JSONObject obj = data.getJSONObject(0);
			String message;
			if (obj.has("message")) {
				message = obj.getString("message");
				Crashlytics.log(message);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
	}

	private void setUserIdentifier(final JSONArray data,
			final CallbackContext callbackContext) {
		String identifier = getValueFromData(data);
		if (identifier != null) {
			Crashlytics.setUserIdentifier(identifier);
		}
	}

	private void setUserName(final JSONArray data,
			final CallbackContext callbackContext) {
		String userName = getValueFromData(data);
		if (userName != null) {
			Crashlytics.setUserName(userName);
		}
	}

	private void setUserEmail(final JSONArray data,
			final CallbackContext callbackContext) {
		String email = getValueFromData(data);
		if (email != null) {
			Crashlytics.setUserEmail(email);
		}
	}

	private String getValueFromData(JSONArray data) {
		try {
			JSONObject obj = data.getJSONObject(0);
			if (obj.has("value")) {
				return obj.getString("value");
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

	private String getKeyFromData(JSONArray data) {
		try {
			JSONObject obj = data.getJSONObject(0);
			if (obj.has("key")) {
				return obj.getString("key");
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}
}