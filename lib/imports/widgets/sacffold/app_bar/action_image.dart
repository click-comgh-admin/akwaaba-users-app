import 'package:akwaaba_user_app/imports/functions/offline_profile_pictures/main.dart';
import 'package:akwaaba_user_app/imports/widgets/pages/login/logout/buttom/alt.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/device_info/main.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/my_account_popup_btn_item.dart';
import 'package:akwaaba_user_app/imports/widgets/sacffold/app_bar/where_am_i/main.dart';
import 'package:akwaaba_user_app/imports/widgets/settings/theme/alt.dart';
import 'package:akwaaba_user_app/models/users/login/main.dart';
import 'package:akwaaba_user_app/view_models/users/login/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActionImageAppBarScaffoldWidget extends StatelessWidget {
  const ActionImageAppBarScaffoldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserLoginViewModel userLoginCtx = context.watch<UserLoginViewModel>();
    return Center(
      child: SizedBox(
        width: 55,
        height: 55,
        child: Center(
          child: Card(
            elevation: 15,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shadowColor: Colors.grey.shade100.withOpacity(0.15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: PopupMenuButton<int>(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: AltProfileButtomWidget(),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    child: AltThemeSettingsWidget(),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    child: WhereAmIButtonAppBarScaffoldWidget(),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    child: DeviceInfoButtonAppBarScaffoldWidget(),
                  ),
                  const PopupMenuDivider(),
                  const PopupMenuItem(
                    child: AltLogoutButtomWidget(),
                  ),
                ],
                child: FutureBuilder(
                  future: userLoginCtx.getLogin,
                  builder: (BuildContext context,
                      AsyncSnapshot<UserLoginModel?> snapshot) {
                    if (snapshot.hasData) {
                      UserLoginModel? userInfo = snapshot.data;
                      if (userInfo == null) {
                        return Icon(
                          Icons.image_not_supported_outlined,
                          color: Theme.of(context).iconTheme.color,
                        );
                      } else {
                        Map<String, Object> offlineProfilePicture =
                            offlineProfilePictureFunction(
                          userInfo.user!.profilePicture,
                        );
                        // offlineProfilePicture['url'] as String
                        return offlineProfilePicture['inProduction'] as bool
                            ? FadeInImage.assetNetwork(
                                placeholder:
                                    placeholderProfilePictureFunction(),
                                height: 200,
                                image: offlineProfilePicture['url'] as String,
                                fit: BoxFit.cover,
                              )
                            // Image(
                            //   height: 100,
                            //   image: NetworkImage(
                            //     offlineProfilePicture['url'] as String,
                            //   ),
                            //   fit: BoxFit.cover,
                            // )
                            : Image.asset(
                                height: 200,
                                offlineProfilePicture['url'] as String,
                                fit: BoxFit.cover,
                              );
                      }
                    } else {
                      return Icon(
                        Icons.person_outline_sharp,
                        color: Theme.of(context).iconTheme.color,
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
