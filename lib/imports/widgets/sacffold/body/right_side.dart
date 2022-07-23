import 'package:akwaaba_user_app/imports/utilities/constants/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/responsive/devices/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_side/bottom.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_side/top.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class RightSideBodyScaffoldWidget extends StatefulWidget {
  const RightSideBodyScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RightSideBodyScaffoldWidget> createState() =>
      _RightSideBodyScaffoldWidgetState();
}

class _RightSideBodyScaffoldWidgetState
    extends State<RightSideBodyScaffoldWidget> {
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
    final screenWidth = screenSize.width - (scaffoldMainBodyGutter / 2);
    final screenHeight = screenSize.height - scaffoldAppbarBodyHeight;
    final contentWidth = screenWidth - scaffoldSidebarWidth;

    return Container(
      padding: pAll8PaddingMarginConstantsUtilities,
      height: screenHeight,
      width: ResponsiveWrapper.of(context).isSmallerThan(bigDesktopDevice)
          ? 0
          : contentWidth / 3,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: const [
            TopRightsideBodyScaffoldWidget(),
            height25SizeboxConstantsUtilities,
            height25SizeboxConstantsUtilities,
            BottomRightsideBodyScaffoldWidget()
          ],
        ),
      ),
    );
  }
}
