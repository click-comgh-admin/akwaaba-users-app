import 'package:akwaaba_user_app/imports/utilities/constants/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/responsive/devices/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/scaffold/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/main/top.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MainBodyScaffoldWidget extends StatefulWidget {
  final Widget child;
  final Widget? topMainChild;

  const MainBodyScaffoldWidget(
      {Key? key, required this.child, this.topMainChild})
      : super(key: key);

  @override
  State<MainBodyScaffoldWidget> createState() => _MainBodyScaffoldWidgetState();
}

class _MainBodyScaffoldWidgetState extends State<MainBodyScaffoldWidget> {
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
    final screenHeight = screenSize.height;
    final contentWidth = screenWidth - scaffoldSidebarWidth;
    return Container(
      padding: pAll8PaddingMarginConstantsUtilities,
      height: screenHeight - scaffoldAppbarBodyHeight,
      width: ResponsiveWrapper.of(context).isSmallerThan(bigDesktopDevice)
          ? ResponsiveWrapper.of(context).isSmallerThan(TABLET)
              ? contentWidth + scaffoldSidebarWidth
              : contentWidth
          : contentWidth / 1.5,
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            TopMainBodyScaffoldWidget(topMainChild: widget.topMainChild),
            widget.child,
          ],
        ),
      ),
    );
  }
}
