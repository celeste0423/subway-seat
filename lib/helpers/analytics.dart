import 'package:amplitude_flutter/amplitude.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  Analytics();

  static FirebaseAnalytics googleAnalytics = FirebaseAnalytics.instance;
  static Amplitude amplitudeAnalytics =
      Amplitude.getInstance(instanceName: "project");

  Future<void> init() async {
    googleAnalytics.setAnalyticsCollectionEnabled(true);
    // amplitudeAnalytics.init('e0ce8fd6fc83abd8be70d7fb7583bab7');
  }

  Future<void> logEvent(
    String name,
    Map<String, dynamic>? parameters,
  ) async {
    //ga
    await googleAnalytics.logEvent(
      name: name,
      parameters: parameters,
    );
    //aa
    // await amplitudeAnalytics.logEvent(name, eventProperties: parameters);
    // print('log 전송');
  }

  Future<void> logAppOpen() async {
    await googleAnalytics.logAppOpen();
    // await amplitudeAnalytics.logEvent(name, eventProperties: parameters);
  }
}
