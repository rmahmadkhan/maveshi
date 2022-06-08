import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maveshi/models/local_user.dart';

class UserRepository {
  final CollectionReference<LocalUser> modelsRef = FirebaseFirestore.instance
      .collection('users')
      .withConverter<LocalUser>(
        fromFirestore: (snapshot, _) => LocalUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );

  Future<LocalUser?> get(String documentId) =>
      modelsRef.doc(documentId).get().then((s) => s.data());

  // Future<List<LocalUser>?> getAll() async {
  //   final snapshot = await modelsRef.get();
  //   final docs = snapshot.docs;
  //
  //   if (docs.isNotEmpty) {
  //     final List<LocalUser> users = [];
  //     for (int i = 0; i < docs.length; i++) {
  //       users.add(docs[i].data());
  //     }
  //     return users;
  //   }
  //   return null;
  // }

  Future<void> add(LocalUser user) => modelsRef.doc(user.email).set(user);

  Future<void> update(String documentId, Map<String, dynamic> map) =>
      modelsRef.doc(documentId).update(map);

  Future<void> delete(String documentId) => modelsRef.doc(documentId).delete();
}
