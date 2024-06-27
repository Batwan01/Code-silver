import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/provider/common/will_pop_provider.dart';
import 'package:code_sliver/src/widget/bar/app_bar/top_app_bar.dart';
import 'package:code_sliver/src/widget/bar/app_bar/top_app_bar_btn.dart';
import 'package:code_sliver/src/widget/layout/default_layout.dart';

class JobView extends ConsumerStatefulWidget {
  static String get routeName => '/job';

  const JobView({super.key});

  @override
  ConsumerState<JobView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<JobView> {
  String curSelectFilter = "";

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ref.read(willPopProvider.notifier).twiceBackAppOutHandler(context: context);
        return false;
      },
      child: DefaultLayout(
        bgColor: CustomColor.sf_100,
        topAppBar: TopAppBar(
          isLeading: false,
          color: CustomColor.sf_100,
          title: const Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Text('로고'),
            ],
          ),
          actionBtnList: [
            TopAppBarBtn(
                icon: const Icon(
                  Icons.notifications_none,
                  size: 27,
                ),
                onClick: () {}),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('JOB'),
        ]),
      ),
    );
  }
}
