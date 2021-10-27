import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskmanager/common/utils/date_time_util.dart';
import 'package:taskmanager/screens/wrapper/wrapper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DateTimeUtils.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () {
        return MaterialApp(
          title: 'Task Manager',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const WrapperScreen(),
        );
      },
    );
  }
}
