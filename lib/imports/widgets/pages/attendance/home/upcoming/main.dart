import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/upcoming/ui.dart';
import 'package:akwaaba_user_app/imports/widgets/text_button/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/schedules/upcoming/main.dart';
import 'package:auto_route/auto_route.dart';
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
  String title = "Upcoming Meeting/ Event";
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
    AttendanceScheduleUpcomingViewModel upcomingSchedules =
        Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      upcomingSchedules.upcomingSchedules();
    });
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              TextButtonIconWidget(
                onPressed: () {
                  AutoRouter.of(context).push(const AttendanceMeetingsRouteWeb());
                },
                // color: Colors.indigo,
                icon: Icons.arrow_right_alt_sharp,
                label: "View All Meetings",
              ),
            ],
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
