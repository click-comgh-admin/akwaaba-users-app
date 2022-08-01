import 'package:akwaaba_user_app/imports/widgets/pages/attendance/home/clocker/meeting_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WPAHmeetingBreaksDialogIcon extends StatelessWidget {
  final String meetingType;
  final String meetingName;
  final String meetingSpanStr;
  final String meetingDate;
  final String startTime;
  final String closeTime;
  final bool hasBreakTime;
  final String meetingLocationStr;
  final String virtualMeetingTypeStr;
  final bool hasVirtualMeeting;
  final String virtualMeetingLink;
  final String latenessTime;
  final WPAHmeetingBreaks meetingBreaks;
  final String expectedMonthlyAttendance;
  final String activeMonthlyAttendance;
  final String agenda;
  const WPAHmeetingBreaksDialogIcon({
    Key? key,
    required this.meetingType,
    required this.meetingName,
    required this.meetingSpanStr,
    required this.meetingDate,
    required this.startTime,
    required this.closeTime,
    required this.hasBreakTime,
    required this.meetingLocationStr,
    required this.virtualMeetingTypeStr,
    required this.hasVirtualMeeting,
    required this.virtualMeetingLink,
    required this.latenessTime,
    required this.meetingBreaks,
    required this.expectedMonthlyAttendance,
    required this.activeMonthlyAttendance,
    required this.agenda,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.grey,
      icon: Icon(
        CupertinoIcons.ellipsis_vertical,
        color: Theme.of(context).iconTheme.color,
      ),
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: AlertDialog(
                    title: Text(meetingName),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                    content: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          DataTable(
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Query',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Response',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            rows: clockerMeetingInfo(
                              context: context,
                              meetingType: meetingType,
                              meetingSpanStr: meetingSpanStr,
                              meetingDate: meetingDate,
                              startTime: startTime,
                              closeTime: closeTime,
                              hasBreakTime: hasBreakTime,
                              meetingLocationStr: meetingLocationStr,
                              virtualMeetingTypeStr: virtualMeetingTypeStr,
                              hasVirtualMeeting: hasVirtualMeeting,
                              virtualMeetingLink: virtualMeetingLink,
                              latenessTime: latenessTime,
                              meetingBreaks: meetingBreaks,
                              expectedMonthlyAttendance:
                                  expectedMonthlyAttendance,
                              activeMonthlyAttendance: activeMonthlyAttendance,
                              agenda: agenda,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
