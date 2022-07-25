import 'package:akwaaba_user_app/imports/functions/login/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
import 'package:akwaaba_user_app/imports/widgets/settings/theme/main.dart';
import 'package:akwaaba_user_app/web/views/login/intro.dart';
import 'package:akwaaba_user_app/web/views/login/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LoginPageWeb extends StatefulWidget {
  const LoginPageWeb({Key? key}) : super(key: key);

  @override
  State<LoginPageWeb> createState() => _LoginPageWebState();
}

class _LoginPageWebState extends State<LoginPageWeb> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    autoLogin(context);
    ThemeManager themeManagerCtx = context.watch<ThemeManager>();
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akwaaba User App"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [
          ThemeSettingsWidget(),
        ],elevation: 0,
      ),
      body: SizedBox(
        width: screenWidth,
        height: screenHeight,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  color: themeManagerCtx.themeMode == ThemeMode.dark
                      ? ThemeData.dark().cardColor
                      : ThemeData.light().cardColor,
                  height: screenHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ResponsiveVisibility(
                        hiddenWhen: const [
                          Condition.largerThan(name: PHONE),
                        ],
                        visibleWhen: const [
                          Condition.smallerThan(name: PHONE),
                        ],
                        child: SizedBox(
                          width: 200.00,
                          height: 200.00,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: LoginIntroWeb(
                              image: Image.asset(
                                "assets/images/icons/icon.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const LoginViewsWeb(),
                    ],
                  ),
                ),
              ),
            ),
            ResponsiveVisibility(
              visible: false,
              hiddenWhen: const [
                Condition.smallerThan(name: PHONE),
              ],
              visibleWhen: const [
                Condition.largerThan(name: PHONE),
              ],
              child: Expanded(
                flex: 1,
                child: Container(
                  color: themeManagerCtx.themeMode == ThemeMode.dark
                      ? ThemeData.light().cardColor.withOpacity(0.5)
                      : ThemeData.dark().cardColor.withOpacity(0.5),
                  height: screenHeight + 20,
                  child: LoginIntroWeb(
                    image: Image.asset(
                      "assets/images/login/intro.jpg",
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
