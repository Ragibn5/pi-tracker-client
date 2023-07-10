import 'package:pi_tracker_client/contracts/json_impl_provider.dart';

class DailyOperationHours extends JsonImplProvider {
  final int dayOfWeek;
  final List<int> hours;

  DailyOperationHours(this.dayOfWeek, this.hours);

  @override
  dynamic toJson() {
    return {
      'dayOfWeek': dayOfWeek,
      'hours': hours,
    };
  }

  static DailyOperationHours fromJson(json) {
    return DailyOperationHours(
      json['dayOfWeek'],
      json['hours'],
    );
  }
}
