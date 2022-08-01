import 'package:akwaaba_user_app/imports/functions/device_info/main.dart';
import 'package:akwaaba_user_app/imports/utilities/extentions/string/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_io/io.dart';

class DeviceInfoButtonAppBarScaffoldWidget extends StatefulWidget {
  const DeviceInfoButtonAppBarScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<DeviceInfoButtonAppBarScaffoldWidget> createState() =>
      _DeviceInfoButtonAppBarScaffoldWidgetState();
}

class _DeviceInfoButtonAppBarScaffoldWidgetState
    extends State<DeviceInfoButtonAppBarScaffoldWidget> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    deviceInfoFunction().then((value) => _deviceData = value);
  }

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
                        const Text("Device Info"),
                        Text(
                          kIsWeb
                              ? 'Web Browser info'
                              : Platform.isAndroid
                                  ? 'Android Device Info'
                                  : Platform.isIOS
                                      ? 'iOS Device Info'
                                      : Platform.isLinux
                                          ? 'Linux Device Info'
                                          : Platform.isMacOS
                                              ? 'MacOS Device Info'
                                              : Platform.isWindows
                                                  ? 'Windows Device Info'
                                                  : '',
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
                    content: SizedBox(
                      height: 200.0,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          DataTable(
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Device Info',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Values',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                            rows: _deviceData.keys.map(
                              (String property) {
                                return DataRow(
                                  cells: [
                                    DataCell(SizedBox(
                                      width: 100,
                                      child: Text(
                                        property.capitalize(),
                                      ),
                                    )),
                                    DataCell(
                                      SizedBox(
                                        width: 300,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                '${_deviceData[property]}',
                                              ),
                                            ),
                                            const SizedBox(width: 20),
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
                                                    text: _deviceData[property]
                                                        .toString(),
                                                  ),
                                                );
                                              },
                                              icon: Icon(Icons.copy_sharp,
                                                  color: Theme.of(context)
                                                      .iconTheme
                                                      .color),
                                            ),
                                            const SizedBox(width: 200),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          )
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
      child: ListTile(
        leading: const Text("My Device Info!"),
        // padding: MediaQuery.of(bC).viewInsets,
        trailing: Icon(
          color: Theme.of(context).iconTheme.color,
          Icons.devices_other_outlined,
        ),
      ),
    );
  }
}
