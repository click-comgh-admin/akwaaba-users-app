import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/tab_contents/date/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/tab_contents/now/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/tab_contents/today/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/meetings/bottom/tab_contents/upcoming/main.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/tabbar/main.dart';
import 'package:flutter/material.dart';

class AttendanceMeetingTabBarViewModel extends ChangeNotifier {
  final List<AttendanceMeetingTabBarModel> _tabs = [
    AttendanceMeetingTabBarModel(
      index: 0,
      title: "Now",
      description: "Meetings happening at time moment in time.",
      icon: Icons.access_time_sharp,
      child: const TabContentNowBottomMeetingsPageSettingsWidget(),
    ),
    AttendanceMeetingTabBarModel(
      index: 1,
      title: "Today",
      description: "Meetings happening this calendar day.",
      icon: Icons.today_outlined,
      child: const TabContentTodayBottomMeetingsPageSettingsWidget(),
    ),
    AttendanceMeetingTabBarModel(
      index: 2,
      title: "Upcomming",
      description: "Upcoming Meetings",
      icon: Icons.upcoming_outlined,
      child: const TabContentUpcommingBottomMeetingsPageSettingsWidget(),
    ),
    AttendanceMeetingTabBarModel(
      index: 3,
      title: "Date",
      description: "Meetings happening on a particular date.",
      icon: Icons.calendar_month_outlined,
      child: const TabContentDateBottomMeetingsPageSettingsWidget(),
    )
  ];
  int _initialIndex = 0;

  List<AttendanceMeetingTabBarModel> get tabs => _tabs;
  int get initialIndex => _initialIndex;

  set setInitialIndex(int initialIndex) {
    _initialIndex = initialIndex;
    // print({"initialIndex": initialIndex});
    notifyListeners();
  }
}
