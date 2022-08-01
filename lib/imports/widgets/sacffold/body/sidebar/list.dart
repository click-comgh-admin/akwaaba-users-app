import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:flutter/material.dart';

// List<SidebarItemModel> listItems = [
//   SidebarItemModel(
//     route: const HomeRouteWeb(),
//     selected: false,
//     title: "Dashboard",
//     icon: Icons.speed_sharp,
//   ),
//   SidebarItemModel(
//     route: const AttendanceMeetingsRouteWeb(),
//     selected: false,
//     title: "Attendance",
//     icon: Icons.assignment_ind_outlined,
//   ),
// ];
Map<String, SidebarItemModel> sidebarItemsMap = {
  HomeRouteWeb.name: SidebarItemModel(
    route: const HomeRouteWeb(),
    selected: false,
    title: "Dashboard",
    icon: Icons.speed_sharp,
  ),
  // AttendanceRouteWeb.name: SidebarItemModel(
  //   route: const AttendanceRouteWeb(),
  //   selected: false,
  //   title: "Attendance",
  //   icon: Icons.assignment_ind_outlined,
  // ),
  AttendanceMeetingsRouteWeb.name: SidebarItemModel(
    route: const AttendanceMeetingsRouteWeb(),
    selected: false,
    title: "Meetings",
    icon: Icons.meeting_room_outlined,
  ),
  ConnectionsRouteWeb.name: SidebarItemModel(
    route: const ConnectionsRouteWeb(),
    selected: false,
    title: "Connections",
    icon: Icons.call_merge_sharp,
  ),
  // NotificationRouteWeb.name: SidebarItemModel(
  //   route: const NotificationRouteWeb(),
  //   selected: false,
  //   title: "Notifications",
  //   icon: Icons.notifications,
  // ),
  DeviceSettingsRouteWeb.name: SidebarItemModel(
    route: const DeviceSettingsRouteWeb(),
    selected: false,
    title: "Device Settings",
    icon: Icons.devices_other_outlined,
  ),
};
