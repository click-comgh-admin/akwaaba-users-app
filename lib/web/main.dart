import 'package:akwaaba_user_app/firebase_options.dart';
import 'package:akwaaba_user_app/imports/functions/hive/open_dbs/main.dart';
import 'package:akwaaba_user_app/imports/functions/view_model_providers/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/full/main.dart';
import 'package:akwaaba_user_app/models/attendance/device/request/main.dart';
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
import 'package:akwaaba_user_app/models/users/login/extra_info/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';
import 'package:akwaaba_user_app/web/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await dotenv.load(fileName: ".env");
  setPathUrlStrategy();
  await Hive.initFlutter();

  if (kIsWeb) {
    Hive
      ..initFlutter()
      ..registerAdapter(SettingsThemeAdapter()) //1
      ..registerAdapter(UserLoginModelAdapter()) //2
      ..registerAdapter(QuickUserAdapter()) //3
      ..registerAdapter(SidebarItemModelAdapter()) //4
      ..registerAdapter(UserConnectionsModelAdapter()) //5
      ..registerAdapter(UserConnectionTypeModelAdapter()) //6
      ..registerAdapter(ProfileModelAdapter()) //7
      ..registerAdapter(OrganizationProfileModelAdapter()) //8
      ..registerAdapter(AttendanceScheduleModelAdapter()) //9
      ..registerAdapter(AttendanceScheduleFullModelAdapter()) //10
      ..registerAdapter(BranchIdModelAdapter()) //11
      ..registerAdapter(ClientIdModelAdapter()) //12
      ..registerAdapter(CountryInfoLocationModelAdapter()) //13
      ..registerAdapter(MemberCategoryIdModelAdapter()) //14
      ..registerAdapter(AttendanceScheduleDateModelAdapter()) //15
      ..registerAdapter(AttendanceScheduleDayModelAdapter()) //16
      ..registerAdapter(TypesModelAdapter()) //17
      ..registerAdapter(AttendanceScheduleLocationModelAdapter()) //18
      ..registerAdapter(AttendanceScheduleBreakModelAdapter()) //19
      ..registerAdapter(AttendanceClockingAttendanceModelAdapter()) //20
      ..registerAdapter(AttendanceClockingAttendanceDetailsModelAdapter()) //21
      ..registerAdapter(ExtraLoginInfoModelAdapter()) //22
      ..registerAdapter(ClockingDeviceModelAdapter()) //23
      ..registerAdapter(ClockingDeviceRequestModelAdapter()) //24
      ..registerAdapter(ClockingDeviceRequestFullModelAdapter()); //25
  }

  openHiveDbsFunction();
  runApp(
    MultiProvider(
      providers: notifierProvidersFunction(),
      child: const WebApp(),
    ),
  );
}
