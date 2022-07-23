import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/break/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/dates.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/days_dates/days.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/location/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/models/client/branch/main.dart';
import 'package:akwaaba_user_app/models/client/main.dart';
import 'package:akwaaba_user_app/models/client/member_category/main.dart';
import 'package:akwaaba_user_app/models/location/country/main.dart';
import 'package:akwaaba_user_app/models/settings/theme/main.dart';
import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:akwaaba_user_app/models/types/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/connections/types/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';

hiveModelTypes() async {
  return {
    1: SettingsTheme,
    2: UserLoginModel,
    3: QuickUser,
    4: SidebarItemModel,
    5: UserConnectionsModel,
    6: UserConnectionTypeModel,
    7: ProfileModel,
    8: OrganizationProfileModel,
    9: AttendanceScheduleModel,
    10: AttendanceScheduleFullModel,
    11: BranchIdModel,
    12: ClientIdModel,
    13: CountryInfoLocationModel,
    14: MemberCategoryIdModel,
    15: AttendanceScheduleDateModel,
    16: AttendanceScheduleDayModel,
    17: TypesModel,
    18: AttendanceScheduleLocationModel,
    19: AttendanceScheduleBreakModel,
    20: AttendanceClockingAttendanceModel,
    21: AttendanceClockingAttendanceDetailsModel,
  };
}
