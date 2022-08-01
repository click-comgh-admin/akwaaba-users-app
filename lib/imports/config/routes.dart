import 'package:akwaaba_user_app/web/views/attendance/clocker/main.dart';
import 'package:akwaaba_user_app/web/views/attendance/clocker/meeting/main.dart';
import 'package:akwaaba_user_app/web/views/attendance/history/main.dart';
import 'package:akwaaba_user_app/web/views/attendance/main.dart';
import 'package:akwaaba_user_app/web/views/attendance/meeting/main.dart';
import 'package:akwaaba_user_app/web/views/connections/main.dart';
import 'package:akwaaba_user_app/web/views/home/main.dart';
import 'package:akwaaba_user_app/web/views/login/main.dart';
import 'package:akwaaba_user_app/web/views/404/main.dart';
import 'package:akwaaba_user_app/web/views/notifications/main.dart';
import 'package:akwaaba_user_app/web/views/search/main.dart';
import 'package:akwaaba_user_app/web/views/settings/device/main.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginPageWeb, path: "/login"),
    AutoRoute(page: HomePageWeb, path: "/", initial: true),
    AutoRoute(page: SearchPageWeb, path: "/navigation/search"),
    AutoRoute(page: ConnectionsPageWeb, path: "/user/connections"),
    AutoRoute(page: NotificationPageWeb, path: "/notifications"),
    AutoRoute(page: DeviceSettingsPageWeb, path: "/settings/device"),
    AutoRoute(page: AttendanceMeetingsPageWeb, path: "/meetings"),
    AutoRoute(page: AttendancePageWeb, path: "/attendance", children: [
      AutoRoute(page: AttendanceHistoryPageWeb, path: "history"),
      AutoRoute(
        page: AttendanceClockerPageWeb,
        path: "clocker",
        children: [
          AutoRoute(
            page: AttendanceMeetingClockerPageWeb,
            path: "meeting/:meetingId",
          ),
        ],
      ),
    ]),
    // AutoRoute(page: NotFoundPageWeb, path: "/404"),
    AutoRoute(path: '*', page: NotFoundPageWeb),
    // or it could be used with RedirectRoute
    RedirectRoute(path: '*', redirectTo: '/404')
  ],
)
class $AkwaabaUserRoutes {}
