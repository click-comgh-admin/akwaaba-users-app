import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_content.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendancePageWeb extends StatefulWidget {
  const AttendancePageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<AttendancePageWeb> createState() => _AttendancePageWebState();
}

class _AttendancePageWebState extends State<AttendancePageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SidebarItemViewModel sidebarItemViewModelCtx =
        context.watch<SidebarItemViewModel>();
    sidebarItemViewModelCtx.setItem = sidebarItemsMap[AttendanceRouteWeb.name]!;

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      body: Row(
        children: [
          const SideBarBodyScaffoldWidget(),
          RightContentBodyScaffoldWidget(
            title: Text(
              "Member Attendance",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
            topMainChild: Container(),
            child: Column(
              children: [
                Text(
                  "Attendance Page",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize:
                            body2FontSizeResponsiveSizingContantsUtilities(
                          context,
                        ),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
