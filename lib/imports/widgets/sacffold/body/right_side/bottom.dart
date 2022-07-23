import 'package:akwaaba_user_app/imports/config/routes.gr.dart';
import 'package:akwaaba_user_app/imports/functions/offline_profile_pictures/main.dart';
import 'package:akwaaba_user_app/imports/widgets/errors/network/main.dart';
import 'package:akwaaba_user_app/imports/widgets/loading/main.dart';
import 'package:akwaaba_user_app/imports/widgets/text_button/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:akwaaba_user_app/models/users/profile/main.dart';
import 'package:akwaaba_user_app/models/users/profile/organization/main.dart';
import 'package:akwaaba_user_app/view_models/users/connections/main.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomRightsideBodyScaffoldWidget extends StatefulWidget {
  const BottomRightsideBodyScaffoldWidget({Key? key}) : super(key: key);

  @override
  State<BottomRightsideBodyScaffoldWidget> createState() =>
      _BottomRightsideBodyStateScaffoldWidget();
}

class _BottomRightsideBodyStateScaffoldWidget
    extends State<BottomRightsideBodyScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    UserConnectionsViewModel userConnectionsViewModel =
        context.watch<UserConnectionsViewModel>();
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Connections",
                style: Theme.of(context).textTheme.headline5,
              ),
              TextButtonIconWidget(
                onPressed: () {
                  AutoRouter.of(context).push(const ConnectionsRouteWeb());
                },
                // color: Colors.indigo,
                icon: Icons.arrow_right_alt_sharp,
                label: "View Page",
              ),
            ],
          ),
          _ui(userConnectionsViewModel),
        ],
      ),
    );
  }

  CircleAvatar _imageWidget(String photo) {
    Map<String, Object> offlineProfilePicture = offlineProfilePictureFunction(
      photo,
    );
    return offlineProfilePicture['inProduction'] as bool
        ? CircleAvatar(
            backgroundImage: NetworkImage(
              offlineProfilePicture['url'] as String,
            ),
          )
        : CircleAvatar(
            backgroundImage: AssetImage(
              offlineProfilePicture['url'] as String,
            ),
          );
  }

  Widget _ui(UserConnectionsViewModel userConnectionsViewModel) {
    if (userConnectionsViewModel.loading) {
      return const LoadingWidget1();
    }

    if (userConnectionsViewModel.networkFailure != null) {
      return NetworkErrorWidget(
        networkFailure: userConnectionsViewModel.networkFailure,
      );
    }
    List<UserConnectionsModel> userConnections =
        userConnectionsViewModel.userConnections;
    if (kDebugMode) {
      // print({"userConnections": userConnections});
    }

    if (userConnections.isEmpty) {
      return ListTile(
        leading: Icon(
          Icons.person_outline_sharp,
          color: Theme.of(context).iconTheme.color,
        ),
        title: const Text("No Connections Found"),
        subtitle: const Text("_____________"),
        trailing: const Text("-"),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          UserConnectionsModel userConnection = userConnections[index];
          var connectionId = userConnection.connectionId;
          if (connectionId is ProfileModel) {
            final Widget image = _imageWidget(connectionId.profilePicture!);
            return ListTile(
              leading: image,
              title: Text(
                "${connectionId.firstname!} ${connectionId.middlename!} ${connectionId.surname!}",
              ),
              subtitle: connectionId.referenceId!.isEmpty
                  ? const Text("_____________")
                  : Text(
                      "Ref ID: ${connectionId.referenceId!}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
              trailing: Text(
                connectionId.gender == 1 ? "Male" : "Female",
              ),
            );
          }
          if (connectionId is OrganizationProfileModel) {
            final image = _imageWidget(connectionId.logo!);
            return ListTile(
              leading: image,
              title: Text(connectionId.organizationName!),
              subtitle: connectionId.referenceId!.isEmpty
                  ? const Text("_____________")
                  : Text(
                      "Ref ID: ${connectionId.referenceId!}",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
              trailing: const Text("/Org"),
            );
          }
          return Container();
        },
        itemCount: userConnections.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
