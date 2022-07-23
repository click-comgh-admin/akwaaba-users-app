import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotFoundPageWeb extends StatefulWidget {
  const NotFoundPageWeb({Key? key}) : super(key: key);

  @override
  State<NotFoundPageWeb> createState() => _NotFoundPageWebState();
}

class _NotFoundPageWebState extends State<NotFoundPageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      body: const Center(
        child: Text(
          "404 - Page not found!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 2.5,
        ),
      ),
    );
  }
}
