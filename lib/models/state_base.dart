part of 'core_models.dart';

@JsonSerializable()
class StateBase {
  final String packageName;
  final int code;
  final bool success;
  final String? data;

  StateBase({required this.packageName, required this.code, required this.success, this.data});

  factory StateBase.fromJson(Map<String, dynamic> json) => _$StateBaseFromJson(json);

  Map<String, dynamic> toJson() => _$StateBaseToJson(this);
}
