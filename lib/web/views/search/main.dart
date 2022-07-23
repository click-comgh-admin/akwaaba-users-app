import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/constants/search/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/right_content.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/drawer.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:akwaaba_user_app/view_models/scaffold/main.dart';
import 'package:akwaaba_user_app/view_models/sidebar/items/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchfield/searchfield.dart';

class SearchPageWeb extends StatefulWidget {
  const SearchPageWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPageWeb> createState() => _SearchPageWebState();
}

class _SearchPageWebState extends State<SearchPageWeb> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SidebarItemViewModel sidebarItemViewModelCtx =
        context.watch<SidebarItemViewModel>();
    sidebarItemViewModelCtx.setItem = sidebarItemsMap[HomeRouteWeb.name]!;

    ScaffoldViewModel scaffoldViewModelCtx = context.watch<ScaffoldViewModel>();
    scaffoldViewModelCtx.setScaffoldState = _scaffoldState;

    final List<String> searchPages = sidebarItemsMap.keys
        .map((key) => sidebarItemsMap[key]!.title!)
        .toList();
    final formKey = GlobalKey<FormState>();

    final searchController = TextEditingController();

    return Scaffold(
      key: scaffoldViewModelCtx.scaffoldState,
      drawer: const SidebarDrawerBodyScaffoldWidget(),
      body: Row(
        children: [
          const SideBarBodyScaffoldWidget(),
          RightContentBodyScaffoldWidget(
            showSearch: false,
            title: const Text("Search Page"),
            topMainChild: Container(),
            child: Form(
              key: formKey,
              onChanged: () {
                // if (kDebugMode) {
                //   print({"_searchController.text": searchController.text});
                // }
                if (searchController.text.isNotEmpty) {
                  for (String key in sidebarItemsMap.keys) {
                    SidebarItemModel sidebarItem = sidebarItemsMap[key]!;
                    if (sidebarItem.title == searchController.text) {
                      AutoRouter.of(context).push(sidebarItem.route!);
                    }
                  }
                }
              },
              child: Center(
                child: SearchField(
                  controller: searchController,
                  suggestions:
                      searchPages.map((e) => SearchFieldListItem(e)).toList(),
                  hasOverlay: true,
                  validator: (x) {
                    if (!searchPages.contains(x) || x!.isEmpty) {
                      return 'Please Enter a valid State';
                    }
                    return null;
                  },
                  searchInputDecoration: searchConstantTheme(
                    context,
                    bordered: true,
                  ),
                  suggestionItemDecoration:
                      BoxDecoration(color: Theme.of(context).cardColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
