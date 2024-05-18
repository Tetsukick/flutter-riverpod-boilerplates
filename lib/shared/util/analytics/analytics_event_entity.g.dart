// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytics_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsEventEntityImpl _$$AnalyticsEventEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsEventEntityImpl(
      name: json['name'] as String?,
      analyticsEventDetail: json['analyticsEventDetail'] == null
          ? null
          : AnalyticsEventAnalyticsEventDetail.fromJson(
              json['analyticsEventDetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AnalyticsEventEntityImplToJson(
        _$AnalyticsEventEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'analyticsEventDetail': instance.analyticsEventDetail,
    };

_$AnalyticsEventAnalyticsEventDetailImpl
    _$$AnalyticsEventAnalyticsEventDetailImplFromJson(
            Map<String, dynamic> json) =>
        _$AnalyticsEventAnalyticsEventDetailImpl(
          id: json['id'] as String?,
          screen: json['screen'] as String?,
          item: json['item'] as String?,
        );

Map<String, dynamic> _$$AnalyticsEventAnalyticsEventDetailImplToJson(
        _$AnalyticsEventAnalyticsEventDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'screen': instance.screen,
      'item': instance.item,
    };
