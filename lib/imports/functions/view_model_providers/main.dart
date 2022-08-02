import 'package:akwaaba_user_app/imports/classes/forms/validation/manager.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/manager.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/clockers.dart';
import 'package:akwaaba_user_app/view_models/attendance/clocking/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/request.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/datatable/date.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/datatable/now.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/datatable/today.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/datatable/upcoming.dart';
import 'package:akwaaba_user_app/view_models/attendance/meetings/tab_bar/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/break/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/dates.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/date_days/days.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/misc/location/meeting_place.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/today/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/upcoming/main.dart';
import 'package:akwaaba_user_app/view_models/firebase/current_token/main.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/scaffold/messenger.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:akwaaba_user_app/view_models/users/connections/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> notifierProvidersFunction() {
  return [
    ChangeNotifierProvider(
      create: (context) => ScaffoldViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ScaffoldMessengerViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
    ),
    ChangeNotifierProvider(
      create: (context) => SidebarItemViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => FormValidationManager(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserLoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserTokenViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => UserConnectionsViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceScheduleTodayViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceScheduleUpcomingViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceScheduleDayViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceScheduleDateViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceScheduleBreakViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceScheduleLocationViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceSchedulePlaceViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceClockingAttendanceViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceClockerClockingAttendanceViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ClockingDeviceViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ClockingDeviceRequestViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceMeetingTabBarViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceMeetingNowDataTableViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceMeetingTodayDataTableViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceMeetingUpcomingDataTableViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => AttendanceMeetingDateDataTableViewModel(),
    ),
  ];
}
