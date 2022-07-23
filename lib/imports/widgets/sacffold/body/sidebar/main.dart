import 'package:akwaaba_user_app/imports/utilities/constants/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/item.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainSidebarBodyScaffoldWidget extends StatefulWidget {
  const MainSidebarBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<MainSidebarBodyScaffoldWidget> createState() =>
      _MainSidebarBodyScaffoldWidgetState();
}

class _MainSidebarBodyScaffoldWidgetState
    extends State<MainSidebarBodyScaffoldWidget> {
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
    return Column(
      children: [
        SizedBox(
          height: scaffoldAppbarBodyHeight,
          child: Padding(
            padding: pAll8PaddingMarginConstantsUtilities,
            child: Text(
              "Akwaaba App",
              style: GoogleFonts.antic(
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 2,
            ),
          ),
        ),
        SingleChildScrollView(
          controller: scrollController,
          child: ResponsiveVisibility(
            hiddenWhen: const [
              Condition.smallerThan(name: TABLET)
            ],
            child: Container(
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
            ),
          ),
        )
      ],
    );
  }
}
