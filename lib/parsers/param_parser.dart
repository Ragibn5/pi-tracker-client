import 'dart:core';

import 'package:pi_tracker_client/models/param.dart';
import 'package:pi_tracker_client/parsers/primitive_types_parser.dart';

class ParamParser extends PrimitiveTypesParser {
  Param? parse(String data) {
    RegExp exp = RegExp("^([a-zA-Z]+):([a-zA-Z]+):(.+)\$");
    if (!exp.hasMatch(data)) {
      throw const FormatException("Input does not match the expected regex format: "
          "^([a-zA-Z]+):([a-zA-Z]+):(.+)\$");
    } else {
      List<String> parts = data.split(":");
      return Param.create(parts[0], getParsedValue(parts[1], parts[2]));
    }
  }

  Object getParsedValue(String typeName, String valueStr) {
    switch (typeName) {
      case "bool":
        return parseBool(valueStr);
      case "int":
        return parseLongInt(valueStr);
      case "double":
        return parseDouble(valueStr);
      case "string":
        return valueStr;
      default:
        throw const FormatException(
          "Invalid type: only int(8 byte), bool, double & string are supported",
        );
    }
  }
}
