import 'dart:developer';

import 'package:code_sliver/src/views/chat_view.dart';
import 'package:code_sliver/src/views/common/root_view.dart';
import 'package:code_sliver/src/views/job_view.dart';
import 'package:code_sliver/src/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/routes/route_page.dart';
import 'package:code_sliver/src/views/auth/login_view.dart';
import 'package:code_sliver/src/views/home_view.dart';
import 'package:code_sliver/src/views/common/splash_view.dart';

class RouteConfig {
  static final RouteConfig _instance = RouteConfig._internal();

  factory RouteConfig() {
    return _instance;
  }

  RouteConfig._internal() {
    log("Singleton Instance Created <RouteConfig>");
  }

  List<GoRoute> routeList() {
    return [
      ///
      /// 공통 View
      GoRoute(
        path: "/",
        name: "ROOT",
        redirect: (context, state)=> HomeView.routeName
      ),
      GoRoute(
        path: SplashView.routeName,
        name: SplashView.routeName,
        builder: (context, state) => const SplashView(),
      ),


      ///
      /// @[로그인]
      GoRoute(
        path: LoginView.routeName,
        name: LoginView.routeName,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          child: const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => fadeTransition(context, animation, secondaryAnimation, child),
        ),
      ),

      GoRoute(
        path: HomeView.routeName,
        name: HomeView.routeName,
        pageBuilder: (context, state) => RoutePage.buildPage(pageIdx: 0, context: context),
        routes: [],
      ),
      GoRoute(
        path: JobView.routeName,
        name: JobView.routeName,
        pageBuilder: (context, state) => RoutePage.buildPage(pageIdx: 1, context: context),
        routes: [],
      ),
      GoRoute(
        path: ChatView.routeName,
        name: ChatView.routeName,
        pageBuilder: (context, state) => RoutePage.buildPage(pageIdx: 2, context: context),
        routes: [],
      ),

      GoRoute(
        path: ProfileView.routeName,
        name: ProfileView.routeName,
        pageBuilder: (context, state) => RoutePage.buildPage(pageIdx: 3, context: context),
      ),

    ];
  }

  Widget showUpTransition(context, animation, secondaryAnimation, child) {
    var begin = 0.0;
    var end = 2.0;

    const beginOffset = Offset(0.0, 0.2);
    const endOffset = Offset.zero;

    var curve = Curves.easeIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var tweenOffset = Tween(begin: beginOffset, end: endOffset).chain(CurveTween(curve: Curves.ease));

    return FadeTransition(
      opacity: animation.drive(tween),
      child: SlideTransition(
        position: animation.drive(tweenOffset),
        child: child,
      ),
    );
  }

  Widget fadeTransition(context, animation, secondaryAnimation, child) {
    var begin = 0.0;
    var end = 2.0;
    var curve = Curves.easeIn;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return FadeTransition(
      opacity: animation.drive(tween),
      child: child,
    );
  }
}
