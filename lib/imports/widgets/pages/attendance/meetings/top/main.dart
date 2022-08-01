import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/top/card.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/tab_bar/main.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopMeetingsPageSettingsWidget extends StatefulWidget {
  const TopMeetingsPageSettingsWidget({Key? key}) : super(key: key);

  @override
  State<TopMeetingsPageSettingsWidget> createState() =>
      _TopMeetingsPageSettingsWidgetState();
}

class _TopMeetingsPageSettingsWidgetState
    extends State<TopMeetingsPageSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    AttendanceMeetingTabBarViewModel amtbViewModel =
        context.watch<AttendanceMeetingTabBarViewModel>();
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(),
      child: TabBar(
        onTap: (value) => amtbViewModel.setInitialIndex = value,
        padding: EdgeInsets.zero,
        labelPadding: EdgeInsets.zero,
        indicatorPadding: EdgeInsets.zero,
        isScrollable: true,
        indicatorColor: Theme.of(context).primaryColor,
        tabs: amtbViewModel.tabs
            .map((amtb) => TopCardMeetingsPageSettingsWidget(
                tabBarItem: amtb,
                selected: amtbViewModel.initialIndex == amtb.index))
            .toList(),
      ),
    );
  }
}
