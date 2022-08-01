import 'package:advanced_datatable/advanced_datatable_source.dart';
import 'package:advanced_datatable/datatable.dart';
import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/functions/offline_profile_pictures/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/responsive/font_size/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_content.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main_datatable.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:akwaaba_user_app/view_models/users/connections/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectionsPageWeb extends StatefulWidget {
  const ConnectionsPageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ConnectionsPageWeb> createState() => _ConnectionsPageWebState();
}

class _ConnectionsPageWebState extends State<ConnectionsPageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  // int _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  // ExampleSource _source = ExampleSource();
  // int _sortIndex = 0;
  // bool _sortAsc = true;
  // final _searchController = TextEditingController();
  // bool _customFooter = false;

  var _rowsPerPage = AdvancedPaginatedDataTable.defaultRowsPerPage;
  final ExampleSource _source = ExampleSource();
  final _sortIndex = 0;
  final _sortAsc = true;
  final _searchController = TextEditingController();
  final _customFooter = false;

  @override
  void initState() {
    super.initState();
    _searchController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    // _source = ExampleSource(context: context);
    SidebarItemViewModel sidebarItemViewModelCtx =
        context.watch<SidebarItemViewModel>();
    sidebarItemViewModelCtx.setItem =
        sidebarItemsMap[ConnectionsRouteWeb.name]!;

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      // appBar: AppBarScaffoldWidget(titleText: "Connections Page",),
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      body: Row(
        children: [
          const SideBarBodyScaffoldWidget(),
          RightContentBodyScaffoldWidget(
            title: Text(
              "Connections Page",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontSize: body2FontSizeResponsiveSizingContantsUtilities(
                      context,
                    ),
                  ),
            ),
            // topMainChild: Container(),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "My Connections",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                AdvancedPaginatedDataTable(
                  addEmptyRows: false,
                  source: _source,
                  showHorizontalScrollbarAlways: true,
                  sortAscending: _sortAsc,
                  sortColumnIndex: _sortIndex,
                  showFirstLastButtons: true,
                  rowsPerPage: _rowsPerPage,
                  availableRowsPerPage: const [10, 20, 30, 50],
                  onRowsPerPageChanged: (newRowsPerPage) {
                    if (newRowsPerPage != null) {
                      setState(() {
                        _rowsPerPage = newRowsPerPage;
                      });
                    }
                  },
                  columns: const [
                    DataColumn(
                      label: Text('Connection'),
                    ),
                    DataColumn(
                      label: Text('Info'),
                    ),
                  ],
                  getFooterRowText: (startRow, pageSize, totalFilter,
                      totalRowsWithoutFilter) {
                    final localizations = MaterialLocalizations.of(context);
                    var amountText = localizations.pageRowsInfoTitle(
                      startRow,
                      pageSize,
                      totalFilter ?? totalRowsWithoutFilter,
                      false,
                    );

                    if (totalFilter != null) {
                      //Filtered data source show addtional information
                      amountText += ' filtered from ($totalRowsWithoutFilter)';
                    }

                    return amountText;
                  },
                  customTableFooter: _customFooter
                      ? (source, offset) {
                          const maxPagesToShow = 6;
                          const maxPagesBeforeCurrent = 3;
                          final lastRequestDetails = source.lastDetails!;
                          final rowsForPager =
                              lastRequestDetails.filteredRows ??
                                  lastRequestDetails.totalRows;
                          final totalPages = rowsForPager ~/ _rowsPerPage;
                          final currentPage = (offset ~/ _rowsPerPage) + 1;
                          final List<int> pageList = [];
                          if (currentPage > 1) {
                            pageList.addAll(
                              List.generate(
                                  currentPage - 1, (index) => index + 1),
                            );
                            //Keep up to 3 pages before current in the list
                            pageList.removeWhere(
                              (element) =>
                                  element < currentPage - maxPagesBeforeCurrent,
                            );
                          }
                          pageList.add(currentPage);
                          //Add reminding pages after current to the list
                          pageList.addAll(
                            List.generate(
                              maxPagesToShow - (pageList.length - 1),
                              (index) => (currentPage + 1) + index,
                            ),
                          );
                          pageList
                              .removeWhere((element) => element > totalPages);

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: pageList
                                .map(
                                  (e) => TextButton(
                                    onPressed: e != currentPage
                                        ? () {
                                            //Start index is zero based
                                            source.setNextView(
                                              startIndex:
                                                  (e - 1) * _rowsPerPage,
                                            );
                                          }
                                        : null,
                                    child: Text(
                                      e.toString(),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleSource extends AdvancedDataTableSource<UserConnectionsModel> {
  List<int> selectedIds = [];
  String lastSearchTerm = '';
  RemoteDataSourceDetails<UserConnectionsModel>? _setDataDetails;

  RemoteDataSourceDetails<UserConnectionsModel>? get setDataDetails =>
      _setDataDetails;

  set setDataRows(
      RemoteDataSourceDetails<UserConnectionsModel> setDataDetails) {
    _setDataDetails = setDataDetails;
  }

  @override
  DataRow? getRow(int index) => rowGenerator(lastDetails!.rows[index]);

  imageWidget(String photo) {
    Map<String, Object> offlineProfilePicture = offlineProfilePictureFunction(
      photo,
    );
    return offlineProfilePicture['inProduction'] as bool
        ? Image(
            height: 45,
            image: NetworkImage(
              offlineProfilePicture['url'] as String,
            ),
            fit: BoxFit.cover,
          )
        : Image.asset(
            height: 45,
            offlineProfilePicture['url'] as String,
            fit: BoxFit.cover,
          );
  }

  rowGenerator(UserConnectionsModel row) {
    var connectionId = row.connectionId;
    if (connectionId is ProfileModel) {
      final Widget image = imageWidget(connectionId.profilePicture!);
      return DataRow(cells: [
        DataCell(
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: SizedBox(
              height: 45,
              width: 45,
              child: image,
            ),
          ),
        ),
        DataCell(
          Text(
            "${connectionId.firstname} ${connectionId.middlename} ${connectionId.surname}",
          ),
        ),
      ]);
    }
    if (connectionId is OrganizationProfileModel) {
      final image = imageWidget(connectionId.logo!);
      return DataRow(cells: [
        DataCell(image),
        DataCell(Text("${connectionId.organizationName}")),
      ]);
    }
  }

  void selectedRow(int id, bool newSelectState) {
    if (selectedIds.contains(id)) {
      selectedIds.remove(id);
    } else {
      selectedIds.add(id);
    }
    notifyListeners();
  }

  void filterServerSide(String filterQuery) {
    lastSearchTerm = filterQuery.toLowerCase().trim();
    setNextView();
  }

  @override
  int get selectedRowCount => selectedIds.length;

  @override
  Future<RemoteDataSourceDetails<UserConnectionsModel>> getNextPage(
      NextPageRequest pageRequest) async {
    //the remote data source has to support the pagaing and sorting
    final queryParameter = <String, dynamic>{
      'offset': pageRequest.offset.toString(),
      'pageSize': pageRequest.pageSize.toString(),
      'sortIndex': ((pageRequest.columnSortIndex ?? 0) + 1).toString(),
      'sortAsc': ((pageRequest.sortAscending ?? true) ? 1 : 0).toString(),
      if (lastSearchTerm.isNotEmpty) 'companyFilter': lastSearchTerm,
    };

    UserConnectionsViewModel userConnectionsViewModel =
        UserConnectionsViewModel();

    await userConnectionsViewModel.myConnectionsDatatable(queryParameter);

    if (userConnectionsViewModel.networkFailure != null) {
      throw Exception(userConnectionsViewModel.networkFailure);
    }
    UserConnectionsDatatableModel? userConnectionsDatatable =
        userConnectionsViewModel.userConnectionsDatatable;
    // if (kDebugMode) {
    //   print({"userConnectionsDatatable": userConnectionsDatatable});
    // }
    _setDataDetails = RemoteDataSourceDetails(
      userConnectionsDatatable!.recordsTotal!,
      userConnectionsDatatable.data!,
      filteredRows: userConnectionsDatatable.recordsFiltered,
    );
    notifyListeners();
    return _setDataDetails!;
  }
}
