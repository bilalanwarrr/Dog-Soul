import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hunter/constant.dart';
import 'package:hunter/provider/dataProvider.dart';
import 'package:hunter/views/HomeView/HomeView.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => DataProvider())],
          child: MaterialApp(
            title: 'Dogsoul',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                    background: lightBackgroundColor),
                useMaterial3: true,
                appBarTheme:
                    AppBarTheme(backgroundColor: lightBackgroundColor)),
            home: child,
          ),
        );
      },
      child: HomeView(header: "base",),
    );
  }
}
