// import 'dart:convert';

// DatatableDataModel datatableDataModelFromJson(String str) =>
//     DatatableDataModel.fromJson(json.decode(str));

// String datatableDataModelToJson(DatatableDataModel data) =>
//     json.encode(data.toJson());

// class DatatableDataModel<DatatableDataType> {
//   DatatableDataModel({
//     this.draw,
//     this.recordsTotal,
//     this.recordsFiltered,
//     this.datatablePlugin,
//     this.data,
//   });

//   String? draw;
//   int? recordsTotal;
//   int? recordsFiltered;
//   bool? datatablePlugin;
//   List<DatatableDataType>? data;

//   factory DatatableDataModel.fromJson(Map<String, dynamic> json) {
//     // indicatorPadding
//     return DatatableDataModel(
//       draw: json["draw"],
//       recordsTotal: json["recordsTotal"],
//       recordsFiltered: json["recordsFiltered"],
//       datatablePlugin: json["datatable_plugin"],
//       data: List<DatatableDataType>.from(
//           json["data"].map((x) {
//             _jkj(){}
//             // ignore: undefined_method
//             return DatatableDataType.fromJson(x);
//           })),
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         "draw": draw,
//         "recordsTotal": recordsTotal,
//         "recordsFiltered": recordsFiltered,
//         "datatable_plugin": datatablePlugin,
//         "data": List<DatatableDataType>.from(data!.map((x) {
//           return dataTypeToJson(x);
//         })),
//       };

//   dataTypeToJson(x) => x.toJson();

//   @override
//   String toString() {
//     return toJson().toString();
//   }
// }

// class DatatableDataType {
//   dynamic data;
//   DatatableDataType({this.data});
//   factory DatatableDataType.fromJson(Map<String, dynamic> json) =>
//       DatatableDataType(
//         data: json["data"],
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data,
//       };
// }
