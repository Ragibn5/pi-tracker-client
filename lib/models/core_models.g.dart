// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyOperationHours _$DailyOperationHoursFromJson(Map<String, dynamic> json) => DailyOperationHours(
      json['dayOfWeek'] as int,
      (json['hours'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$DailyOperationHoursToJson(DailyOperationHours instance) => <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'hours': instance.hours,
    };

PackageConfig _$PackageConfigFromJson(Map<String, dynamic> json) => PackageConfig()
  ..dataPostUrl = json['dataPostUrl'] as String?
  ..requestMethod = json['requestMethod'] as String?
  ..authToken = json['authToken'] as String?
  ..refreshToken = json['refreshToken'] as String?
  ..locationFetchPulseTime = json['locationFetchPulseTime'] as int?
  ..dailyOperationHoursList = (json['dailyOperationHoursList'] as List<dynamic>?)
      ?.map((e) => DailyOperationHours.fromJson(e as Map<String, dynamic>))
      .toList()
  ..queryParamList = (json['queryParamList'] as List<dynamic>?)?.map((e) => Param.fromJson(e as Map<String, dynamic>)).toList()
  ..headerParamList =
      (json['headerParamList'] as List<dynamic>?)?.map((e) => Param.fromJson(e as Map<String, dynamic>)).toList()
  ..requestBodyParamList =
      (json['requestBodyParamList'] as List<dynamic>?)?.map((e) => Param.fromJson(e as Map<String, dynamic>)).toList();

Map<String, dynamic> _$PackageConfigToJson(PackageConfig instance) => <String, dynamic>{
      'dataPostUrl': instance.dataPostUrl,
      'requestMethod': instance.requestMethod,
      'authToken': instance.authToken,
      'refreshToken': instance.refreshToken,
      'locationFetchPulseTime': instance.locationFetchPulseTime,
      'dailyOperationHoursList': instance.dailyOperationHoursList,
      'queryParamList': instance.queryParamList,
      'headerParamList': instance.headerParamList,
      'requestBodyParamList': instance.requestBodyParamList,
    };

Param _$ParamFromJson(Map<String, dynamic> json) => Param(
      json['key'] as String,
      json['value'],
    );

Map<String, dynamic> _$ParamToJson(Param instance) => <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

StateBase _$StateBaseFromJson(Map<String, dynamic> json) => StateBase(
      packageName: json['packageName'] as String,
      code: json['code'] as int,
      success: json['success'] as bool,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$StateBaseToJson(StateBase instance) => <String, dynamic>{
      'packageName': instance.packageName,
      'code': instance.code,
      'success': instance.success,
      'data': instance.data,
    };
