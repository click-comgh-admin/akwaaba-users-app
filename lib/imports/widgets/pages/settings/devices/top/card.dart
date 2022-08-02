import 'package:akwaaba_user_app/imports/utilities/constants/sizing/sizebox/main.dart';
import 'package:akwaaba_user_app/imports/utilities/extentions/string/main.dart';

import 'package:akwaaba_user_app/imports/functions/device_info/main.dart';
import 'package:akwaaba_user_app/imports/utilities/constants/sizing/height/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/settings/devices/top/approve.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/main.dart';
import 'package:akwaaba_user_app/view_models/attendance/devices/request.dart';
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TopCardDevicePageSettingsWidget extends StatefulWidget {
  const TopCardDevicePageSettingsWidget({Key? key}) : super(key: key);

  @override
  State<TopCardDevicePageSettingsWidget> createState() =>
      _TopCardDevicePageSettingsWidgetState();
}

class _TopCardDevicePageSettingsWidgetState
    extends State<TopCardDevicePageSettingsWidget> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  bool loading = true;
  ScrollController scrollController = ScrollController();
  GlobalKey<ArtDialogState> artConfirmClockingDialogKey =
      GlobalKey<ArtDialogState>();

  @override
  void dispose() {
    scrollController.removeListener(scrollControllerListener);
    super.dispose();
  }

  scrollControllerListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollControllerListener);
    deviceInfoFunction().then((value) {
      setState(() {
        _deviceData = value;
        loading = false;
      });
    });

    ClockingDeviceViewModel clockingDeviceViewModel =
        Provider.of(context, listen: false);
    ClockingDeviceRequestViewModel clockingDeviceRequestViewModel =
        Provider.of(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      clockingDeviceViewModel.myDevice;
      clockingDeviceRequestViewModel.lastRequest;
    });
  }

  @override
  Widget build(BuildContext context) {
    ClockingDeviceViewModel clockingDeviceViewModel =
        context.watch<ClockingDeviceViewModel>();

    ClockingDeviceRequestViewModel clockingDeviceRequestViewModel =
        context.watch<ClockingDeviceRequestViewModel>();
    if (kDebugMode) {
      // print({"_deviceData": _deviceData});
    }
    if (loading) {
      return const Center(
        child: LoadingWidget1(),
      );
    } else {
      return Card(
        child: SizedBox(
          width: double.infinity,
          height: topCardHeightConstantsUtilities,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200.0,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        DataTable(
                          columns: [
                            const DataColumn(
                              label: Text(
                                'Device Info',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: TopCardApprovalDevicePageSettingsWidget(
                                clockingDeviceViewModel:
                                    clockingDeviceViewModel,
                                clockingDeviceRequestViewModel:
                                    clockingDeviceRequestViewModel,
                                artConfirmClockingDialogKey:
                                    artConfirmClockingDialogKey,
                                deviceData: _deviceData,
                              ),
                            ),
                          ],
                          rows: _deviceData.keys.map(
                            (String property) {
                              return DataRow(
                                cells: [
                                  DataCell(SizedBox(
                                    width: 80,
                                    child: Text(
                                      property.capitalize(),
                                    ),
                                  )),
                                  DataCell(
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '${_deviceData[property]}',
                                            ),
                                          ),
                                          width25SizeboxConstantsUtilities,
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
                                          const SizedBox(width: 300),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: -5,
                right: -10,
                child: Icon(Icons.electric_moped),
              ),
            ],
          ),
        ),
      );
    }
  }
}
