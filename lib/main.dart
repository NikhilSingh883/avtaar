import 'package:avtaar/presentation/screens/detail_screen.dart';
import 'package:avtaar/presentation/screens/lessons_screen.dart';
import 'package:avtaar/provider/designProvider.dart';
import 'package:avtaar/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return OrientationBuilder(
          builder: (__, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(
                  value: DesignProvider(),
                )
              ],
              child: MaterialApp(
                title: 'Lessons',
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                ),
                debugShowCheckedModeBanner: false,
                home: LessonsScreen(),
              ),
            );
          },
        );
      },
    );
  }
}
