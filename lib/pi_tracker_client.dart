import 'models/core_models.dart';
import 'pi_tracker_client_platform_interface.dart';

class PiTrackerClient {
  Future<bool> trackerServiceExists() async {
    return PiTrackerClientPlatform.instance.trackerServiceExists();
  }

  Future<StateBase> getMyConfig() async {
    return PiTrackerClientPlatform.instance.getMyConfig();
  }

  Future<StateBase> setMyConfig(PackageConfig config) async {
    return PiTrackerClientPlatform.instance.setMyConfig(config);
  }
}
