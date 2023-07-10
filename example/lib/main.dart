import 'package:flutter/material.dart';
import 'package:pi_tracker_client/models/daily_operation_hours.dart';
import 'package:pi_tracker_client/models/package_config.dart';
import 'package:pi_tracker_client/models/param.dart';
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

              PackageConfig config = PackageConfig();
              config.dataPostUrl = "https://helo_guys";
              config.requestMethod = "post";
              config.dailyOperationHoursList = [
                DailyOperationHours(DateTime.monday, [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]),
                DailyOperationHours(DateTime.tuesday, [0, 1, 2, 3, 4, 5, 6, 7, 8]),
                DailyOperationHours(DateTime.wednesday, [0, 1, 2, 3, 4, 5, 6, 7]),
              ];
              config.headerParamList = [
                Param.create('Authorization', 'Bearer AdebybduygUIYUYEGUYyguyguTYGYTfyFtfFtyfytFfDttu'),
                Param.create('Type', 'text/plian'),
              ];
              config.queryParamList = [
                Param.create('qint', 1),
                Param.create('qdouble', 1.1),
                Param.create('qstring', 'a string'),
              ];
              config.requestBodyParamList = [
                Param.create('bint', 1),
                Param.create('bdouble', 1.1),
                Param.create('bstring', 'a string'),
              ];
              var result = await _piTrackerClientPlugin.setMyConfig(config);
              print(result);

              var myConfig = await _piTrackerClientPlugin.getMyConfig();
              print(myConfig);
            },
            child: const Text("Send Config"),
          ),
        ),
      ),
    );
  }
}
