import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:udevs_task/views/home/home_cubit/home_cubit.dart';
import 'package:udevs_task/views/home/home_page.dart';
import 'package:udevs_task/views/main_view/main_view.dart';
import 'package:udevs_task/views/main_view/main_view_cubit/main_view_cubit.dart';
import 'package:udevs_task/views/onboarding/onboarding_page.dart';
import 'package:udevs_task/views/task/task_cubit/task_cubit.dart';

import '../main.dart';

class AppRoutes {
  static final AppRoutes _inherentce = AppRoutes._init();

  static AppRoutes get inherentce => _inherentce;

  AppRoutes._init();

  final GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      routes: [
        /// # Onboarding
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => const OnboardingPage(),
        ),

        /// # MainView
        GoRoute(
          path: '/MainView',
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => MainViewCubit(),
              child: const MainView(),
            );
          },
        ),
      ]
  );
}