part of 'core_models.dart';

@JsonSerializable()
class LogPostConfig extends ApiConfig {
  LogPostConfig({
    required super.postUrl,
    super.authToken,
    super.queryParamList,
    super.headerParamList,
    super.requestBodyParamList,
  });

  factory LogPostConfig.fromJson(Map<String, dynamic> json) => _$LogPostConfigFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LogPostConfigToJson(this);
}
