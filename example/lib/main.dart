import 'package:flutter/material.dart';
import 'package:pi_tracker_client/constants/response_codes.dart';
import 'package:pi_tracker_client/models/core_models.dart';
import 'package:pi_tracker_client/pi_tracker_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _piTrackerClientPlugin = PiTrackerClient();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              // todo
              bool trackerPackageExists = await _piTrackerClientPlugin.trackerServiceExists();
              print(trackerPackageExists);

              LocationPostConfig locationPostConfig = LocationPostConfig(
                postUrl: "http://192.168.0.102:8080/apis/post-locations",
                dailyOperationHoursList: [
                  DailyOperationHours(DateTime.monday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                  DailyOperationHours(DateTime.tuesday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                  DailyOperationHours(DateTime.wednesday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                  DailyOperationHours(DateTime.thursday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                  DailyOperationHours(DateTime.friday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                  DailyOperationHours(DateTime.saturday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                  DailyOperationHours(DateTime.sunday, [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]),
                ],
                headerParamList: [
                  Param('Authorization', 'Bearer AdebybduygUIYUYEGUYyguyguTYGYTfyFtfFtyfytFfDttu'),
                  Param('Type', 'text/plian'),
                ],
                queryParamList: [
                  Param('qint', 1),
                  Param('qdouble', 1.1),
                  Param('qstring', 'a string'),
                ],
                requestBodyParamList: [
                  Param('bint', 1),
                  Param('bdouble', 1.1),
                  Param('bstring', 'a string'),
                ],
              );

              LogPostConfig logPostConfig = LogPostConfig(
                postUrl: "http://192.168.0.102:8080/apis/post-logs",
                headerParamList: [
                  Param('Authorization', 'Bearer AdebybduygUIYUYEGUYyguyguTYGYTfyFtfFtyfytFfDttu'),
                  Param('Type', 'text/plian'),
                ],
                queryParamList: [
                  Param('lqint', 1),
                  Param('lqdouble', 1.1),
                  Param('lqstring', 'a string'),
                ],
                requestBodyParamList: [
                  Param('lbint', 1),
                  Param('lbdouble', 1.1),
                  Param('lbstring', 'a string'),
                ],
              );

              var result = await _piTrackerClientPlugin.setMyConfig(PackageConfig(
                logPostConfig: logPostConfig,
                locationPostConfig: locationPostConfig,
              ));

              if (result.code == ResponseCodes.permissionsNotGranted) {
                var activityOpenRes = _piTrackerClientPlugin.requestOpenPermissionManagerActivity();
                print(activityOpenRes);
              } else if (result.code == ResponseCodes.createdYourConfig) {
                print("Config created: ${result.data}");
              }

              var myConfig = await _piTrackerClientPlugin.getMyConfig();
              print("My locationPostConfig: ${myConfig.data}");
            },
            child: const Text("Send Config"),
          ),
        ),
      ),
    );
  }
}
