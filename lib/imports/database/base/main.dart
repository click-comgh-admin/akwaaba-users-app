import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDb<B> extends HiveObject {
  HiveDb();

  String _boxName = "";
  String get boxName {
    return _boxName;
  }

  void setBoxName(String boxName) {
    // print({"setBoxName": boxName});
    _boxName = boxName;
  }

  Future<Box<B>> open() async {
    // print({"opening--box": boxName});
    Box<B> box = await Hive.openBox(boxName);
    return box;
  }

  Future<Box<B>> access() async {
    // print({"box.isOpen - ${boxName}": Hive.isBoxOpen(boxName)});
    Box<B>? box;
    if (!Hive.isBoxOpen(boxName)) {
      box = await open();
    } else {
      // print({"box.isOpen - ${boxName}": "THIS_IS_TRUE"});
      box = Hive.box<B>(boxName);
    }
    return box;
  }

  Future<void> add({required B boxData}) async {
    // print({"add-to-box": boxName});
    Box<B> box = await access();
    // print({"add-to-box--access": box});
    await box.add(boxData);
  }

  Future<List<B>> get values async {
    // print({"get-all-from-box": boxName});
    Box<B> box = await access();
    return box.values.toList();
  }

  ValueListenable<Box<B>> get listenableValue {
    Box<B> box = Hive.box<B>(boxName);
    // print({"box.listenable()": box.listenable()});
    return box.listenable();
  }

  Future<B?> get({required int? id}) async {
    Box<B> box = await access();
    return box.get(id);
  }

  Future<int?> getIndex({required int? id}) async {
    var values = await access();
    Map<dynamic, dynamic> valuesMap = values.toMap();
    dynamic desiredKey;

    valuesMap.forEach((key, value) {
      if (value.id == id) {
        desiredKey = key;
      }
    });
    return desiredKey;
  }

  Future<int?> getIndexFromMemberId({required int? id}) async {
    var values = await access();
    Map<dynamic, dynamic> valuesMap = values.toMap();
    int? desiredKey = 0;
    // print({"valuesMap": valuesMap});
    valuesMap.forEach((key, value) {
      // print({"key": key, "value": value, "id": id});
      // print({"value.memberId": value.memberId, "id": id});
      if (value.memberId == id) {
        desiredKey = key;
      }
    });
    return desiredKey;
  }

  Future<int?> getIndexFromClientId({required int? id}) async {
    var values = await access();
    Map<dynamic, dynamic> valuesMap = values.toMap();
    dynamic desiredKey;

    valuesMap.forEach((key, value) {
      if (value.clientId == id) {
        desiredKey = key;
      }
    });
    return desiredKey;
  }

  Future<B?> getString({required String? id}) async {
    Box<B> box = await access();
    return box.get(id);
  }

  Future<void> deleteFrom({required int? id}) async {
    Box<B> box = await access();
    await box.delete(id);
  }

  Future<void> deleteStringFrom({required String? id}) async {
    Box<B> box = await access();
    await box.delete(id);
  }

  // Future<void> empty({@required List<int> ids}) async {
  //   Box<B> box = await access();
  //   ids.forEach((id) {
  //     box.delete(id);
  //   });
  // }

  Future<void> empty() async {
    Box<B> box = await access();
    await box.clear();
    // print({"============box ${boxName} emptied"});
  }

  Future<void> update({required int? id, required B boxData}) async {
    // print({"============box ${boxName} updating ... isOpen=>${Hive.isBoxOpen(boxName)}"});
    if (Hive.isBoxOpen(boxName)) {
      // Box box = await Hive.openBox(boxName);
      Box<B> box = await access();
      await box.put(id, boxData);
      // await box.close();
    }
  }

  Future<void> addStringId({required String id, required B boxData}) async {
    // print({"============box ${boxName} updating ... isOpen=>${Hive.isBoxOpen(boxName)}"});
    if (Hive.isBoxOpen(boxName)) {
      // Box box = await Hive.openBox(boxName);
      Box<B> box = await access();
      await box.put(id, boxData);
      // await box.close();
    }
  }
}
