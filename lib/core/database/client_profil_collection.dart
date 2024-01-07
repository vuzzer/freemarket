import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defi/core/database/configs/config_prod_dev.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/data/models/client_profil_model.dart';

class ClientProfilCollection {
  // Reference to collection of client_profil
  final ref = FirebaseFirestore.instance.collection(clientCollection);

  // Reference to collection of client_profil based on model
  final clientRef = FirebaseFirestore.instance
      .collection(clientCollection)
      .withConverter<ClientProfilModel>(
          fromFirestore: (snaphsot, _) => ClientProfilModel.fromJson(
              snaphsot.data() as Map<String, dynamic>),
          toFirestore: (user, _) => user.toJson());

  Future<void> saveUser(ClientProfilModel user) async {
    await clientRef.doc(user.uid).set(user, SetOptions(merge: true));
  }

  Future<ClientProfilModel> getUser(String uid) async {
    final clientProfil = await clientRef.doc(uid).get();
    if (clientProfil.exists) {
      return clientProfil.data() as ClientProfilModel;
    }
    throw UserNotExistException();
  }

  Future<bool> verifyUserExist(String number) {
    return clientRef
        .where("numeroTel", isEqualTo: number)
        .get()
        .timeout(const Duration(seconds: 5))
        .then((value) {
      if (value.docs.isNotEmpty) {
        return true;
      }
      return false;
    });
  }

/*   List<Profil> contactFromSnapshot(QuerySnapshot<Profil> snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  Future<void> updateProfil(Address address, String uid) async {
    return ref
        .doc(uid)
        .update(address.toJson())
        .timeout(const Duration(seconds: 5));
  }

  Future<void> updateUsername(String username, String uid) async {
    return ref
        .doc(uid)
        .update({"username": username}).timeout(const Duration(seconds: 5));
  }

    Future<void> updatePhoneNumber(Map<String, dynamic> info, String uid) async {
    return ref
        .doc(uid)
        .update(info).timeout(const Duration(seconds: 5));
  }

      Future<void> updatePhotoUrl(String photoUrl, String uid) async {
    return ref
        .doc(uid)
        .update({
          "photoUrl": photoUrl
        }).timeout(const Duration(seconds: 5));
  } */
}
