import 'package:code_sliver/src/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/config/language_config.dart';
import 'package:code_sliver/src/common/http/custom_dio.dart';
import 'package:code_sliver/src/common/routes/route_config.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/views/common/splash_view.dart';

class RootView extends ConsumerStatefulWidget {
  const RootView({super.key});

  @override
  ConsumerState<RootView> createState() => _RootViewState();
}

class _RootViewState extends ConsumerState<RootView> {
  String initialPath = SplashView.routeName;

  @override
  void initState() {
    initialPath = SplashView.routeName; // 최초에만 스플래시 설정

    /// Dio 인스턴스화
    CustomDio customDio = CustomDio();
    customDio.init();

    LanguageConfig();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GoRouter goRouter = GoRouter(
      routes: RouteConfig().routeList(),
      initialLocation: initialPath,
      redirect: (context, state) async {
        if (SplashView.isSplashShowed) {
          initialPath = HomeView.routeName; // 이미 스플래시를 봤다면 root경로로 보내주자.
        }

        return null;
      },
    );

    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
        primarySwatch: CustomColor.createMaterialColor(CustomColor.sf_green),
      ),
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ko', 'KR'), // Korean, no country code
      ],
      locale: const Locale('ko', "KR"),
    );
  }
}
