// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../web/views/404/main.dart' as _i6;
import '../../web/views/attendance/clocker/main.dart' as _i8;
import '../../web/views/attendance/clocker/meeting/main.dart' as _i9;
import '../../web/views/attendance/history/main.dart' as _i7;
import '../../web/views/attendance/main.dart' as _i5;
import '../../web/views/connections/main.dart' as _i4;
import '../../web/views/home/main.dart' as _i2;
import '../../web/views/login/main.dart' as _i1;
import '../../web/views/search/main.dart' as _i3;

class AkwaabaUserRoutes extends _i10.RootStackRouter {
  AkwaabaUserRoutes([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LoginRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPageWeb());
    },
    HomeRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomePageWeb());
    },
    SearchRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SearchPageWeb());
    },
    ConnectionsRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ConnectionsPageWeb());
    },
    AttendanceRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AttendancePageWeb());
    },
    NotFoundRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.NotFoundPageWeb());
    },
    AttendanceHistoryRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AttendanceHistoryPageWeb());
    },
    AttendanceClockerRouteWeb.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.AttendanceClockerPageWeb());
    },
    AttendanceMeetingClockerRouteWeb.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<AttendanceMeetingClockerRouteWebArgs>(
          orElse: () => AttendanceMeetingClockerRouteWebArgs(
              meetingId: pathParams.getInt('meetingId')));
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.AttendanceMeetingClockerPageWeb(
              key: args.key, meetingId: args.meetingId));
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(LoginRouteWeb.name, path: '/login'),
        _i10.RouteConfig(HomeRouteWeb.name, path: '/'),
        _i10.RouteConfig(SearchRouteWeb.name, path: '/navigation/search'),
        _i10.RouteConfig(ConnectionsRouteWeb.name, path: '/user/connections'),
        _i10.RouteConfig(AttendanceRouteWeb.name,
            path: '/attendance',
            children: [
              _i10.RouteConfig(AttendanceHistoryRouteWeb.name,
                  path: 'history', parent: AttendanceRouteWeb.name),
              _i10.RouteConfig(AttendanceClockerRouteWeb.name,
                  path: 'clocker',
                  parent: AttendanceRouteWeb.name,
                  children: [
                    _i10.RouteConfig(AttendanceMeetingClockerRouteWeb.name,
                        path: 'meeting/:meetingId',
                        parent: AttendanceClockerRouteWeb.name)
                  ])
            ]),
        _i10.RouteConfig(NotFoundRouteWeb.name, path: '*'),
        _i10.RouteConfig('*#redirect',
            path: '*', redirectTo: '/404', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.LoginPageWeb]
class LoginRouteWeb extends _i10.PageRouteInfo<void> {
  const LoginRouteWeb() : super(LoginRouteWeb.name, path: '/login');

  static const String name = 'LoginRouteWeb';
}

/// generated route for
/// [_i2.HomePageWeb]
class HomeRouteWeb extends _i10.PageRouteInfo<void> {
  const HomeRouteWeb() : super(HomeRouteWeb.name, path: '/');

  static const String name = 'HomeRouteWeb';
}

/// generated route for
/// [_i3.SearchPageWeb]
class SearchRouteWeb extends _i10.PageRouteInfo<void> {
  const SearchRouteWeb()
      : super(SearchRouteWeb.name, path: '/navigation/search');

  static const String name = 'SearchRouteWeb';
}

/// generated route for
/// [_i4.ConnectionsPageWeb]
class ConnectionsRouteWeb extends _i10.PageRouteInfo<void> {
  const ConnectionsRouteWeb()
      : super(ConnectionsRouteWeb.name, path: '/user/connections');

  static const String name = 'ConnectionsRouteWeb';
}

/// generated route for
/// [_i5.AttendancePageWeb]
class AttendanceRouteWeb extends _i10.PageRouteInfo<void> {
  const AttendanceRouteWeb({List<_i10.PageRouteInfo>? children})
      : super(AttendanceRouteWeb.name,
            path: '/attendance', initialChildren: children);

  static const String name = 'AttendanceRouteWeb';
}

/// generated route for
/// [_i6.NotFoundPageWeb]
class NotFoundRouteWeb extends _i10.PageRouteInfo<void> {
  const NotFoundRouteWeb() : super(NotFoundRouteWeb.name, path: '*');

  static const String name = 'NotFoundRouteWeb';
}

/// generated route for
/// [_i7.AttendanceHistoryPageWeb]
class AttendanceHistoryRouteWeb extends _i10.PageRouteInfo<void> {
  const AttendanceHistoryRouteWeb()
      : super(AttendanceHistoryRouteWeb.name, path: 'history');

  static const String name = 'AttendanceHistoryRouteWeb';
}

/// generated route for
/// [_i8.AttendanceClockerPageWeb]
class AttendanceClockerRouteWeb extends _i10.PageRouteInfo<void> {
  const AttendanceClockerRouteWeb({List<_i10.PageRouteInfo>? children})
      : super(AttendanceClockerRouteWeb.name,
            path: 'clocker', initialChildren: children);

  static const String name = 'AttendanceClockerRouteWeb';
}

/// generated route for
/// [_i9.AttendanceMeetingClockerPageWeb]
class AttendanceMeetingClockerRouteWeb
    extends _i10.PageRouteInfo<AttendanceMeetingClockerRouteWebArgs> {
  AttendanceMeetingClockerRouteWeb({_i11.Key? key, required int meetingId})
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

  final _i11.Key? key;

  final int meetingId;

  @override
  String toString() {
    return 'AttendanceMeetingClockerRouteWebArgs{key: $key, meetingId: $meetingId}';
  }
}
