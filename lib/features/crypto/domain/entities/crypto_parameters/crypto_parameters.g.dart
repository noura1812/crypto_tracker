// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoParametersImpl _$$CryptoParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$CryptoParametersImpl(
      vsCurrency: json['vs_currency'] as String? ?? 'usd',
      order: json['order'] as String?,
      perPage: (json['per_page'] as num?)?.toInt() ?? AppConstants.perPage,
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$CryptoParametersImplToJson(
        _$CryptoParametersImpl instance) =>
    <String, dynamic>{
      if (instance.vsCurrency case final value?) 'vs_currency': value,
      if (instance.order case final value?) 'order': value,
      'per_page': instance.perPage,
      'page': instance.page,
    };
