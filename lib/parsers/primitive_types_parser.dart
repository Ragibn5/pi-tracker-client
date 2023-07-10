class PrimitiveTypesParser {
  bool parseBool(String boolStr) {
    switch (boolStr.trim()) {
      case "true":
        return true;
      case "false":
        return false;
      default:
        throw const FormatException("Not a valid boolean string, can either be 'true' or 'false'");
    }
  }

  int parseLongInt(String intStr) {
    try {
      return int.parse(intStr);
    } catch (e) {
      rethrow;
    }
  }

  double parseDouble(String doubleStr) {
    try {
      return double.parse(doubleStr);
    } catch (e) {
      rethrow;
    }
  }
}
