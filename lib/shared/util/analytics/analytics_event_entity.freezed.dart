// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsEventEntity _$AnalyticsEventEntityFromJson(Map<String, dynamic> json) {
  return _AnalyticsEventEntity.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsEventEntity {
  String? get name => throw _privateConstructorUsedError;
  AnalyticsEventAnalyticsEventDetail? get analyticsEventDetail =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsEventEntityCopyWith<AnalyticsEventEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsEventEntityCopyWith<$Res> {
  factory $AnalyticsEventEntityCopyWith(AnalyticsEventEntity value,
          $Res Function(AnalyticsEventEntity) then) =
      _$AnalyticsEventEntityCopyWithImpl<$Res, AnalyticsEventEntity>;
  @useResult
  $Res call(
      {String? name, AnalyticsEventAnalyticsEventDetail? analyticsEventDetail});

  $AnalyticsEventAnalyticsEventDetailCopyWith<$Res>? get analyticsEventDetail;
}

/// @nodoc
class _$AnalyticsEventEntityCopyWithImpl<$Res,
        $Val extends AnalyticsEventEntity>
    implements $AnalyticsEventEntityCopyWith<$Res> {
  _$AnalyticsEventEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? analyticsEventDetail = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      analyticsEventDetail: freezed == analyticsEventDetail
          ? _value.analyticsEventDetail
          : analyticsEventDetail // ignore: cast_nullable_to_non_nullable
              as AnalyticsEventAnalyticsEventDetail?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AnalyticsEventAnalyticsEventDetailCopyWith<$Res>? get analyticsEventDetail {
    if (_value.analyticsEventDetail == null) {
      return null;
    }

    return $AnalyticsEventAnalyticsEventDetailCopyWith<$Res>(
        _value.analyticsEventDetail!, (value) {
      return _then(_value.copyWith(analyticsEventDetail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsEventEntityImplCopyWith<$Res>
    implements $AnalyticsEventEntityCopyWith<$Res> {
  factory _$$AnalyticsEventEntityImplCopyWith(_$AnalyticsEventEntityImpl value,
          $Res Function(_$AnalyticsEventEntityImpl) then) =
      __$$AnalyticsEventEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name, AnalyticsEventAnalyticsEventDetail? analyticsEventDetail});

  @override
  $AnalyticsEventAnalyticsEventDetailCopyWith<$Res>? get analyticsEventDetail;
}

/// @nodoc
class __$$AnalyticsEventEntityImplCopyWithImpl<$Res>
    extends _$AnalyticsEventEntityCopyWithImpl<$Res, _$AnalyticsEventEntityImpl>
    implements _$$AnalyticsEventEntityImplCopyWith<$Res> {
  __$$AnalyticsEventEntityImplCopyWithImpl(_$AnalyticsEventEntityImpl _value,
      $Res Function(_$AnalyticsEventEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? analyticsEventDetail = freezed,
  }) {
    return _then(_$AnalyticsEventEntityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      analyticsEventDetail: freezed == analyticsEventDetail
          ? _value.analyticsEventDetail
          : analyticsEventDetail // ignore: cast_nullable_to_non_nullable
              as AnalyticsEventAnalyticsEventDetail?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsEventEntityImpl implements _AnalyticsEventEntity {
  const _$AnalyticsEventEntityImpl({this.name, this.analyticsEventDetail});

  factory _$AnalyticsEventEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsEventEntityImplFromJson(json);

  @override
  final String? name;
  @override
  final AnalyticsEventAnalyticsEventDetail? analyticsEventDetail;

  @override
  String toString() {
    return 'AnalyticsEventEntity(name: $name, analyticsEventDetail: $analyticsEventDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsEventEntityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.analyticsEventDetail, analyticsEventDetail) ||
                other.analyticsEventDetail == analyticsEventDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, analyticsEventDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsEventEntityImplCopyWith<_$AnalyticsEventEntityImpl>
      get copyWith =>
          __$$AnalyticsEventEntityImplCopyWithImpl<_$AnalyticsEventEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsEventEntityImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsEventEntity implements AnalyticsEventEntity {
  const factory _AnalyticsEventEntity(
          {final String? name,
          final AnalyticsEventAnalyticsEventDetail? analyticsEventDetail}) =
      _$AnalyticsEventEntityImpl;

  factory _AnalyticsEventEntity.fromJson(Map<String, dynamic> json) =
      _$AnalyticsEventEntityImpl.fromJson;

  @override
  String? get name;
  @override
  AnalyticsEventAnalyticsEventDetail? get analyticsEventDetail;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsEventEntityImplCopyWith<_$AnalyticsEventEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AnalyticsEventAnalyticsEventDetail _$AnalyticsEventAnalyticsEventDetailFromJson(
    Map<String, dynamic> json) {
  return _AnalyticsEventAnalyticsEventDetail.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsEventAnalyticsEventDetail {
  String? get id => throw _privateConstructorUsedError;
  String? get screen => throw _privateConstructorUsedError;
  String? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AnalyticsEventAnalyticsEventDetailCopyWith<
          AnalyticsEventAnalyticsEventDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsEventAnalyticsEventDetailCopyWith<$Res> {
  factory $AnalyticsEventAnalyticsEventDetailCopyWith(
          AnalyticsEventAnalyticsEventDetail value,
          $Res Function(AnalyticsEventAnalyticsEventDetail) then) =
      _$AnalyticsEventAnalyticsEventDetailCopyWithImpl<$Res,
          AnalyticsEventAnalyticsEventDetail>;
  @useResult
  $Res call({String? id, String? screen, String? item});
}

/// @nodoc
class _$AnalyticsEventAnalyticsEventDetailCopyWithImpl<$Res,
        $Val extends AnalyticsEventAnalyticsEventDetail>
    implements $AnalyticsEventAnalyticsEventDetailCopyWith<$Res> {
  _$AnalyticsEventAnalyticsEventDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screen = freezed,
    Object? item = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsEventAnalyticsEventDetailImplCopyWith<$Res>
    implements $AnalyticsEventAnalyticsEventDetailCopyWith<$Res> {
  factory _$$AnalyticsEventAnalyticsEventDetailImplCopyWith(
          _$AnalyticsEventAnalyticsEventDetailImpl value,
          $Res Function(_$AnalyticsEventAnalyticsEventDetailImpl) then) =
      __$$AnalyticsEventAnalyticsEventDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? screen, String? item});
}

/// @nodoc
class __$$AnalyticsEventAnalyticsEventDetailImplCopyWithImpl<$Res>
    extends _$AnalyticsEventAnalyticsEventDetailCopyWithImpl<$Res,
        _$AnalyticsEventAnalyticsEventDetailImpl>
    implements _$$AnalyticsEventAnalyticsEventDetailImplCopyWith<$Res> {
  __$$AnalyticsEventAnalyticsEventDetailImplCopyWithImpl(
      _$AnalyticsEventAnalyticsEventDetailImpl _value,
      $Res Function(_$AnalyticsEventAnalyticsEventDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? screen = freezed,
    Object? item = freezed,
  }) {
    return _then(_$AnalyticsEventAnalyticsEventDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      screen: freezed == screen
          ? _value.screen
          : screen // ignore: cast_nullable_to_non_nullable
              as String?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsEventAnalyticsEventDetailImpl
    implements _AnalyticsEventAnalyticsEventDetail {
  const _$AnalyticsEventAnalyticsEventDetailImpl(
      {this.id, this.screen, this.item});

  factory _$AnalyticsEventAnalyticsEventDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AnalyticsEventAnalyticsEventDetailImplFromJson(json);

  @override
  final String? id;
  @override
  final String? screen;
  @override
  final String? item;

  @override
  String toString() {
    return 'AnalyticsEventAnalyticsEventDetail(id: $id, screen: $screen, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsEventAnalyticsEventDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.screen, screen) || other.screen == screen) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, screen, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsEventAnalyticsEventDetailImplCopyWith<
          _$AnalyticsEventAnalyticsEventDetailImpl>
      get copyWith => __$$AnalyticsEventAnalyticsEventDetailImplCopyWithImpl<
          _$AnalyticsEventAnalyticsEventDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsEventAnalyticsEventDetailImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsEventAnalyticsEventDetail
    implements AnalyticsEventAnalyticsEventDetail {
  const factory _AnalyticsEventAnalyticsEventDetail(
      {final String? id,
      final String? screen,
      final String? item}) = _$AnalyticsEventAnalyticsEventDetailImpl;

  factory _AnalyticsEventAnalyticsEventDetail.fromJson(
          Map<String, dynamic> json) =
      _$AnalyticsEventAnalyticsEventDetailImpl.fromJson;

  @override
  String? get id;
  @override
  String? get screen;
  @override
  String? get item;
  @override
  @JsonKey(ignore: true)
  _$$AnalyticsEventAnalyticsEventDetailImplCopyWith<
          _$AnalyticsEventAnalyticsEventDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
