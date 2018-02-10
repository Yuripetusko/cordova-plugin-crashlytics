//
//  CrashlyticsPlugin.m
//
//  Created by Francesco Verheye on 03/12/14.
//
//

@import Firebase;
#import "CrashlyticsPlugin.h"
#import <Crashlytics/Crashlytics.h>

@implementation CrashlyticsPlugin{
    NSString *_title;
    NSString *_description;
    NSString *_positiveButtonText;
    NSString *_negativeButtonText;
}

- (void)init:(CDVInvokedUrlCommand*)command
{
    if([FIRApp defaultApp] == nil) {
       [FIRApp configure];
    }
}

#pragma mark - Logging
- (void)addLog:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    NSString *logMessage = [options objectForKey:@"message"];
    if(logMessage)
    {
        CLSNSLog(@"%@",logMessage);
    }
}

#pragma mark - User Information

- (void)setUserIdentifier:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    NSString *identifier = [options objectForKey:@"value"];
    if(identifier)
    {
        [CrashlyticsKit setUserIdentifier:identifier];
    }
}

- (void)setUserName:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    NSString *username = [options objectForKey:@"value"];
    if(username)
    {
        [CrashlyticsKit setUserName:username];
    }
}

- (void)setUserEmail:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    NSString *email = [options objectForKey:@"value"];
    if(email)
    {
        [CrashlyticsKit setUserEmail:email];
    }
}

#pragma mark ) Crash
- (void)sendCrash:(CDVInvokedUrlCommand*)command
{
    [CrashlyticsKit crash];
}

#pragma mark - Custom Keys
- (void)setObjectValueForKey:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    NSString *value = [options objectForKey:@"value"];
    NSString *key = [options objectForKey:@"key"];
    if(value && key)
    {
        [CrashlyticsKit setObjectValue:value forKey:key];
    }
}

- (void)setIntValueForKey:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    NSInteger value = [[options objectForKey:@"value"] integerValue];
    NSString *key = [options objectForKey:@"key"];
    if(key)
    {
        [CrashlyticsKit setIntValue:value forKey:key];
    }
}

- (void)setBoolValueForKey:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    BOOL value = [[options objectForKey:@"value"] boolValue];
    NSString *key = [options objectForKey:@"key"];
    if(key)
    {
        [CrashlyticsKit setBoolValue:value forKey:key];
    }
}

- (void)setFloatValueForKey:(CDVInvokedUrlCommand*)command
{
    NSMutableDictionary *options = [command argumentAtIndex:0];
    float value = [[options objectForKey:@"value"] floatValue];
    NSString *key = [options objectForKey:@"key"];
    if(key)
    {
        [CrashlyticsKit setFloatValue:value forKey:key];
    }
}

@end
