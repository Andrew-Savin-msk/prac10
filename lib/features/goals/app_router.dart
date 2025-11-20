import 'package:go_router/go_router.dart';
import 'models/goal_model.dart';
import 'screens/goals_list_screen.dart';
import 'screens/add_goal_screen.dart';
import 'screens/completed_goals_screen.dart';
import 'screens/goal_detail_screen.dart';
import 'package:prac10/features/achievements/screens/achievements_screen.dart';
import 'package:prac10/features/account/screens/login_screen.dart';
import 'package:prac10/features/account/screens/registration_screen.dart';
import 'package:prac10/features/account/screens/profile_screen.dart';
import 'package:prac10/features/account/screens/edit_profile_screen.dart';

final class Routes {
  static const goalsList = '/';
  static const addGoal = '/add-goal';
  static const achievements = '/achievements';
  static const completed = '/completed';
  static const goalDetail = '/goal-detail';
  static const login = '/login';
  static const register = '/register';
  static const profile = '/profile';
  static const editProfile = '/edit-profile';
}

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: Routes.goalsList,
    routes: [
      GoRoute(
        path: Routes.goalsList,
        name: 'goalsList',
        builder: (context, state) => GoalsListScreen(),
      ),
      GoRoute(
        path: Routes.addGoal,
        name: 'addGoal',
        builder: (context, state) => AddGoalScreen(),
      ),
      GoRoute(
        path: Routes.achievements,
        name: 'achievements',
        builder: (context, state) => AchievementsScreen(),
      ),
      GoRoute(
        path: Routes.completed,
        name: 'completed',
        builder: (context, state) => CompletedGoalsScreen(),
      ),
      GoRoute(
        path: Routes.goalDetail,
        name: 'goalDetail',
        builder: (context, state) {
          final goal = state.extra as Goal;
          return GoalDetailScreen(goal: goal);
        },
      ),
      GoRoute(
        path: Routes.login,
        name: 'login',
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.register,
        name: 'register',
        builder: (context, state) => RegistrationScreen(),
      ),
      GoRoute(
        path: Routes.profile,
        name: 'profile',
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: Routes.editProfile,
        name: 'editProfile',
        builder: (context, state) => EditProfileScreen(),
      ),
    ],
  );
}
