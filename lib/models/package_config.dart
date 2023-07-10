import 'package:pi_tracker_client/contracts/json_impl_provider.dart';
import 'package:pi_tracker_client/models/daily_operation_hours.dart';
import 'package:pi_tracker_client/models/param.dart';

class PackageConfig extends JsonImplProvider {
  String? dataPostUrl;
  String? requestMethod;

  List<DailyOperationHours>? dailyOperationHoursList;

  List<Param>? queryParamList;
  List<Param>? headerParamList;
  List<Param>? requestBodyParamList;

  @override
  dynamic toJson() {
    return {
      'dataPostUrl': dataPostUrl,
      'requestMethod': requestMethod,
      'dailyOperationHoursList': (dailyOperationHoursList ?? []).map((e) => e.toJson()).toList(),
      'queryParamList': (queryParamList ?? []).map((e) => e.toJson()).toList(),
      'headerParamList': (headerParamList ?? []).map((e) => e.toJson()).toList(),
      'requestBodyParamList': (requestBodyParamList ?? []).map((e) => e.toJson()).toList()
    };
  }

  static PackageConfig fromJson(json) {
    PackageConfig config = PackageConfig();
    config.dataPostUrl = json['dataPostUrl'];
    config.requestMethod = json['requestMethod'];
    config.dailyOperationHoursList =
        (json['dailyOperationHoursList'] as List).map((e) => DailyOperationHours.fromJson(e)).toList();
    config.queryParamList = (json['queryParamList'] as List).map((e) => Param.fromJson(e)).toList();
    config.headerParamList = (json['headerParamList'] as List).map((e) => Param.fromJson(e)).toList();
    config.requestBodyParamList = (json['headerParamList'] as List).map((e) => Param.fromJson(e)).toList();

    return config;
  }
}
