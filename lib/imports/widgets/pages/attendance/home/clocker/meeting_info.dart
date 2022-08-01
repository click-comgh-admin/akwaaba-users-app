import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:flutter/material.dart';

List<DataRow> clockerMeetingInfo({
  required String meetingType,
  required String meetingSpanStr,
  required String meetingDate,
  required String startTime,
  required String closeTime,
  required bool hasBreakTime,
  required String meetingLocationStr,
  required String virtualMeetingTypeStr,
  required bool hasVirtualMeeting,
  required String virtualMeetingLink,
  required String latenessTime,
  required WPAHmeetingBreaks meetingBreaks,
  required String expectedMonthlyAttendance,
  required String activeMonthlyAttendance,
  required String agenda,
  required BuildContext context,
}) {
  TextStyle textStyle = Theme.of(context).textTheme.bodyText2!.copyWith(
      fontSize: body2FontSizeResponsiveSizingContantsUtilities(context));
  return [
    DataRow(cells: [
      DataCell(
        Text('Type', style: textStyle),
      ),
      DataCell(
        Text(meetingType, style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text("Meeting Span", style: textStyle),
      ),
      DataCell(
        Text(meetingSpanStr, style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Next Meeting Date', style: textStyle),
      ),
      DataCell(
        Text(meetingDate, style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Start Time', style: textStyle),
      ),
      DataCell(
        Text(startTime, style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Close Time', style: textStyle),
      ),
      DataCell(
        Text(closeTime, style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Allows Break?', style: textStyle),
      ),
      DataCell(
        Text(hasBreakTime ? "Yes" : "No", style: textStyle),
      ),
    ]),
    if (hasBreakTime)
      DataRow(cells: [
        DataCell(
          Text('Start Break Time', style: textStyle),
        ),
        DataCell(
          Text(meetingBreaks.start, style: textStyle),
        ),
      ]),
    if (hasBreakTime)
      DataRow(cells: [
        DataCell(
          Text('End Break Time', style: textStyle),
        ),
        DataCell(
          Text(meetingBreaks.end, style: textStyle),
        ),
      ]),
    DataRow(cells: [
      DataCell(
        Text('Lateness Time', style: textStyle),
      ),
      DataCell(
        Text(latenessTime, style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Meeting Place', style: textStyle),
      ),
      DataCell(
        Text(meetingLocationStr, style: textStyle),
      ),
    ]),
    if (hasVirtualMeeting)
      DataRow(cells: [
        DataCell(
          Text('Virtual Meeting Type', style: textStyle),
        ),
        DataCell(
          Text(virtualMeetingTypeStr, style: textStyle),
        ),
      ]),
    if (hasVirtualMeeting)
      DataRow(cells: [
        DataCell(
          Text('Virtual Meeting Link', style: textStyle),
        ),
        DataCell(
          Text(virtualMeetingLink, style: textStyle),
        ),
      ]),
    DataRow(cells: [
      DataCell(
        Text('Expected Monthly Attendance', style: textStyle),
      ),
      DataCell(
        Text(expectedMonthlyAttendance.toString(), style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Active Monthly Attendance', style: textStyle),
      ),
      DataCell(
        Text(activeMonthlyAttendance.toString(), style: textStyle),
      ),
    ]),
    DataRow(cells: [
      DataCell(
        Text('Agenda', style: textStyle),
      ),
      DataCell(
        Text(agenda, style: textStyle),
      ),
    ]),
  ];
}

class WPAHmeetingBreaks {
  final String start;
  final String end;

  WPAHmeetingBreaks({
    required this.start,
    required this.end,
  });

  @override
  String toString() {
    return '{"start": "$start", "end": "$end"}';
  }
}
