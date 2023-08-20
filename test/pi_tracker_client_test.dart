import 'package:flutter_test/flutter_test.dart';
import 'package:pi_tracker_client/models/core_models.dart';
import 'package:pi_tracker_client/pi_tracker_client_method_channel.dart';
import 'package:pi_tracker_client/pi_tracker_client_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPiTrackerClientPlatform with MockPlatformInterfaceMixin implements PiTrackerClientPlatform {
  @override
  Future<bool> trackerServiceExists() {
    // TODO: implement trackerServiceExists
    throw UnimplementedError();
  }

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

  @override
  Future<StateBase> requestOpenPermissionManagerActivity() {
    // TODO: implement requestOpenPermissionManagerActivity
    throw UnimplementedError();
  }
}

void main() {
  final PiTrackerClientPlatform initialPlatform = PiTrackerClientPlatform.instance;

  test('$MethodChannelPiTrackerClient is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPiTrackerClient>());
  });
}
