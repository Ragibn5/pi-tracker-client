import 'package:pi_tracker_client/contracts/json_impl_provider.dart';

class Param extends JsonImplProvider {
  final String key;
  final dynamic value;

  Param._(this.key, this.value);

  /// Only bool, int(up to 8 bytes), double & string types are supported.
  factory Param.create(String key, dynamic value) {
    if (value is bool || value is int || value is double || value is String) {
      return Param._(key, value);
    } else {
      throw const FormatException(
        "Invalid type: Only bool, int(up to 8 bytes), double & string types are supported.",
      );
    }
  }

  @override
  dynamic toJson() {
    return {
      'key': key,
      'value': value,
    };
  }

  static Param fromJson(json) {
    return Param._(json['key'], json['value']);
  }
}
