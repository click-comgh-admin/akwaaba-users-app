import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/notifications/main.dart';
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

class NotificationPageWeb extends StatefulWidget {
  const NotificationPageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationPageWeb> createState() => _NotificationPageWebState();
}

class _NotificationPageWebState extends State<NotificationPageWeb> {
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
        sidebarItemsMap[NotificationRouteWeb.name]!;

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      // appBar: AppBarScaffoldWidget(titleText: "Notification Page",),
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      body: Row(
        children: [
          const SideBarBodyScaffoldWidget(),
          RightContentBodyScaffoldWidget(
            title: Text(
              "Notification Page",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
            topMainChild: Text(
              "data",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
            child: const PagesNotificationWidget(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            AutoRouter.of(context).push(const NotificationRouteWeb());
          },
          child: const Icon(CupertinoIcons.refresh)),
    );
  }
}
