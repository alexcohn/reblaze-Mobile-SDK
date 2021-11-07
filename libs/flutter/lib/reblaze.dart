import 'package:flutter/services.dart';

class reblaze {
  static const MethodChannel _methodChannel = const MethodChannel('reblaze.com');

  /// The header you should set to send your HTTPS request through Reblaze WAF
  static final String reblazeHeader = "rbzsdk";

  /// Generate the new value for RBZSDK header.
  static Future<String> generateHash() async {
    try {
      return await _methodChannel.invokeMethod('generateHash');
    } on PlatformException catch (e, stack) {
      print("Plugin generateHash error: ${e.message}");
      return Future.error("generateHash failed.", stack);
    }
  }

  /// Start Reblaze SDK by setting the backend URL
  static void setBackendUrl(String backendUrl) async {
    try {
      await _methodChannel.invokeMethod('setBackendUrl', backendUrl);
    } on PlatformException catch (e, stack) {
      print("Plugin setBackendUrl error: ${e.message}");
    }
  }

  static Future<String> getBackendUrl() async {
    try {
      return await _methodChannel.invokeMethod('getBackendUrl');
    } on PlatformException catch (e, stack) {
      print("Plugin getBackendUrl error: ${e.message}");
      return Future.error("getBackendUrl failed.", stack);
    }
  }

  static Future<String> getUserAgent() async {
    try {
      return await _methodChannel.invokeMethod('getUserAgent');
    } on PlatformException catch (e, stack) {
      print("Plugin getUserAgent error: ${e.message}");
      return Future.error("getUserAgent failed.", stack);
    }
  }

  static Future<String> getHashVariant() async {
    try {
      return await _methodChannel.invokeMethod('getHashVariant');
    } on PlatformException catch (e, stack) {
      print("Plugin getHashVariant error: ${e.message}");
      return Future.error("getHashVariant failed.", stack);
    }
  }

  static Future<String> getConfigurationName() async {
    try {
      return await _methodChannel.invokeMethod('getConfigurationName');
    } on PlatformException catch (e, stack) {
      print("Plugin getConfigurationName error: ${e.message}");
      return Future.error("getConfigurationName failed.", stack);
    }
  }

  static Future<String> getToken() async {
    try {
      return await _methodChannel.invokeMethod('getToken');
    } on PlatformException catch (e, stack) {
      print("Plugin getToken error: ${e.message}");
      return Future.error("getToken failed.", stack);
    }
  }

  static void setToken(String token) async {
    try {
      await _methodChannel.invokeMethod('setToken', token);
    } on PlatformException catch (e, stack) {
      print("Plugin setToken error: ${e.message}");
    }
  }

  static Future<String> getTokenHeaderName() async {
    try {
      return await _methodChannel.invokeMethod('getTokenHeaderName');
    } on PlatformException catch (e, stack) {
      print("Plugin getTokenHeaderName error: ${e.message}");
      return Future.error("getTokenHeaderName failed.", stack);
    }
  }

  static void setTokenHeaderName(String tokenHeaderName) async {
    try {
      _methodChannel.invokeMethod('setTokenHeaderName', tokenHeaderName);
    } on PlatformException catch (e, stack) {
      print("Plugin setTokenHeaderName error: ${e.message}");
    }
  }

  static Future<String> getReportCounters() async {
    try {
      return await _methodChannel.invokeMethod('getReportCounters');
    } on PlatformException catch (e, stack) {
      print("Plugin getReportCounters error: ${e.message}");
      return Future.error("getReportCounters failed.", stack);
    }
  }

  /// Choose counters to report: ALL or NONE
  static void setReportCounters(String reportCounters) async {
    try {
      return _methodChannel.invokeMethod('setReportCounters', reportCounters);
    } on PlatformException catch (e, stack) {
      print("Plugin getReportCounters error: ${e.message}");
      return Future.error("getReportCounters failed.", stack);
    }
  }

  static Future<int> getTimeslice() async {
    try {
      return await _methodChannel.invokeMethod('getTimeslice');
    } on PlatformException catch (e, stack) {
      print("Plugin getTimeslice error: ${e.message}");
      return Future.error("getTimeslice failed.", stack);
    }
  }

  static void setTimeslice(int timeslice) async {
    try {
      _methodChannel.invokeMethod('setTimeslice', timeslice);
    } on PlatformException catch (e, stack) {
      print("Plugin getTimeslice error: ${e.message}");
      return Future.error("getTimeslice failed.", stack);
    }
  }

  static Future<int> getInterval() async {
    try {
      return await _methodChannel.invokeMethod('getInterval');
    } on PlatformException catch (e, stack) {
      print("Plugin getInterval error: ${e.message}");
      return Future.error("getInterval failed.", stack);
    }
  }

  static void setInterval(int interval) async {
    try {
      _methodChannel.invokeMethod('setInterval', interval);
    } on PlatformException catch (e, stack) {
      print("Plugin setInterval error: ${e.message}");
      return Future.error("setInterval failed.", stack);
    }
  }

  static void sendEvent(String eventName) async {
    try {
      _methodChannel.invokeMethod('sendEvent', eventName);
    } on PlatformException catch (e, stack) {
      print("Plugin sendEvent error: ${e.message}");
    }
  }

  static void enableMock() async {
    try {
      _methodChannel.invokeMethod('enableMock');
    } on PlatformException catch (e, stack) {
      print("Plugin enableMock error: ${e.message}");
    }
  }

  static Future<bool> isMockEnabled() async {
    try {
      return await _methodChannel.invokeMethod('isMockEnabled');
    } on PlatformException catch (e, stack) {
      print("Plugin isMockEnabled error: ${e.message}");
      return Future.error("isMockEnabled failed.", stack);
    }
  }

  static void setMockResponse(int code, String remoteConfig, [int delay=-1]) async {
    try {
      _methodChannel.invokeMethod('setMockResponse', [code, remoteConfig, delay]);
    } on PlatformException catch (e, stack) {
      print("Plugin enableMock error: ${e.message}");
    }
  }
}