import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'package:qwys/core/core.dart';
import 'package:qwys/di/di.dart';
import 'package:qwys/features/features.dart';

final navigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final router = GoRouter(
  navigatorKey: navigatorKey,
  observers: [TalkerRouteObserver(getIt<Talker>())],
  initialLocation: '/home',
  overridePlatformDefaultLocation: true,
  debugLogDiagnostics: kDebugGoRouter,
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/quizzes',
      pageBuilder: (context, state) => NoTransitionPage<void>(
        key: state.pageKey,
        child: const QuizzesScreen(),
      ),
      routes: [
        GoRoute(
          path: ':id',
          pageBuilder: (context, state) => NoTransitionPage<void>(
            key: state.pageKey,
            child: QuestionsScreen(
              quizId: state.pathParameters['id']!,
              quizTitle: state.uri.queryParameters['quizTitle']!,
            ),
          ),
        ),
      ],
    ),
  ],
);
