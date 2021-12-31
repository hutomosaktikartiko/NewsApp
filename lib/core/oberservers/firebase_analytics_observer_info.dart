import 'package:firebase_analytics/firebase_analytics.dart';

abstract class FirebaseAnalyticsObserverInfo {
  FirebaseAnalyticsObserver get analyticsObserver;
}

class FirebaseAnalyticsObserverInfoImpl implements FirebaseAnalyticsObserverInfo {
  final FirebaseAnalytics analytics;

  FirebaseAnalyticsObserverInfoImpl({
    required this.analytics,
  });

  @override
  FirebaseAnalyticsObserver get analyticsObserver =>
      FirebaseAnalyticsObserver(analytics: analytics);
}
