import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/devices/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/appbar/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/action_card.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/action_image.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/search/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/search/search_button.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class LargeAppBarScaffoldWidget extends StatefulWidget {
  final Widget? title;
  final height = scaffoldAppbarBodyHeight;
  final bool showSearch;
  const LargeAppBarScaffoldWidget({
    Key? key,
    this.title,
    this.showSearch = true,
  }) : super(key: key);

  @override
  State<LargeAppBarScaffoldWidget> createState() =>
      _LargeAppBarScaffoldWidgetState();
}

class _LargeAppBarScaffoldWidgetState extends State<LargeAppBarScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth =
        (screenSize.width - scaffoldSidebarWidth) - scaffoldMainBodyGutter;
    final smallerThanDesktopWidth = screenSize.width - scaffoldMainBodyGutter;
    final smallerThanBigDesktopWidth =
        ((screenSize.width / 2) + scaffoldSidebarWidth) -
            scaffoldMainBodyGutter;
    return Container(
      width: ResponsiveValue(
        context,
        defaultValue: screenWidth,
        valueWhen: [
          Condition.smallerThan(
            name: TABLET,
            value: smallerThanDesktopWidth,
          ),
          Condition.smallerThan(
            name: DESKTOP,
            value: screenWidth,
          ),
          Condition.smallerThan(
            name: bigDesktopDevice,
            value: smallerThanBigDesktopWidth,
          ),
        ],
      ).value,
      alignment: FractionalOffset.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const ResponsiveVisibility(
                hiddenWhen: [
                  Condition.largerThan(name: TABLET),
                ],
                visibleWhen: [
                  Condition.smallerThan(name: TABLET),
                ],
                child: DrawerButtonSidebarBodyScaffoldWidget(),
              ),
              sizeboxWidth10AppbarScaffoldConstantsUtilities,
              sizeboxWidth10AppbarScaffoldConstantsUtilities,
              SizedBox(
                width: ResponsiveValue(context, defaultValue: 250.0, valueWhen: [
                  const Condition.smallerThan(name: DESKTOP, value: 300.0),
                  const Condition.smallerThan(name: TABLET, value: 115.0),
                  const Condition.smallerThan(name: MOBILE, value: 112.0),
                ]).value,
                child: widget.title,
              ),
            ],
          ),
          Row(
            children: [
              widget.showSearch
                  ? const ResponsiveVisibility(
                      hiddenWhen: [
                        Condition.smallerThan(name: DESKTOP),
                      ],
                      visibleWhen: [
                        Condition.largerThan(name: DESKTOP),
                      ],
                      child: ActionSearchAppBarScaffoldWidget(),
                    )
                  : Container(),
              widget.showSearch
                  ? const ResponsiveVisibility(
                      hiddenWhen: [
                        Condition.largerThan(name: DESKTOP),
                      ],
                      visibleWhen: [
                        Condition.smallerThan(name: DESKTOP),
                      ],
                      child: SearchButtonAppBarScaffoldWidget(),
                    )
                  : Container(),
              ActionCardAppBarScaffoldWidget(
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_none_sharp,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      // AutoRouter.of(context).push(const NotificationRouteWeb());
                    },
                  ),
                ),
              ),
              const ActionImageAppBarScaffoldWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
