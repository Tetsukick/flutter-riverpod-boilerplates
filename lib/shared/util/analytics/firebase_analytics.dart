import 'dart:developer';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

import 'analytics_event_entity.dart';
import 'analytics_parameters.dart';

class FirebaseAnalyticsUtils {
  static final analytics = FirebaseAnalytics.instance;

  static void login({
    required String userId, String? email, String? phoneNumber,}) {
    if (FirebaseAnalyticsUtils._canTrack()) {
      FirebaseAnalyticsUtils.analytics.logLogin();
      FirebaseAnalyticsUtils.analytics.setUserId(id: userId);
      if (email != null) {
        FirebaseAnalyticsUtils.analytics.setUserProperty(
          name: 'Email',
          value: email,
        );
      }
      if (phoneNumber != null) {
        FirebaseAnalyticsUtils.analytics.setUserProperty(
          name: 'phone',
          value: phoneNumber,
        );
      }
    }
  }

  static void screenTrack(AnalyticsScreen screen) {
    if (FirebaseAnalyticsUtils._canTrack()) {
      FirebaseAnalyticsUtils.analytics
          .setCurrentScreen(screenName: screen.name);
    }
  }

  static void eventsTrack(AnalyticsItem item) {
    if (FirebaseAnalyticsUtils._canTrack()) {
      final entity = AnalyticsEventEntity.fromAnalyticsItem(item);
      try {
        FirebaseAnalyticsUtils.analytics.logEvent(
          name: entity.name ?? '',
          parameters: entity.analyticsEventDetail?.toJson(),
        );
      } catch (e) {
        log('Analytic Error: $e' );
      }
    }
  }

  static bool _canTrack() {
    if (kIsWeb) {
      return false;
    }
    if (Platform.isIOS) {
      return AppTrackingTransparency.trackingAuthorizationStatus ==
          TrackingStatus.authorized;
    } else if (Platform.isAndroid) {
      return true;
    } else {
      return false;
    }
  }
}