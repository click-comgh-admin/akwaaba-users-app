import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/upcoming/ui.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/upcoming/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpcomingAttendancePagesHomeWidget extends StatefulWidget {
  const UpcomingAttendancePagesHomeWidget({Key? key}) : super(key: key);

  @override
  State<UpcomingAttendancePagesHomeWidget> createState() =>
      _UpcomingAttendancePagesHomeWidgetState();
}

class _UpcomingAttendancePagesHomeWidgetState
    extends State<UpcomingAttendancePagesHomeWidget> {
  String title = "Upcoming Meeting(s)/ Event(s)";
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    AttendanceScheduleUpcomingViewModel upcomingSchedules =
        context.watch<AttendanceScheduleUpcomingViewModel>();

    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Expanded(
            child: Center(
              child: UiUpcomingAttendancePagesHomeWidget(
                upcomingSchedules: upcomingSchedules,
                title: title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
