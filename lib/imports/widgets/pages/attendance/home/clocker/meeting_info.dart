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
}) {
  return [
    DataRow(cells: [
      const DataCell(
        Text(
          'Type',
        ),
      ),
      DataCell(
        Text(meetingType),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text("Meeting Span"),
      ),
      DataCell(
        Text(meetingSpanStr),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Next Meeting Date',
        ),
      ),
      DataCell(
        Text(meetingDate),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Start Time',
        ),
      ),
      DataCell(
        Text(startTime),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Close Time',
        ),
      ),
      DataCell(
        Text(closeTime),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Allows Break?',
        ),
      ),
      DataCell(
        Text(
          hasBreakTime ? "Yes" : "No",
        ),
      ),
    ]),
    if (hasBreakTime)
      DataRow(cells: [
        const DataCell(
          Text(
            'Start Break Time',
          ),
        ),
        DataCell(
          Text(
            meetingBreaks.start,
          ),
        ),
      ]),
    if (hasBreakTime)
      DataRow(cells: [
        const DataCell(
          Text(
            'End Break Time',
          ),
        ),
        DataCell(
          Text(
            meetingBreaks.end,
          ),
        ),
      ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Lateness Time',
        ),
      ),
      DataCell(
        Text(
          latenessTime,
        ),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Meeting Place',
        ),
      ),
      DataCell(
        Text(
          meetingLocationStr,
        ),
      ),
    ]),
    if (hasVirtualMeeting)
      DataRow(cells: [
        const DataCell(
          Text(
            'Virtual Meeting Type',
          ),
        ),
        DataCell(
          Text(
            virtualMeetingTypeStr,
          ),
        ),
      ]),
    if (hasVirtualMeeting)
      DataRow(cells: [
        const DataCell(
          Text(
            'Virtual Meeting Link',
          ),
        ),
        DataCell(
          Text(
            virtualMeetingLink,
          ),
        ),
      ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Expected Monthly Attendance',
        ),
      ),
      DataCell(
        Text(
          expectedMonthlyAttendance.toString(),
        ),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Active Monthly Attendance',
        ),
      ),
      DataCell(
        Text(
          activeMonthlyAttendance.toString(),
        ),
      ),
    ]),
    DataRow(cells: [
      const DataCell(
        Text(
          'Agenda',
        ),
      ),
      DataCell(
        Text(
          agenda,
        ),
      ),
    ]),
  ];
}

class WPAHmeetingBreaks {
  final String start;
  final String end;

  const WPAHmeetingBreaks({
    required this.start,
    required this.end,
  });
}
