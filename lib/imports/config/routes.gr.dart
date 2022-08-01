// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;

import '../../web/views/404/main.dart' as _i9;
import '../../web/views/attendance/clocker/main.dart' as _i11;
import '../../web/views/attendance/clocker/meeting/main.dart' as _i12;
import '../../web/views/attendance/history/main.dart' as _i10;
import '../../web/views/attendance/main.dart' as _i8;
import '../../web/views/attendance/meeting/main.dart' as _i7;
import '../../web/views/connections/main.dart' as _i4;
import '../../web/views/home/main.dart' as _i2;
import '../../web/views/login/main.dart' as _i1;
import '../../web/views/notifications/main.dart' as _i5;
import '../../web/views/search/main.dart' as _i3;
import '../../web/views/settings/device/main.dart' as _i6;

class AkwaabaUserRoutes extends _i13.RootStackRouter {
  AkwaabaUserRoutes([_i14.GlobalKey<_i14.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i13.PageFactory> pagesMap = {
    LoginRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPageWeb());
    },
    HomeRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePageWeb());
    },
    SearchRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SearchPageWeb());
    },
    ConnectionsRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ConnectionsPageWeb());
    },
    NotificationRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.NotificationPageWeb());
    },
    DeviceSettingsRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.DeviceSettingsPageWeb());
    },
    AttendanceMeetingsRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AttendanceMeetingsPageWeb());
    },
    AttendanceRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AttendancePageWeb());
    },
    NotFoundRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.NotFoundPageWeb());
    },
    AttendanceHistoryRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.AttendanceHistoryPageWeb());
    },
    AttendanceClockerRouteWeb.name: (routeData) {
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.AttendanceClockerPageWeb());
    },
    AttendanceMeetingClockerRouteWeb.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AttendanceMeetingClockerRouteWebArgs>(
          orElse: () => AttendanceMeetingClockerRouteWebArgs(
              meetingId: pathParams.getInt('meetingId')));
      return _i13.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i12.AttendanceMeetingClockerPageWeb(
              key: args.key, meetingId: args.meetingId));
    }
  };

  @override
  List<_i13.RouteConfig> get routes => [
        _i13.RouteConfig(LoginRouteWeb.name, path: '/login'),
        _i13.RouteConfig(HomeRouteWeb.name, path: '/'),
        _i13.RouteConfig(SearchRouteWeb.name, path: '/navigation/search'),
        _i13.RouteConfig(ConnectionsRouteWeb.name, path: '/user/connections'),
        _i13.RouteConfig(NotificationRouteWeb.name, path: '/notifications'),
        _i13.RouteConfig(DeviceSettingsRouteWeb.name, path: '/settings/device'),
        _i13.RouteConfig(AttendanceMeetingsRouteWeb.name, path: '/meetings'),
        _i13.RouteConfig(AttendanceRouteWeb.name,
            path: '/attendance',
            children: [
              _i13.RouteConfig(AttendanceHistoryRouteWeb.name,
                  path: 'history', parent: AttendanceRouteWeb.name),
              _i13.RouteConfig(AttendanceClockerRouteWeb.name,
                  path: 'clocker',
                  parent: AttendanceRouteWeb.name,
                  children: [
                    _i13.RouteConfig(AttendanceMeetingClockerRouteWeb.name,
                        path: 'meeting/:meetingId',
                        parent: AttendanceClockerRouteWeb.name)
                  ])
            ]),
        _i13.RouteConfig(NotFoundRouteWeb.name, path: '*'),
        _i13.RouteConfig('*#redirect',
            path: '*', redirectTo: '/404', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.LoginPageWeb]
class LoginRouteWeb extends _i13.PageRouteInfo<void> {
  const LoginRouteWeb() : super(LoginRouteWeb.name, path: '/login');

  static const String name = 'LoginRouteWeb';
}

/// generated route for
/// [_i2.HomePageWeb]
class HomeRouteWeb extends _i13.PageRouteInfo<void> {
  const HomeRouteWeb() : super(HomeRouteWeb.name, path: '/');

  static const String name = 'HomeRouteWeb';
}

/// generated route for
/// [_i3.SearchPageWeb]
class SearchRouteWeb extends _i13.PageRouteInfo<void> {
  const SearchRouteWeb()
      : super(SearchRouteWeb.name, path: '/navigation/search');

  static const String name = 'SearchRouteWeb';
}

/// generated route for
/// [_i4.ConnectionsPageWeb]
class ConnectionsRouteWeb extends _i13.PageRouteInfo<void> {
  const ConnectionsRouteWeb()
      : super(ConnectionsRouteWeb.name, path: '/user/connections');

  static const String name = 'ConnectionsRouteWeb';
}

/// generated route for
/// [_i5.NotificationPageWeb]
class NotificationRouteWeb extends _i13.PageRouteInfo<void> {
  const NotificationRouteWeb()
      : super(NotificationRouteWeb.name, path: '/notifications');

  static const String name = 'NotificationRouteWeb';
}

/// generated route for
/// [_i6.DeviceSettingsPageWeb]
class DeviceSettingsRouteWeb extends _i13.PageRouteInfo<void> {
  const DeviceSettingsRouteWeb()
      : super(DeviceSettingsRouteWeb.name, path: '/settings/device');

  static const String name = 'DeviceSettingsRouteWeb';
}

/// generated route for
/// [_i7.AttendanceMeetingsPageWeb]
class AttendanceMeetingsRouteWeb extends _i13.PageRouteInfo<void> {
  const AttendanceMeetingsRouteWeb()
      : super(AttendanceMeetingsRouteWeb.name, path: '/meetings');

  static const String name = 'AttendanceMeetingsRouteWeb';
}

/// generated route for
/// [_i8.AttendancePageWeb]
class AttendanceRouteWeb extends _i13.PageRouteInfo<void> {
  const AttendanceRouteWeb({List<_i13.PageRouteInfo>? children})
      : super(AttendanceRouteWeb.name,
            path: '/attendance', initialChildren: children);

  static const String name = 'AttendanceRouteWeb';
}

/// generated route for
/// [_i9.NotFoundPageWeb]
class NotFoundRouteWeb extends _i13.PageRouteInfo<void> {
  const NotFoundRouteWeb() : super(NotFoundRouteWeb.name, path: '*');

  static const String name = 'NotFoundRouteWeb';
}

/// generated route for
/// [_i10.AttendanceHistoryPageWeb]
class AttendanceHistoryRouteWeb extends _i13.PageRouteInfo<void> {
  const AttendanceHistoryRouteWeb()
      : super(AttendanceHistoryRouteWeb.name, path: 'history');

  static const String name = 'AttendanceHistoryRouteWeb';
}

/// generated route for
/// [_i11.AttendanceClockerPageWeb]
class AttendanceClockerRouteWeb extends _i13.PageRouteInfo<void> {
  const AttendanceClockerRouteWeb({List<_i13.PageRouteInfo>? children})
      : super(AttendanceClockerRouteWeb.name,
            path: 'clocker', initialChildren: children);

  static const String name = 'AttendanceClockerRouteWeb';
}

/// generated route for
/// [_i12.AttendanceMeetingClockerPageWeb]
class AttendanceMeetingClockerRouteWeb
    extends _i13.PageRouteInfo<AttendanceMeetingClockerRouteWebArgs> {
  AttendanceMeetingClockerRouteWeb({_i14.Key? key, required int meetingId})
      : super(AttendanceMeetingClockerRouteWeb.name,
            path: 'meeting/:meetingId',
            args: AttendanceMeetingClockerRouteWebArgs(
                key: key, meetingId: meetingId),
            rawPathParams: {'meetingId': meetingId});

  static const String name = 'AttendanceMeetingClockerRouteWeb';
}

class AttendanceMeetingClockerRouteWebArgs {
  const AttendanceMeetingClockerRouteWebArgs(
      {this.key, required this.meetingId});

  final _i14.Key? key;

  final int meetingId;

  @override
  String toString() {
    return 'AttendanceMeetingClockerRouteWebArgs{key: $key, meetingId: $meetingId}';
  }
}
