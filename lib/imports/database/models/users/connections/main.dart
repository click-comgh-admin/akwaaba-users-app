import 'package:akwaaba_user_app/imports/database/base/main.dart';
import 'package:akwaaba_user_app/models/users/connections/main.dart';
import 'package:flutter/foundation.dart';

class ConnectionsUserModelDatabase extends HiveDb<UserConnectionsModel> {
  @override
  String boxName = "db-models-user-connections";

  Future<UserConnectionsModel?> getConnection(int? id) async {
    int? index = await getIndex(id: id);
    UserConnectionsModel? connections = await get(id: index);
    return connections;
  }

  Future<List<UserConnectionsModel?>> getConnections() async {
    List<UserConnectionsModel> connections = await values;
    return connections;
  }

  Future<bool> addConnection(UserConnectionsModel connection) async {
    int? connectionId = connection.id;
    UserConnectionsModel? connectionGot = await getConnection(connectionId);

    if (connectionGot == null) {
      return await _addConnection(connection);
    } else {
      int? index = await getIndex(id: connectionId);
      return await _updateConnection(index, connection);
    }
  }

  Future<bool> _addConnection(UserConnectionsModel connection) async {
    if (kDebugMode) {
      // print({"connection_addConnections": connection});
    }
    await add(boxData: connection);
    return true;
  }

  Future<bool> _updateConnection(
      int? index, UserConnectionsModel connection) async {
    if (kDebugMode) {
      // print({"connection_updateConnections": connection});
    }
    await update(id: index, boxData: connection);
    return true;
  }

  Future<bool> removeConnection(int connectionId) async {
    int? index = await getIndex(id: connectionId);
    if (kDebugMode) {
      // print({"index": index});
    }
    await deleteFrom(id: index);
    return true;
  }

  Future<bool> removeConnections() async {
    await empty();
    return true;
  }
}
