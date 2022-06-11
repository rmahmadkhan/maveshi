import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maveshi/models/farm.dart';

class FarmRepository {
  final CollectionReference<Farm> modelsRef =
      FirebaseFirestore.instance.collection('farms').withConverter<Farm>(
            fromFirestore: (snapshot, _) => Farm.fromJson(snapshot.data()!),
            toFirestore: (user, _) => user.toJson(),
          );

  Future<Farm?> get(String documentId) =>
      modelsRef.doc(documentId).get().then((s) => s.data());

  Future<void> add(Farm farm) => modelsRef.doc(farm.id).set(farm);

  Future<void> update(String documentId, Map<String, dynamic> map) =>
      modelsRef.doc(documentId).update(map);

  Future<void> delete(String documentId) => modelsRef.doc(documentId).delete();
}
