import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/details/main.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class AttendanceClockingAttendanceNetwork {
  static Future<Object> memberAttendanceId(
    int attendanceId, {
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
          "${apiBaseUrlFunctions(ATTENDANCE_MEMBER_CLOCKING_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$attendanceId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic response = json.decode(responseBody);
        bool success = response['success'];
        AttendanceClockingAttendanceDetailsModel? clockingInfo;
        if (success) {
          Map<String, dynamic> data = response['data'] as Map<String, dynamic>;
          clockingInfo =
              AttendanceClockingAttendanceDetailsModel.fromJson(data);
          // print({"clockingInfo": clockingInfo});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(clockingInfo);
        }

        return NetworkSuccess(
          response: clockingInfo,
          code: 200,
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

  static Future<Object> memberAttendance(
    int scheduleId, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      queryParameters = queryParameters ?? {};
      UserLoginModel? currentLogin = await _loginUserModelDatabase.getLogin();
      if (currentLogin == null) return Object();
      var headers = {
        'Authorization': 'Token ${currentLogin.token}',
        'Content-Type': 'application/json',
      };
      queryParameters['meetingEventId'] = scheduleId.toString();
      var url = Uri.parse(
        apiBaseUrlFunctions(
            ATTENDANCE_MEMBER_CLOCKING_ATTENDANCE_SCHEDULES_API_ENDPOINTS),
      ).replace(queryParameters: queryParameters);
      var request = http.Request('GET', url);
      // print({"request": request});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        List<dynamic> results = json.decode(responseBody)['results'];
        // print({"responseBody-results": results});

        AttendanceClockingAttendanceDetailsModel? clockingInfo;
        for (var result in results) {
          // print({"responseBody-result": result});
          clockingInfo =
              AttendanceClockingAttendanceDetailsModel.fromJson(result);
          // print({"responseBody-clockingInfo---${clockingInfo.meetingEventId!.name}": clockingInfo});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(date);
        }

        return NetworkSuccess(
          response: clockingInfo,
          code: 200,
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

  static Future<Object> clockingInfo(
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
          "${apiBaseUrlFunctions(BREAK_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}?meetingEventId=$scheduleId");
      var request = http.Request('GET', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        List<dynamic> results = json.decode(responseBody)['results'];

        AttendanceClockingAttendanceModel? clockingInfo;
        for (var result in results) {
          // print({"result": result});
          clockingInfo = AttendanceClockingAttendanceModel.fromJson(result);
          // print({"clockingInfo": clockingInfo});
          // await _schedulesUserModelDatabase.addAttendanceSchedule(date);
        }

        return NetworkSuccess(
          response: clockingInfo,
          code: 200,
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
