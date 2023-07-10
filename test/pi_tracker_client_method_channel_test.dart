import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_tracker_client/pi_tracker_client_method_channel.dart';

void main() {
  MethodChannelPiTrackerClient platform = MethodChannelPiTrackerClient();
  const MethodChannel channel = MethodChannel('pi_tracker_client');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
