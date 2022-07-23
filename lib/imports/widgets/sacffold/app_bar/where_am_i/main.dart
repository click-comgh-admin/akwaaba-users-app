import 'package:akwaaba_user_app/imports/functions/geolocator/web/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class WhereAmIButtonAppBarScaffoldWidget extends StatelessWidget {
  const WhereAmIButtonAppBarScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: AlertDialog(
                    title: Column(
                      children: [
                        const Text("My Current Position"),
                        Text(
                          "Internet connection required!",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Close"),
                      ),
                    ],
                    content: FutureBuilder(
                      future: geolocatorWebFunction(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Object?> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const LoadingWidget1();
                        }

                        TextStyle? textStyle =
                            Theme.of(context).textTheme.bodyText2;

                        if (snapshot.hasError) {
                          return Text(
                            "Geolocation: ${snapshot.error} :: error occured",
                            style: textStyle!.copyWith(color: Colors.red),
                          );
                        }
                        // print({"snapshot.hasData": snapshot.hasData});
                        if (snapshot.hasData) {
                          var data = snapshot.data!;
                          if (data is PositionUpdateException) {
                            return Text(
                              "Geolocation::error ${data.message}",
                              style: textStyle!.copyWith(color: Colors.orange),
                            );
                          }
                          if (data is Position) {
                            return SizedBox(
                              height: 155,
                              child: Column(
                                children: <Widget>[
                                  DataTable(columns: const [
                                    DataColumn(
                                      label: Text(
                                        'Query',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        'Response',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ], rows: [
                                    DataRow(cells: [
                                      const DataCell(
                                        Text(
                                          'Latitude',
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          children: [
                                            Text(
                                              data.latitude.toString(),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text('Coppied')),
                                                );
                                                await Clipboard.setData(
                                                  ClipboardData(
                                                      text: data.latitude
                                                          .toString()),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.copy_sharp,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                    DataRow(cells: [
                                      const DataCell(
                                        Text(
                                          'Longitude',
                                        ),
                                      ),
                                      DataCell(
                                        Row(
                                          children: [
                                            Text(
                                              data.longitude.toString(),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text('Coppied'),
                                                  ),
                                                );
                                                await Clipboard.setData(
                                                  ClipboardData(
                                                    text: data.longitude
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                Icons.copy_sharp,
                                                color: Theme.of(context)
                                                    .iconTheme
                                                    .color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ]),
                                ],
                              ),
                            );
                          }
                        }
                        return Text(
                          "Geolocation: _",
                          style: textStyle,
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: ListTile(
        leading: const Text("Where am I?"),
        trailing: Icon(
          color: Theme.of(context).iconTheme.color,
          CupertinoIcons.location_solid,
        ),
      ),
    );
  }
}
