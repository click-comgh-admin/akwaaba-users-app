// import 'package:akwaaba_user_app/imports/classes/network/base/api/status.dart';
// import 'package:akwaaba_user_app/imports/classes/network/login/main.dart';
// import 'package:akwaaba_user_app/models/users/profile/main.dart';
// import 'package:flutter/material.dart';

// class ProfileViewModel extends ChangeNotifier {
//   bool _loading = false;
//   List<ProfileModel> _profileListModel = [];
//   late NetworkFailure _networkFailure;

//   bool get loading => _loading;
//   List<ProfileModel> get profileListModel => _profileListModel;
//   NetworkFailure get networkFailure => _networkFailure;

//   setLoading(bool loading) async {
//     _loading = loading;
//     notifyListeners(); // called once here;
//   }

//   setProfileListModel(List<ProfileModel> profileListModel) {
//     _profileListModel = profileListModel;
//   }

//   setNetworkFailure(NetworkFailure networkFailure) {
//     _networkFailure = networkFailure;
//   }

//   getProfiles() async {
//     setLoading(true);
//     var response = await LoginNetwork.getUser();
//     if (response is NetworkSuccess) {
//       setProfileListModel(response.response as List<ProfileModel>);
//     }
//     if (response is NetworkFailure) {
//       // NetworkExceptions networkExceptions = NetworkExceptions(
//       //   code: response.code,
//       //   message: response.errorResponse,
//       // );
//       // setNetworkExceptions(networkExceptions);
//       setNetworkFailure(networkFailure);
//     }
//     setLoading(false);
//   }
// }
