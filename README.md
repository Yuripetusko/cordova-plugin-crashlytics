# Crashlytics Plugin for Cordova/PhoneGap 3.0 (iOS and Android)

![Alt text](/screenshots/crashreport/crashreport-keys.png?raw=true "Keys")
![Alt text](/screenshots/crashreport/crashreport-logs.png?raw=true "Logs")

## Installation

1) Make sure that you have [Node](http://nodejs.org/) and [Cordova CLI](https://github.com/apache/cordova-cli) or [PhoneGap's CLI](https://github.com/mwbrooks/phonegap-cli) installed on your machine.

2) Add Crashlytics plugin (IDE plugin) to the Android / iOS project
https://www.crashlytics.com/downloads

3) Create a native crash. Go to step 4 if you can see the crash report on the dashboard.

4) Add a plugin to your project using Cordova CLI:

```bash
cordova plugin add https://github.com/francescobitmunks/cordova-plugin-crashlytics
```
Or using PhoneGap CLI:

```bash
phonegap local plugin add https://github.com/francescobitmunks/cordova-plugin-crashlytics
```

## Usage

```js
function sendCrashWithData() {
	crashlyticsPlugin.setUserIdentifier('TheIdentifier');
    crashlyticsPlugin.setUserName('Francesco Verheye');
    crashlyticsPlugin.setUserEmail('verheye.francesco@gmail.com');

    crashlyticsPlugin.setStringValueForKey('MyString', 'stringkey');
    crashlyticsPlugin.setIntValueForKey(200, 'intkey');
    crashlyticsPlugin.setBoolValueForKey(true, 'boolkey');
    crashlyticsPlugin.setFloatValueForKey(1.5, 'floatkey');

    crashlyticsPlugin.addLog('This my a log message from JS!');
    crashlyticsPlugin.addLog('This is another log message from JS!');
    //ios
    crashlyticsPlugin.sendCrash();
    
    //android
    crashlyticsPlugin.sendCrash('my crash');
    crashlyticsPlugin.sendNonFatalCrash('my non-fatal error');
}
```

## Methods

### setUserIdentifier(value) - iOS, Android
Set the user identifier value

### setUserName(value) - iOS, Android
Set the username

### setUserEmail(value) - iOS, Android
Set the user email

### setStringValueForKey(value, key) - iOS, Android
Set String value for key

### setIntValueForKey(value, key) - iOS, Android
Set integer value for key

### setBoolValueForKey(value, key) - iOS, Android
Set boolean for key

### setFloatValueForKey(value, key) - iOS, Android
Set float for key

### addLog(value) - iOS, Android
Add log for the crash.

### sendCrash() - iOS
Send a (fatal) crash to the backand of CrashLytics.

### sendCrash(exceptionMessage) - Android
Send a (fatal) crash to the backand of CrashLytics.


### sendNonFatalCrash(exceptionMessage) - Android
Send a non-fatal crash to the backand of CrashLytics.

