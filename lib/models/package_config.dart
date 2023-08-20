part of 'core_models.dart';

@JsonSerializable()
class PackageConfig {
  final LogPostConfig logPostConfig;
  final LocationPostConfig locationPostConfig;


  PackageConfig({required this.logPostConfig, required this.locationPostConfig});

  factory PackageConfig.fromJson(Map<String, dynamic> json) => _$PackageConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PackageConfigToJson(this);
}
