import 'package:pi_tracker_client/contracts/json_impl_provider.dart';

class StateBase extends JsonImplProvider {
  final String packageName;
  final int code;
  final bool success;
  final String? data;

  StateBase({required this.packageName, required this.code, required this.success, this.data});

  @override
  toJson() {
    return {'code': code, 'success': success, 'data': data};
  }

  static StateBase fromJson(json) {
    return StateBase(packageName: json['packageName'], code: json['code'], success: json['success'], data: json['data']);
  }
}
