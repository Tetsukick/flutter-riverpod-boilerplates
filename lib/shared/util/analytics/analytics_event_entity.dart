import 'package:freezed_annotation/freezed_annotation.dart';

import 'analytics_parameters.dart';

part 'analytics_event_entity.freezed.dart';
part 'analytics_event_entity.g.dart';

@freezed
class AnalyticsEventEntity with _$AnalyticsEventEntity {
  const factory AnalyticsEventEntity({
    String? name,
    AnalyticsEventAnalyticsEventDetail? analyticsEventDetail,
  }) = _AnalyticsEventEntity;

  factory AnalyticsEventEntity.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsEventEntityFromJson(json);

  static AnalyticsEventEntity fromAnalyticsItem(AnalyticsItem item) {
    return AnalyticsEventEntity(
      name: item.name,
      analyticsEventDetail: AnalyticsEventAnalyticsEventDetail(
        id: item.id,
        screen: item.screen.name,
        item: item.shortName,
      ),
    );
  }
}

@freezed
class AnalyticsEventAnalyticsEventDetail
    with _$AnalyticsEventAnalyticsEventDetail {
  const factory AnalyticsEventAnalyticsEventDetail({
    String? id,
    String? screen,
    String? item,
  }) = _AnalyticsEventAnalyticsEventDetail;

  factory AnalyticsEventAnalyticsEventDetail.fromJson(
      Map<String, dynamic> json,
      ) =>
      _$AnalyticsEventAnalyticsEventDetailFromJson(json);
}