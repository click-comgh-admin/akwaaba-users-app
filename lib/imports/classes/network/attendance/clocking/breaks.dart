import 'dart:io';
import 'dart:convert';
import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
import 'package:akwaaba_user_app/imports/classes/network/base/exceptions.dart';
import 'package:akwaaba_user_app/imports/database/models/users/login/main.dart';
import 'package:akwaaba_user_app/imports/functions/api/base_url/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/urls/api.dart';
import 'package:akwaaba_user_app/models/attendance/clocking/attendance/main.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final LoginUserModelDatabase _loginUserModelDatabase = LoginUserModelDatabase();

class AttendanceBreakClockerClockingAttendanceNetwork {
  static Future<Object> startBreak(
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
          "${apiBaseUrlFunctions(START_BREAK_MEMBER_CLOCKING_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$attendanceId");
      var request = http.Request('PATCH', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic response = json.decode(responseBody);

        AttendanceClockingAttendanceModel? clockingInfo;
        Map<String, dynamic> data = response as Map<String, dynamic>;
        clockingInfo = AttendanceClockingAttendanceModel.fromJson(data);
        // print({"clockingInfo": clockingInfo});
        // await _schedulesUserModelDatabase.addAttendanceSchedule(clockingInfo);

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

  static Future<Object> clockOut(
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
          "${apiBaseUrlFunctions(END_BREAK_MEMBER_CLOCKING_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$attendanceId");
      var request = http.Request('PATCH', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic response = json.decode(responseBody);

        AttendanceClockingAttendanceModel? clockingInfo;
        Map<String, dynamic> data = response as Map<String, dynamic>;
        clockingInfo = AttendanceClockingAttendanceModel.fromJson(data);
        // print({"clockingInfo": clockingInfo});
        // await _schedulesUserModelDatabase.addAttendanceSchedule(clockingInfo);

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

  static Future<Object> endBreak(
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
          "${apiBaseUrlFunctions(START_BREAK_MEMBER_CLOCKING_ATTENDANCE_SCHEDULES_API_ENDPOINTS)}/$attendanceId");
      var request = http.Request('PATCH', url);

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        // print({"responseBody": responseBody});
        dynamic response = json.decode(responseBody);

        AttendanceClockingAttendanceModel? clockingInfo;
        Map<String, dynamic> data = response as Map<String, dynamic>;
        clockingInfo = AttendanceClockingAttendanceModel.fromJson(data);
        // print({"clockingInfo": clockingInfo});
        // await _schedulesUserModelDatabase.addAttendanceSchedule(clockingInfo);

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
