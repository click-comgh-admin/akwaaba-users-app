// import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
// import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
// import 'package:akwaaba_user_app/imports/widgets/no_data_found/main.dart';
// import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_content.dart';
// import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar.dart';
// import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
// import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
// import 'package:akwaaba_user_app/models/users/connections/main.dart';
// import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
// import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
// import 'package:akwaaba_user_app/view_models/users/connections/main.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ConnectionsPageWeb extends StatefulWidget {
//   const ConnectionsPageWeb({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<ConnectionsPageWeb> createState() => _ConnectionsPageWebState();
// }

// class _ConnectionsPageWebState extends State<ConnectionsPageWeb> {
//   final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SidebarItemViewModel sidebarItemViewModelCtx =
//         context.watch<SidebarItemViewModel>();
//     sidebarItemViewModelCtx.setItem =
//         sidebarItemsMap[ConnectionsRouteWeb.name]!;

//     ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
//     scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

//     UserConnectionsViewModel userConnectionsViewModel =
//         context.watch<UserConnectionsViewModel>();

//     return Scaffold(
//       key: scaffoldViewModelCtx.scaffoldState,
//       // appBar: AppBarScaffoldWidget(titleText: "Connections Page",),
//       drawer: const SidebarDrawerBodyScaffoldWidget(),
//       body: Row(
//         children: [
//           const SideBarBodyScaffoldWidget(),
//           RightContentBodyScaffoldWidget(
//             title: const Text("Connections Page"),
//             child: _ui(userConnectionsViewModel),
//           ),
//         ],
//       ),
//     );
//   }

//   _ui(UserConnectionsViewModel userConnectionsViewModel) {
//     if (userConnectionsViewModel.loading) {
//       return const LoadingWidget1();
//     }

//     if (userConnectionsViewModel.networkFailure != null) {
//       return Text(userConnectionsViewModel.networkFailure.toString());
//     }
//     List<UserConnectionsModel> userConnections =
//         userConnectionsViewModel.userConnections;
//     ConnectionsData data = ConnectionsData();
//     data.setData = userConnections;
//     if (kDebugMode) {
//       print({"userConnections": userConnections});
//     }
//     return PaginatedDataTable(
//       source: data,
//       header: const Text('My Products'),
//       columns: const [
//         DataColumn(label: Text('#ID')),
//         DataColumn(label: Text('Connections'))
//       ],
//       columnSpacing: 100,
//       horizontalMargin: 10,
//       rowsPerPage: 8,
//       showCheckboxColumn: false,
//     );
//   }
// }

// class ConnectionsUi extends StatelessWidget {
//   const ConnectionsUi({
//     Key? key,
//     required this.userConnectionsViewModel,
//   }) : super(key: key);

//   final UserConnectionsViewModel userConnectionsViewModel;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: userConnectionsViewModel.myConnections(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (kDebugMode) {
//           print({"snapshot": snapshot.connectionState});
//         }
//         return const Text("data");
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: LoadingWidget1(),
//           );
//         }
//         if (!snapshot.hasData) {
//           return const NoDataFoundWidget();
//         }

//         ConnectionsData data = ConnectionsData();
//         data.setData = userConnectionsViewModel.userConnections;
//         if (kDebugMode) {
//           print({"snapshot.data": snapshot.data});
//           print({
//             "userConnectionsViewModel.userConnections":
//                 userConnectionsViewModel.userConnections
//           });
//         }
//         return PaginatedDataTable(
//           source: data,
//           header: const Text('My Products'),
//           columns: const [
//             DataColumn(label: Text('#ID')),
//             DataColumn(label: Text('Connections'))
//           ],
//           columnSpacing: 100,
//           horizontalMargin: 10,
//           rowsPerPage: 8,
//           showCheckboxColumn: false,
//         );
//       },
//     );
//   }
// }

// // The "soruce" of the table
// class ConnectionsData extends DataTableSource {
//   // Generate some made-up data
//   List<UserConnectionsModel> _data = [];
//   List<UserConnectionsModel> get data => _data;
//   set setData(List<UserConnectionsModel> data) {
//     _data = data;
//   }

//   @override
//   bool get isRowCountApproximate => false;
//   @override
//   int get rowCount => data.length;
//   @override
//   int get selectedRowCount => 0;
//   @override
//   DataRow getRow(int index) {
//     return DataRow(cells: [
//       DataCell(Text(data[index].connectionId.toString())),
//       DataCell(Text(data[index].connectionId)),
//     ]);
//   }
// }
