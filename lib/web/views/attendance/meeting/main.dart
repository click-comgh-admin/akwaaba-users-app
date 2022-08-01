import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/top/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_content.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/tab_bar/main.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceMeetingsPageWeb extends StatefulWidget {
  const AttendanceMeetingsPageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AttendanceMeetingsPageWeb> createState() =>
      _AttendanceMeetingsPageWebState();
}

class _AttendanceMeetingsPageWebState extends State<AttendanceMeetingsPageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SidebarItemViewModel sidebarItemViewModelCtx =
        context.watch<SidebarItemViewModel>();
    sidebarItemViewModelCtx.setItem =
        sidebarItemsMap[AttendanceMeetingsRouteWeb.name]!;

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    AttendanceMeetingTabBarViewModel amtbViewModel =
        context.watch<AttendanceMeetingTabBarViewModel>();

    return DefaultTabController(
      length: amtbViewModel.tabs.length,
      initialIndex: amtbViewModel.initialIndex,
      child: Scaffold(
        key: scaffoldViewModelCtx.scaffoldState,
        // appBar: AppBarScaffoldWidget(titleText: "AttendanceMeetings Page",),
        drawer: const SidebarDrawerBodyScaffoldWidget(),
        body: Row(
          children: [
            const SideBarBodyScaffoldWidget(),
            RightContentBodyScaffoldWidget(
              title: Text(
                "Meetings Page",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                        context,
                      ),
                    ),
              ),
              topMainChild: const TopMeetingsPageSettingsWidget(),
              child: const BottomMeetingsPageSettingsWidget(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.small(
            onPressed: () {
              AutoRouter.of(context).push(const AttendanceMeetingsRouteWeb());
            },
            child: const Icon(CupertinoIcons.refresh)),
      ),
    );
  }
}
