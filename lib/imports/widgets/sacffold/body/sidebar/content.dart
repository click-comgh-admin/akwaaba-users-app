import 'package:akwaaba_user_app/imports/utilities/constants/sizing/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/item.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainSidebarContentBodyScaffoldWidget extends StatefulWidget {
  const MainSidebarContentBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<MainSidebarContentBodyScaffoldWidget> createState() =>
      _MainSidebarContentBodyScaffoldWidgetState();
}

class _MainSidebarContentBodyScaffoldWidgetState
    extends State<MainSidebarContentBodyScaffoldWidget> {
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
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    SidebarItemViewModel sidebarItemViewModelCtx =
        context.watch<SidebarItemViewModel>();
    return Container(
      alignment: Alignment.topLeft,
      height: screenHeight -
          (scaffoldAppbarBodyHeight +
              (pAll8PaddingMarginConstantsUtilities.top * 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sidebarItemsMap.keys.map(
          (key) {
            SidebarItemModel item = sidebarItemsMap[key]!;
            return SidebarItemBodyScaffoldWidget(
              title: item.title!,
              icon: item.icon!,
              onTap: () {
                AutoRouter.of(context).push(item.route!);
              },
              selected: sidebarItemViewModelCtx.item == item,
            );
          },
        ).toList(),
      ),
    );
  }
}
