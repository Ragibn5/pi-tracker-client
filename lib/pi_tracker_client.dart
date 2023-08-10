import 'models/core_models.dart';
import 'pi_tracker_client_platform_interface.dart';

class PiTrackerClient {
  Future<bool> trackerServiceExists() {
    return PiTrackerClientPlatform.instance.trackerServiceExists();
  }

  Future<StateBase> getMyConfig() {
    return PiTrackerClientPlatform.instance.getMyConfig();
  }

  Future<StateBase> setMyConfig(PackageConfig config) {
    return PiTrackerClientPlatform.instance.setMyConfig(config);
  }

  Future<StateBase> requestOpenPermissionManagerActivity() {
    return PiTrackerClientPlatform.instance.requestOpenPermissionManagerActivity();
  }
}
