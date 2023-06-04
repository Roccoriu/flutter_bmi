import 'package:bmi_calculator/layout/result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../layout/calculator.dart';
import '../layout/home.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/calculator',
      builder: (context, state) => const Calculator(),
    ),
    GoRoute(
      path: '/result',
      builder: (context, state) => const Result(),
      routes: <RouteBase>[
        GoRoute(
          path: ':id',
          builder: (context, state) => RatingDetail(id: state.pathParameters['id']),
        ),
      ],
    ),
    //GoRoute(
    //  path: '/history',
    //  pageBuilder: (context, state) => const History(),
    //),
    //GoRoute(
    //  path: '/settings',
    //  pageBuilder: (context, state) => const Settings(),
    //),
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const Home(),
    ),
  ],
);
