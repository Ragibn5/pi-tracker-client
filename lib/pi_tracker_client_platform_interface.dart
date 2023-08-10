import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'models/core_models.dart';
import 'pi_tracker_client_method_channel.dart';

abstract class PiTrackerClientPlatform extends PlatformInterface {
  static final Object _token = Object();
  static PiTrackerClientPlatform _instance = MethodChannelPiTrackerClient();

  PiTrackerClientPlatform() : super(token: _token);

  static PiTrackerClientPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PiTrackerClientPlatform] when
  /// they register themselves.
  static set instance(PiTrackerClientPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// ////////////////////////////
  /// Start defining user methods
  /// ////////////////////////////

  Future<bool> trackerServiceExists() {
    throw UnimplementedError('pingTrackerService() has not been implemented.');
  }

  Future<StateBase> getMyConfig() {
    throw UnimplementedError('getMyConfig() has not been implemented.');
  }

  Future<StateBase> setMyConfig(PackageConfig config) {
    throw UnimplementedError('setMyConfig(config) has not been implemented.');
  }

  Future<StateBase> requestOpenPermissionManagerActivity() async {
    throw UnimplementedError('requestOpenPermissionManagerActivity() has not been implemented.');
  }
}
