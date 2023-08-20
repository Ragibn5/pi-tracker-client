part of 'core_models.dart';

@JsonSerializable()
class LocationPostConfig extends ApiConfig {
  final List<DailyOperationHours> dailyOperationHoursList;

  LocationPostConfig({
    required super.postUrl,
    super.authToken,
    super.queryParamList,
    super.headerParamList,
    super.requestBodyParamList,
    required this.dailyOperationHoursList,
  });

  factory LocationPostConfig.fromJson(Map<String, dynamic> json) => _$LocationPostConfigFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationPostConfigToJson(this);
}
