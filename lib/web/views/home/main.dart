import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/upcoming/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_content.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageWeb extends StatefulWidget {
  const HomePageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePageWeb> createState() => _HomePageWebState();
}

class _HomePageWebState extends State<HomePageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SidebarItemViewModel sidebarItemViewModelCtx =
        context.watch<SidebarItemViewModel>();
    sidebarItemViewModelCtx.setItem = sidebarItemsMap[HomeRouteWeb.name]!;

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      // appBar: AppBarScaffoldWidget(titleText: "Home Page",),
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      body: Row(
        children: const [
          SideBarBodyScaffoldWidget(),
          RightContentBodyScaffoldWidget(
            title: Text("Home Page"),
            topMainChild: UpcomingAttendancePagesHomeWidget(),
            child: ClockerAttendancePagesHomeWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            AutoRouter.of(context).push(const HomeRouteWeb());
          },
          child: const Icon(CupertinoIcons.refresh)),
    );
  }
}
