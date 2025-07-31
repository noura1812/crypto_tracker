import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:crypto_tracker/core/config/constants.dart';

part 'crypto_parameters.freezed.dart';
part 'crypto_parameters.g.dart';

@freezed
class CryptoParameters with _$CryptoParameters {
  const factory CryptoParameters({
    @JsonKey(includeIfNull: false) String? vsCurrency,
    @JsonKey(includeIfNull: false) String? order,
    @Default(AppConstants.perPage) @JsonKey(includeIfNull: false) int perPage,
    @Default(1) @JsonKey(includeIfNull: false) int page,
  }) = _CryptoParameters;

  factory CryptoParameters.fromJson(Map<String, dynamic> json) =>
      _$CryptoParametersFromJson(json);
}
