import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/functions/datetime/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/attendance/meeting/datatable/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/full/main.dart';
import 'package:akwaaba_user_app/models/attendance/schedule/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class AttendanceScheduleNetwork {
  static Future<Object> attendanceSchedule(
    int scheduleId, {
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      var url = Uri.parse(
          "${apiBaseUrlFunctions(ONE_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$scheduleId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic responseResponse = json.decode(responseBody);
        bool success = responseResponse['success'];
        AttendanceScheduleFullModel? schedule;
        if (success) {
          Map<String, dynamic> data =
              responseResponse['data'] as Map<String, dynamic>;
          schedule = AttendanceScheduleFullModel.fromJson(data);
          // print({"schedule": schedule});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(schedule);
        }

        return NetworkSuccess(
          response: schedule,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }

  static Future<Object> attendanceSchedulesUpcoming({
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      queryParameter['filter_memberId'] = currentLogin.memberId.toString();
      var url = Uri.parse(apiBaseUrlFunctions(
              MY_UPCOMMING_ATTENDANCE_SCHEDULES_API_ENDPOINTS))
          .replace(queryParameters: queryParameter);
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        List<dynamic> results = json.decode(responseBody)['results'];

        List<AttendanceScheduleModel> schedules = [];
        for (var result in results) {
          // print({"result": result});
          AttendanceScheduleModel schedule =
              AttendanceScheduleModel.fromJson(result);
          // print({"schedule": schedule});
          if (!schedules.contains(schedule)) {
            schedules.add(schedule);
            // await _schedulesUserModelDatabase.addAttendanceSchedule(schedule);
          }
        }

        return NetworkSuccess(
          response: schedules,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }

  static Future<Object> meetingDatatable(MeetingViewTypes viewType,
      {Map<String, dynamic>? queryParameter, DateTime? date}) async {
    try {
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };

      queryParameter!['datatable_plugin'] = "";
      Uri url;
      switch (viewType) {
        case MeetingViewTypes.now:
          url = Uri.parse(apiBaseUrlFunctions(
                  MY_NOW_ATTENDANCE_SCHEDULES_API_ENDPOINTS))
              .replace(queryParameters: queryParameter);
          break;
        case MeetingViewTypes.today:
          url = Uri.parse(apiBaseUrlFunctions(
                  MY_TODAY_ATTENDANCE_SCHEDULES_API_ENDPOINTS))
              .replace(queryParameters: queryParameter);
          break;
        case MeetingViewTypes.upcoming:
          url = Uri.parse(apiBaseUrlFunctions(
                  MY_UPCOMMING_ATTENDANCE_SCHEDULES_API_ENDPOINTS))
              .replace(queryParameters: queryParameter);
          break;
        case MeetingViewTypes.date:
          String formatedDate =
              formatDateDatetimeFunction(date!);
          url = Uri.parse(
                  "${apiBaseUrlFunctions(MY_DATE_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$formatedDate")
              .replace(queryParameters: queryParameter);
          break;
        default:
          throw "Unknown meeting type";
      }
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        AttendanceScheduleDatatableModel meetings =
            attendanceScheduleDatatableModelFromJson(responseBody);
        return NetworkSuccess(
          response: meetings,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }

  static Future<Object> attendanceSchedulesToday({
    Map<String, dynamic>? queryParameter,
  }) async {
    try {
      queryParameter = queryParameter ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      queryParameter['filter_memberId'] = currentLogin.memberId.toString();
      var url = Uri.parse(
              apiBaseUrlFunctions(MY_TODAY_ATTENDANCE_SCHEDULES_API_ENDPOINTS))
          .replace(queryParameters: queryParameter);
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        List<dynamic> results = json.decode(responseBody)['results'];

        List<AttendanceScheduleModel> schedules = [];
        for (var result in results) {
          // print({"result": result});
          AttendanceScheduleModel schedule =
              AttendanceScheduleModel.fromJson(result);
          // print({"schedule": schedule});
          if (!schedules.contains(schedule)) {
            schedules.add(schedule);
            // await _schedulesUserModelDatabase.addAttendanceSchedule(schedule);
          }
        }

        return NetworkSuccess(
          response: schedules,
          code: response.statusCode,
        );
      } else {
        String reasonPhrase = response.reasonPhrase!;
        // print({"reasonPhrase": reasonPhrase, "responseBody": responseBody});
        return NetworkFailure(
          data: json.decode(responseBody),
          errorResponse: reasonPhrase,
          code: response.statusCode,
        );
      }
    } on SocketException catch (e) {
      final error = NoInternetException(
        message: "No Internt",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on HttpException catch (e) {
      final error = NoServiceFoundException(
        message: "No Service Found",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } on FormatException catch (e) {
      final error = InvalidFormatException(
        message: "Invalid Data Format",
        exception: e,
      );
      return NetworkFailure(
        errorResponse: error,
        code: error.code,
      );
    } catch (e) {
      if (kDebugMode) {
        print({"e-e-e-e": e});
      }
      final error = Exception(e);
      return NetworkFailure(
        errorResponse: error,
        code: error.hashCode,
      );
    }
  }
}
