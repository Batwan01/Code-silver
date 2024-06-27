
import 'package:code_sliver/src/views/chat_view.dart';
import 'package:code_sliver/src/views/job_view.dart';
import 'package:code_sliver/src/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/views/home_view.dart';
import 'package:code_sliver/src/widget/bar/bottom_navi_bar/bottom_navi_bar.dart';

///
/// NaviBar에서 tab처렁 go_router를 동작시키기 위한 class
class RoutePage {
  static List<Widget> rootPageList = const [
    HomeView(),
    JobView(),
    ChatView(),
    ProfileView(),
  ];

  static Page buildPage({required int pageIdx, required BuildContext context, String? pathValialbe}) {
    Widget curSurfaceView = rootPageList[pageIdx];


  
    NoTransitionPage noTransitionPage = NoTransitionPage(
      child: Builder(
        builder: (context) {
          
          return Scaffold(
            body: curSurfaceView,
            bottomNavigationBar: BottomNaviBar(
              curIdx: pageIdx,
              callback: (int idx) {
                switch (idx) {
                  case 0:
                    context.go(HomeView.routeName);
                    break;
                  case 1:
                    context.go(JobView.routeName);
                    break;
                  case 2:
                    context.go(ChatView.routeName);
                    break;
                  case 3:
                    context.go(ProfileView.routeName);
                    break;
                }
              },
            ),
          );
        }
      ),
    );

    return noTransitionPage;
  }
}
