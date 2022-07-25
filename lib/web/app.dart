import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/responsive/devices/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/constants.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WebApp extends StatefulWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  State<WebApp> createState() => _WebAppState();
}

class _WebAppState extends State<WebApp> {
  final _appRouter = AkwaabaUserRoutes();
  @override
  void dispose() {
    // _themeManagerCtx.removeListener(themeListener);
    // _loginViewModel.removeListener(loginListener);
    super.dispose();
  }

  @override
  void initState() {
    // _themeManagerCtx.addListener(themeListener);
    // _loginViewModel.addListener(loginListener);

    super.initState();
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  loginListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeManager themeManagerCtx = context.watch<ThemeManager>();

    return MaterialApp.router(
      title: 'Akwaaba-App',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManagerCtx.themeMode,
      debugShowCheckedModeBanner: false,
      builder: (contextRW, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(contextRW, child!),
        // maxWidth: 1200,
        // minWidth: 450,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(450, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: PHONE),
          ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1660, name: bigDesktopDevice),
          ResponsiveBreakpoint.autoScale(2460, name: fourKDevice),
        ],
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
