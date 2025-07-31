// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crypto_parameters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CryptoParameters _$CryptoParametersFromJson(Map<String, dynamic> json) {
  return _CryptoParameters.fromJson(json);
}

/// @nodoc
mixin _$CryptoParameters {
  @JsonKey(includeIfNull: false)
  String? get vsCurrency => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  String? get order => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(includeIfNull: false)
  int get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CryptoParametersCopyWith<CryptoParameters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CryptoParametersCopyWith<$Res> {
  factory $CryptoParametersCopyWith(
          CryptoParameters value, $Res Function(CryptoParameters) then) =
      _$CryptoParametersCopyWithImpl<$Res, CryptoParameters>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? vsCurrency,
      @JsonKey(includeIfNull: false) String? order,
      @JsonKey(includeIfNull: false) int perPage,
      @JsonKey(includeIfNull: false) int page});
}

/// @nodoc
class _$CryptoParametersCopyWithImpl<$Res, $Val extends CryptoParameters>
    implements $CryptoParametersCopyWith<$Res> {
  _$CryptoParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vsCurrency = freezed,
    Object? order = freezed,
    Object? perPage = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      vsCurrency: freezed == vsCurrency
          ? _value.vsCurrency
          : vsCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CryptoParametersImplCopyWith<$Res>
    implements $CryptoParametersCopyWith<$Res> {
  factory _$$CryptoParametersImplCopyWith(_$CryptoParametersImpl value,
          $Res Function(_$CryptoParametersImpl) then) =
      __$$CryptoParametersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String? vsCurrency,
      @JsonKey(includeIfNull: false) String? order,
      @JsonKey(includeIfNull: false) int perPage,
      @JsonKey(includeIfNull: false) int page});
}

/// @nodoc
class __$$CryptoParametersImplCopyWithImpl<$Res>
    extends _$CryptoParametersCopyWithImpl<$Res, _$CryptoParametersImpl>
    implements _$$CryptoParametersImplCopyWith<$Res> {
  __$$CryptoParametersImplCopyWithImpl(_$CryptoParametersImpl _value,
      $Res Function(_$CryptoParametersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vsCurrency = freezed,
    Object? order = freezed,
    Object? perPage = null,
    Object? page = null,
  }) {
    return _then(_$CryptoParametersImpl(
      vsCurrency: freezed == vsCurrency
          ? _value.vsCurrency
          : vsCurrency // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CryptoParametersImpl implements _CryptoParameters {
  const _$CryptoParametersImpl(
      {@JsonKey(includeIfNull: false) this.vsCurrency,
      @JsonKey(includeIfNull: false) this.order,
      @JsonKey(includeIfNull: false) this.perPage = AppConstants.perPage,
      @JsonKey(includeIfNull: false) this.page = 1});

  factory _$CryptoParametersImpl.fromJson(Map<String, dynamic> json) =>
      _$$CryptoParametersImplFromJson(json);

  @override
  @JsonKey(includeIfNull: false)
  final String? vsCurrency;
  @override
  @JsonKey(includeIfNull: false)
  final String? order;
  @override
  @JsonKey(includeIfNull: false)
  final int perPage;
  @override
  @JsonKey(includeIfNull: false)
  final int page;

  @override
  String toString() {
    return 'CryptoParameters(vsCurrency: $vsCurrency, order: $order, perPage: $perPage, page: $page)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CryptoParametersImpl &&
            (identical(other.vsCurrency, vsCurrency) ||
                other.vsCurrency == vsCurrency) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, vsCurrency, order, perPage, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CryptoParametersImplCopyWith<_$CryptoParametersImpl> get copyWith =>
      __$$CryptoParametersImplCopyWithImpl<_$CryptoParametersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CryptoParametersImplToJson(
      this,
    );
  }
}

abstract class _CryptoParameters implements CryptoParameters {
  const factory _CryptoParameters(
      {@JsonKey(includeIfNull: false) final String? vsCurrency,
      @JsonKey(includeIfNull: false) final String? order,
      @JsonKey(includeIfNull: false) final int perPage,
      @JsonKey(includeIfNull: false) final int page}) = _$CryptoParametersImpl;

  factory _CryptoParameters.fromJson(Map<String, dynamic> json) =
      _$CryptoParametersImpl.fromJson;

  @override
  @JsonKey(includeIfNull: false)
  String? get vsCurrency;
  @override
  @JsonKey(includeIfNull: false)
  String? get order;
  @override
  @JsonKey(includeIfNull: false)
  int get perPage;
  @override
  @JsonKey(includeIfNull: false)
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$CryptoParametersImplCopyWith<_$CryptoParametersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
