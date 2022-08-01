import 'package:akwaaba_user_app/imports/utilities/constants/sizing/height/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/tabbar/main.dart';
import 'package:flutter/material.dart';

class TopCardMeetingsPageSettingsWidget extends StatefulWidget {
  final AttendanceMeetingTabBarModel tabBarItem;
  final bool selected;
  const TopCardMeetingsPageSettingsWidget({
    Key? key,
    required this.tabBarItem,
    required this.selected,
  }) : super(key: key);

  @override
  State<TopCardMeetingsPageSettingsWidget> createState() =>
      _TopCardMeetingsPageSettingsWidgetState();
}

class _TopCardMeetingsPageSettingsWidgetState
    extends State<TopCardMeetingsPageSettingsWidget> {
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  void initState() {
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
    TextStyle? titleTextStyle = Theme.of(context).textTheme.headline5;
    return Tooltip(
      message: widget.tabBarItem.description,
      child: Card(
        child: SizedBox(
          width: 165,
          height: topCardHeightConstantsUtilities,
          child: Padding(
            padding: EdgeInsets.zero,
            child: SizedBox(
              height: 200.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.tabBarItem.title,
                    style: widget.selected
                        ? titleTextStyle!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                body2FontSizeResponsiveSizingContantsUtilities(
                              context,
                            ),
                          )
                        : titleTextStyle!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize:
                                body2FontSizeResponsiveSizingContantsUtilities(
                              context,
                            ),
                          ),
                  ),
                  Divider(
                    thickness: 1,
                    color: widget.selected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).iconTheme.color,
                  ),
                  Icon(
                    widget.tabBarItem.icon,
                    shadows: [
                      Shadow(color: Theme.of(context).primaryColor),
                      Shadow(color: Theme.of(context).backgroundColor),
                      Shadow(
                        color: Theme.of(context).textTheme.bodyText2!.color!,
                      ),
                    ],
                    color: widget.selected
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).iconTheme.color,
                    size: Theme.of(context).iconTheme.copyWith(size: 50.0).size,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
