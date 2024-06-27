import 'dart:developer';

import 'package:code_sliver/src/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/prefs/impl/custom_prefs.dart';
import 'package:code_sliver/src/common/theme/custom_icon.dart';
import 'package:code_sliver/src/provider/auth/auth_provider.dart';
import 'package:code_sliver/src/views/auth/login_view.dart';
import 'package:code_sliver/src/widget/layout/default_layout.dart';

class SplashView extends ConsumerStatefulWidget {
  static String get routeName => '/splash';

  static bool isSplashShowed = false;

  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  bool isDeepLinkingProc = false;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      entrance(context: context).then((value) {
        if (value) {
          if (context.mounted) {
            context.replace(HomeView.routeName);
            // if(ref.watch(authProvider)){
            //
            // }else{
            //   context.replace(LoginView.routeName);
            // }
          }
        }
      });
    });

    return WillPopScope(
      onWillPop: () async {
        log("POPOPOPOPOP");
        return false;
      },
      child: Scaffold(
          body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.green,
        child: Center(
          child: Text('LOGO 자리'),
        ),
      )),
    );
  }

  Future<bool> entrance({required BuildContext context}) async {
    await CustomPrefs().init();
    bool procFlag = false;
    bool entranceFlag = true;

    await showSplash();
    entranceFlag = await loadData(context: context);

    return entranceFlag;
  }

  Future<bool> showSplash() async {
    int waitingSec = 2;
    if (mounted) {
      // bool loginFlag = ref.read(authNotifierProvider.notifier).checkLogin();
      // if (loginFlag) {
      //   waitingSec = 0;
      // }
    }
    bool result = await Future.delayed(Duration(seconds: waitingSec, milliseconds: 100), () {
      SplashView.isSplashShowed = true;
      return true;
    });

    return result;
  }

  Future<bool> loadData({required BuildContext context}) async {
    log(
      "PROC :: LOAD DATA",
    );

    return true;
  }
}
