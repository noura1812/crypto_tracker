// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_parameters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CryptoParametersImpl _$$CryptoParametersImplFromJson(
        Map<String, dynamic> json) =>
    _$CryptoParametersImpl(
      vsCurrency: json['vsCurrency'] as String?,
      order: json['order'] as String?,
      perPage: (json['perPage'] as num?)?.toInt() ?? AppConstants.perPage,
      page: (json['page'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$CryptoParametersImplToJson(
        _$CryptoParametersImpl instance) =>
    <String, dynamic>{
      if (instance.vsCurrency case final value?) 'vsCurrency': value,
      if (instance.order case final value?) 'order': value,
      'perPage': instance.perPage,
      'page': instance.page,
    };
