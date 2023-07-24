part of 'core_models.dart';

@JsonSerializable()
class PackageConfig {
  String? dataPostUrl;
  String? requestMethod;

  String? authToken;
  String? refreshToken;

  int? locationFetchPulseTime;
  List<DailyOperationHours>? dailyOperationHoursList;

  List<Param>? queryParamList;
  List<Param>? headerParamList;
  List<Param>? requestBodyParamList;

  // Required empty constructor
  PackageConfig();

  factory PackageConfig.fromJson(Map<String, dynamic> json) => _$PackageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PackageConfigToJson(this);
}
