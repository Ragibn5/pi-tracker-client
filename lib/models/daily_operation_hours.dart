part of 'core_models.dart';

@JsonSerializable()
class DailyOperationHours {
  final int dayOfWeek;
  final List<int> hours;

  DailyOperationHours(this.dayOfWeek, this.hours);

  factory DailyOperationHours.fromJson(Map<String, dynamic> json) => _$DailyOperationHoursFromJson(json);

  Map<String, dynamic> toJson() => _$DailyOperationHoursToJson(this);
}
