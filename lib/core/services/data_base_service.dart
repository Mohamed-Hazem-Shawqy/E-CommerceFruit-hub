import 'package:cloud_firestore/cloud_firestore.dart';

abstract class DataBaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    required String? id,
  });
  Future<Map<String, dynamic>> getData({
    required String path,
    required String id,
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
  Future<Map<String, dynamic>> getData({
    required String path,
    required String id,
  }) async {
    var data = await firestore.collection(path).doc(id).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isUserRecord({required String path, required String id}) async {
    var isRecord = await firestore.collection(path).doc(id).get();
    return isRecord.exists;
  }
}
