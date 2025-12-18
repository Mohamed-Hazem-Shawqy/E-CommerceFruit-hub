import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String? id,
  });
  Future<dynamic> getData({
    required String path,
    String? id,
    Map<String, dynamic>? query,
  });
  Future<bool> isUserRecord({required String path, required String id});
}

class FireStoreService implements DataBaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String? id,
  }) async {
    if (id != null) {
      await firestore.collection(path).doc(id).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? id,
    Map<String, dynamic>? query,
  }) async {
    if (id != null) {
      var data = await firestore.collection(path).doc(id).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          var orderBy = query['orderBy'];
          var descending = query['descending'];
          data = data.orderBy(orderBy, descending: descending);
        }

        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> isUserRecord({required String path, required String id}) async {
    var isRecord = await firestore.collection(path).doc(id).get();
    return isRecord.exists;
  }
}
