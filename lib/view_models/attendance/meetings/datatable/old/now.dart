
  // AttendanceMeetingTabBarModel? _tab;
  // String _search = "";

  // @override
  // String get search => _search;

  // @override
  // AttendanceMeetingTabBarModel? get tab => _tab;

  // @override
  // set setTab(AttendanceMeetingTabBarModel tab) {
  //   _tab = tab;
  // }

  // @override
  // set setSearch(String search) {
  //   _search = search;
  // }

  // @override
  // void clearSearch() {
  //   _search = "";
  // }

  // @override
  // Future<bool> getData(Map<String, dynamic> queryParameter,
  //     {DateTime? date}) async {
  //   queryParameter['filter_recuring'] = "both";
  //   var userConnectionsSuccess = false;
  //   var response = await AttendanceScheduleNetwork.meetingDatatable(
  //       MeetingViewTypes.now,
  //       date: date,
  //       queryParameter: queryParameter,);

  //   if (response is NetworkSuccess) {
  //     setUserConnectionsDatatableModel(
  //         response.response as UserConnectionsDatatableModel);
  //     userConnectionsSuccess = true;
  //   }
  //   if (response is NetworkFailure) {
  //     setNetworkFailure(response);
  //     userConnectionsSuccess = false;
  //   }
  //   return userConnectionsSuccess;
  // }
  
  // @override
  // // TODO: implement attendanceScheduleDatatable
  // AttendanceScheduleDatatableModel? get attendanceScheduleDatatable => throw UnimplementedError();
  
  // @override
  // // TODO: implement loading
  // bool get loading => throw UnimplementedError();
  
  // @override
  // void nF() {
  //   nF();
  // }
  
  // @override
  // // TODO: implement networkFailure
  // NetworkFailure? get networkFailure => throw UnimplementedError();
  
  // @override
  // setAttendanceScheduleDatatableModel(AttendanceScheduleDatatableModel attendanceScheduleDatatable) {
  //   // TODO: implement setAttendanceScheduleDatatableModel
  //   throw UnimplementedError();
  // }
  
  // @override
  // void setLoading(bool loading) {
  //   // TODO: implement setLoading
  // }
  
  // @override
  // void setNetworkFailure() {
  //   // TODO: implement setNetworkFailure
  // }