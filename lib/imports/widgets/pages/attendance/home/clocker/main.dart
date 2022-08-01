import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/ui.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/today/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockerAttendancePagesHomeWidget extends StatefulWidget {
  const ClockerAttendancePagesHomeWidget({Key? key}) : super(key: key);

  @override
  State<ClockerAttendancePagesHomeWidget> createState() =>
      _ClockerAttendancePagesHomeWidgetState();
}

class _ClockerAttendancePagesHomeWidgetState
    extends State<ClockerAttendancePagesHomeWidget> {
  String title = "Today's Meeting/ Event";

  @override
  void initState() {
    super.initState();
    AttendanceScheduleTodayViewModel todaySchedules = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      todaySchedules.todaySchedules();
    });
  }

  @override
  Widget build(BuildContext context) {
    AttendanceScheduleTodayViewModel todaySchedules =
        context.watch<AttendanceScheduleTodayViewModel>();

    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Center(
            child: UiClockerAttendancePagesHomeWidget(
              title: title,
              todaySchedules: todaySchedules,
            ),
          ),
        ],
      ),
    );
  }
}
