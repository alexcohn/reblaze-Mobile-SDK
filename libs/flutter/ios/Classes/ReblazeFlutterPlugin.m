#import "ReblazeFlutterPlugin.h"

@import ReblazeSDK;

@implementation ReblazeFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"reblaze.com"
            binaryMessenger:[registrar messenger]];
  ReblazeFlutterPlugin* instance = [[ReblazeFlutterPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([call.method isEqualToString: @"generateHash"]) {
    result([reblaze generateHash]);
  } else if ([call.method isEqualToString: @"sendEvent"]) {
    [reblaze sendEvent:call.arguments];
  } else if ([call.method isEqualToString: @"setBackendUrl"]) {
    reblaze.backendUrl = call.arguments;
  } else if ([call.method isEqualToString: @"getBackendUrl"]) {
    result(reblaze.backendUrl);
  } else if ([call.method isEqualToString: @"getUserAgent"]) {
    result(reblaze.userAgent == nil ? @"" : reblaze.userAgent);
  } else if ([call.method isEqualToString: @"getConfigurationName"]) {
    result(reblaze.configurationName);
  } else if ([call.method isEqualToString: @"getHashVariant"]) {
    result(reblaze.hashVariant);
  } else if ([call.method isEqualToString: @"getToken"]) {
    result(reblaze.token);
  } else if ([call.method isEqualToString: @"getTokenHeaderName"]) {
    result(reblaze.tokenHeaderName);
  } else if ([call.method isEqualToString: @"getTimeslice"]) {
    result([NSString stringWithFormat:@"%ld", (long)reblaze.timeslice]);
  } else if ([call.method isEqualToString: @"getInterval"]) {
    result([NSString stringWithFormat:@"%ld", (long)reblaze.interval]);
  } else if ([call.method isEqualToString: @"getReportCounters"]) {
    result(reblaze.reportCounters == ReblazeSDK_ReportCountersNONE ? @"NONE" : @"ALL");
  } else if ([call.method isEqualToString: @"setToken"]) {
    reblaze.token = call.arguments;
  } else if ([call.method isEqualToString: @"setTokenHeaderName"]) {
    reblaze.tokenHeaderName = call.arguments;
  } else if ([call.method isEqualToString: @"setTimeslice"]) {
    reblaze.timeslice = [call.arguments intValue];
  } else if ([call.method isEqualToString: @"setInterval"]) {
    reblaze.interval = [call.arguments intValue];
  } else if ([call.method isEqualToString: @"setReportCounters"]) {
    reblaze.reportCounters = ([call.arguments isEqualToString: @"NONE"] ? ReblazeSDK_ReportCountersNONE : ReblazeSDK_ReportCountersALL);
  } else if ([call.method isEqualToString: @"enableMock"]) {
    [reblaze enableMock];
  } else if ([call.method isEqualToString: @"setMockResponse"]) {
      NSArray *args = (NSArray *)call.arguments;
      if (args != nil && args.count == 3) {
          int code = (int) args[0];
          NSString *remoteConfig = (NSString *) args[1];
          int delay = (int) args[2];
          if (delay == -1) {
              [reblaze setMockResponse:code remoteConfig:remoteConfig];
          }
          else {
              [reblaze setMockResponse:code remoteConfig:remoteConfig delay:delay];
          }
      }
  } else if ([call.method isEqualToString: @"setAutoSign"]) {
    reblaze.reportCounters = ([call.arguments isEqualToString: @"NONE"] ? ReblazeSDK_AutoSignNONE : ReblazeSDK_AutoSignALL);
  } else if ([call.method isEqualToString: @"getAutoSign"]) {
    result(reblaze.reportCounters == ReblazeSDK_AutoSignNONE ? @"NONE" : @"ALL");
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
