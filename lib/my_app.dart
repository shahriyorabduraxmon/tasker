import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:udevs_task/router/router.dart';

import 'core/constants/app_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        builder: (context, child) {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.white,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
          );
          return MaterialApp.router(
            routeInformationProvider: AppRoutes.inherentce.router.routeInformationProvider,
            routeInformationParser: AppRoutes.inherentce.router.routeInformationParser,
            routerDelegate: AppRoutes.inherentce.router.routerDelegate,
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            title: 'UDEVS Task',
            theme: ThemeData(
              fontFamily: "Rubik",
              inputDecorationTheme: const InputDecorationTheme(
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.cF9FCFF,
                  ),
                ),
              ),
              scaffoldBackgroundColor: AppColor.cF9FCFF,
            ),
          );
        }
    );
  }
}