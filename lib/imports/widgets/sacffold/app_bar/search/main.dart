import 'package:akwaaba_user_app/imports/utilities/constants/padding_margin/main.dart';
import 'package:akwaaba_user_app/imports/utilities/theme/constants/search/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/body/sidebar/list.dart';
import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class ActionSearchAppBarScaffoldWidget extends StatefulWidget {
  const ActionSearchAppBarScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ActionSearchAppBarScaffoldWidget> createState() =>
      _ActionSearchAppBarScaffoldWidgetState();
}

class _ActionSearchAppBarScaffoldWidgetState
    extends State<ActionSearchAppBarScaffoldWidget> {
  bool showSearchMatches = false;
  @override
  void initState() {
    super.initState();
  }

  final List<String> searchPages =
      sidebarItemsMap.keys.map((key) => sidebarItemsMap[key]!.title!).toList();
  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();

  final double width = 350.00;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 13.0),
        child: Row(
          children: [
            SizedBox(
              width: width,
              // height: 55,
              child: Center(
                child: Stack(
                  children: [
                    SizedBox(
                      width: width,
                      height: 55,
                      child: Card(
                        elevation: 15,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shadowColor: Colors.grey.shade100.withOpacity(0.15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: pAll8PaddingMarginConstantsUtilities,
                        child: Row(
                          children: [
                            Form(
                              key: _formKey,
                              onChanged: () {
                                // print({
                                //   "_searchController.text":
                                //       _searchController.text
                                // });
                                if (_searchController.text.isNotEmpty) {
                                  for (String key in sidebarItemsMap.keys) {
                                    SidebarItemModel sidebarItem =
                                        sidebarItemsMap[key]!;
                                    if (sidebarItem.title ==
                                        _searchController.text) {
                                      AutoRouter.of(context)
                                          .push(sidebarItem.route!);
                                    }
                                  }
                                }
                              },
                              child: Center(
                                child: SizedBox(
                                  width: width-20,
                                  child: SearchField(
                                    controller: _searchController,
                                    suggestions: searchPages
                                        .map((e) => SearchFieldListItem(e))
                                        .toList(),
                                    hasOverlay: true,
                                    validator: (x) {
                                      if (!searchPages.contains(x) ||
                                          x!.isEmpty) {
                                        return 'Please Enter a valid State';
                                      }
                                      return null;
                                    },
                                    searchInputDecoration: searchConstantTheme(
                                      context,
                                      bordered: false,
                                    ),
                                    onSuggestionTap: (p0) {
                                      if (kDebugMode) {
                                        // print({"p0": p0});
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 45),
          ],
        ),
      ),
    );
  }
}
