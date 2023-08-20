// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ApiConfigToJson(ApiConfig instance) => <String, dynamic>{
      'postUrl': instance.postUrl,
      'authToken': instance.authToken,
      'queryParamList': instance.queryParamList,
      'headerParamList': instance.headerParamList,
      'requestBodyParamList': instance.requestBodyParamList,
    };

DailyOperationHours _$DailyOperationHoursFromJson(Map<String, dynamic> json) =>
    DailyOperationHours(
      json['dayOfWeek'] as int,
      (json['hours'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$DailyOperationHoursToJson(
        DailyOperationHours instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'hours': instance.hours,
    };

LocationPostConfig _$LocationPostConfigFromJson(Map<String, dynamic> json) =>
    LocationPostConfig(
      postUrl: json['postUrl'] as String,
      authToken: json['authToken'] as String?,
      queryParamList: (json['queryParamList'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
      headerParamList: (json['headerParamList'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestBodyParamList: (json['requestBodyParamList'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailyOperationHoursList: (json['dailyOperationHoursList']
              as List<dynamic>)
          .map((e) => DailyOperationHours.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationPostConfigToJson(LocationPostConfig instance) =>
    <String, dynamic>{
      'postUrl': instance.postUrl,
      'authToken': instance.authToken,
      'queryParamList': instance.queryParamList,
      'headerParamList': instance.headerParamList,
      'requestBodyParamList': instance.requestBodyParamList,
      'dailyOperationHoursList': instance.dailyOperationHoursList,
    };

LogPostConfig _$LogPostConfigFromJson(Map<String, dynamic> json) =>
    LogPostConfig(
      postUrl: json['postUrl'] as String,
      authToken: json['authToken'] as String?,
      queryParamList: (json['queryParamList'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
      headerParamList: (json['headerParamList'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestBodyParamList: (json['requestBodyParamList'] as List<dynamic>?)
          ?.map((e) => Param.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LogPostConfigToJson(LogPostConfig instance) =>
    <String, dynamic>{
      'postUrl': instance.postUrl,
      'authToken': instance.authToken,
      'queryParamList': instance.queryParamList,
      'headerParamList': instance.headerParamList,
      'requestBodyParamList': instance.requestBodyParamList,
    };

PackageConfig _$PackageConfigFromJson(Map<String, dynamic> json) =>
    PackageConfig(
      logPostConfig:
          LogPostConfig.fromJson(json['logPostConfig'] as Map<String, dynamic>),
      locationPostConfig: LocationPostConfig.fromJson(
          json['locationPostConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PackageConfigToJson(PackageConfig instance) =>
    <String, dynamic>{
      'logPostConfig': instance.logPostConfig,
      'locationPostConfig': instance.locationPostConfig,
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
