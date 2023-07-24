part of 'core_models.dart';

@JsonSerializable()
class Param {
  final String key;
  final dynamic value;

  /// Only bool, int(up to 8 bytes), double & string types are supported.
  Param(this.key, this.value) {
    if (!(value is bool || value is int || value is double || value is String)) {
      throw const FormatException(
        "Invalid type: Only bool, int(up to 8 bytes), double & string types are supported.",
      );
    }
  }

  factory Param.fromJson(Map<String, dynamic> json) => _$ParamFromJson(json);

  Map<String, dynamic> toJson() => _$ParamToJson(this);
}
