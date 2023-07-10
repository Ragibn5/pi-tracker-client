import 'package:flutter_test/flutter_test.dart';
import 'package:pi_tracker_client/models/package_config.dart';
import 'package:pi_tracker_client/models/state_base.dart';
import 'package:pi_tracker_client/pi_tracker_client.dart';
import 'package:pi_tracker_client/pi_tracker_client_platform_interface.dart';
import 'package:pi_tracker_client/pi_tracker_client_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPiTrackerClientPlatform
    with MockPlatformInterfaceMixin
    implements PiTrackerClientPlatform {
  @override
  Future<StateBase> getMyConfig() {
    // TODO: implement getMyConfig
    throw UnimplementedError();
  }

  @override
  Future<StateBase> setMyConfig(PackageConfig config) {
    // TODO: implement setMyConfig
    throw UnimplementedError();
  }
}

void main() {
  final PiTrackerClientPlatform initialPlatform = PiTrackerClientPlatform.instance;

  test('$MethodChannelPiTrackerClient is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPiTrackerClient>());
  });
}
