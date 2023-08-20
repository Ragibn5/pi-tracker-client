part of 'core_models.dart';

@JsonSerializable(createFactory: false)
class ApiConfig {
  final String postUrl;

  final String? authToken;

  final List<Param>? queryParamList;
  final List<Param>? headerParamList;
  final List<Param>? requestBodyParamList;


  ApiConfig({required this.postUrl, this.authToken, this.queryParamList, this.headerParamList, this.requestBodyParamList});

  Map<String, dynamic> toJson() => _$ApiConfigToJson(this);
}
