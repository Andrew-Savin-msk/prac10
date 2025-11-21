import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:prac10/features/goals/app_router.dart';
import 'package:prac10/features/goals/services/goal_service.dart';
import 'package:prac10/features/achievements/services/achievement_service.dart';
import 'package:prac10/features/account/services/account_service.dart';
import 'package:prac10/features/activity_log/services/activity_log_service.dart';
import 'package:prac10/features/focus/services/focus_session_service.dart';
import 'package:prac10/features/tips/services/tips_service.dart';
import 'package:prac10/features/support/services/support_service.dart';

void main() {
  GetIt.I.registerLazySingleton<AchievementService>(() => AchievementService());
  GetIt.I.registerLazySingleton<AccountService>(() => AccountService());
  GetIt.I.registerLazySingleton<ActivityLogService>(() => ActivityLogService());
  GetIt.I.registerLazySingleton<FocusSessionService>(() => FocusSessionService());
  GetIt.I.registerLazySingleton<TipsService>(() => TipsService());
  GetIt.I.registerLazySingleton<SupportService>(() => SupportService());
  GetIt.I.registerSingleton<GoalService>(GoalService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = buildRouter();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Goals',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      routerConfig: router,
    );
  }
}

