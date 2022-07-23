import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/main.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SideBarBodyScaffoldWidget extends StatefulWidget {
  const SideBarBodyScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SideBarBodyScaffoldWidget> createState() =>
      _SideBarBodyScaffoldWidgetState();
}

class _SideBarBodyScaffoldWidgetState extends State<SideBarBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          right: BorderSide(
            color:
                Theme.of(context).textTheme.bodyText2!.color!.withOpacity(0.1),
          ),
        ),
      ),
      // padding: pAll8PaddingMarginConstantsUtilities,
      height: screenHeight,
      width: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
          ? 0
          : scaffoldSidebarWidth,
      child: const MainSidebarBodyScaffoldWidget(),
    );
  }
}
