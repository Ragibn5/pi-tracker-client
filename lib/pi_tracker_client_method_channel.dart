import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pi_tracker_client/models/package_config.dart';
import 'package:pi_tracker_client/models/state_base.dart';

import 'pi_tracker_client_platform_interface.dart';

/// An implementation of [PiTrackerClientPlatform] that uses method channels.
class MethodChannelPiTrackerClient extends PiTrackerClientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pi_tracker_client');

  /// ////////////////////////////
  /// Start defining user methods
  /// ////////////////////////////

  @override
  Future<bool> trackerServiceExists() async {
    return await methodChannel.invokeMethod<bool>('trackerServiceExists') ?? false;
  }

  @override
  Future<StateBase> getMyConfig() async {
    return _extractStateBase(await methodChannel.invokeMethod<String?>('getMyConfig'));
  }

  @override
  Future<StateBase> setMyConfig(PackageConfig config) async {
    return _extractStateBase(await methodChannel.invokeMethod<String?>(
      'setMyConfig',
      {'config': jsonEncode(config)},
    ));
  }

  StateBase _extractStateBase(String? result) {
    if (result != null) {
      return StateBase.fromJson(jsonDecode(result));
    } else {
      throw Exception('Something went wrong.');
    }
  }
}
