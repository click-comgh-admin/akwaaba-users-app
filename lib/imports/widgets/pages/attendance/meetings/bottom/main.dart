import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/tab_bar/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomMeetingsPageSettingsWidget extends StatefulWidget {
  const BottomMeetingsPageSettingsWidget({Key? key}) : super(key: key);

  @override
  State<BottomMeetingsPageSettingsWidget> createState() =>
      _BottomMeetingsPageSettingsWidgetState();
}

class _BottomMeetingsPageSettingsWidgetState
    extends State<BottomMeetingsPageSettingsWidget> {
  @override
  Widget build(BuildContext context) {
    AttendanceMeetingTabBarViewModel amtbViewModel =
        context.watch<AttendanceMeetingTabBarViewModel>();
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(),
      width: double.infinity,
      height: 1000,
      child: TabBarView(
        children: amtbViewModel.tabs
            .map(
              (tabInfo) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: tabInfo.description,
                    child: Row(
                      children: [
                        Text(
                          tabInfo.title,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        width10SizeboxConstantsUtilities,
                        Icon(tabInfo.icon),
                      ],
                    ),
                  ),
                  tabInfo.child,
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
