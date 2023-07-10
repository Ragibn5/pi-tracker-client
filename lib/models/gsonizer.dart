/// Only primitive types and their lists are supported.
abstract class Gsonizer {
  void toJson();

  String? getPart(String key, dynamic value, {bool isLast = false}) {
    return value != null ? '${value != null ? gsonFormat(key, value) : ''}${(!isLast ? ',' : '')}' : '';
  }

  String gsonFormat(String? key, dynamic value) {
    if (value is List) {
      if (key != null) {
        return '"$key":${_buildListStringFormat(value)}';
      } else {
        return _buildListStringFormat(value);
      }
    } else {
      if (key != null) {
        return '"$key":${_gsonPrimitiveFormat(value)}';
      } else {
        return _gsonPrimitiveFormat(value);
      }
    }
  }

  String _buildListStringFormat(List<dynamic> list) {
    StringBuffer buffer = StringBuffer('[');
    for (int i = 0; i < list.length; ++i) {
      buffer.write(gsonFormat(null, list));
      if (i < list.length - 1) {
        buffer.write(',');
      }
    }
    buffer.write(']');

    return buffer.toString();
  }

  String _gsonPrimitiveFormat(dynamic value) {
    if (value is bool || value is int || value is double) {
      return '$value';
    } else if (value is String) {
      return '"$value"';
    } else {
      throw const FormatException("Only primitive types and their lists are supported.");
    }
  }
}
