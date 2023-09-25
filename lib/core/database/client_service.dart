import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defi/core/database/collection_prod_dev/prod_dev.dart';

class ClientServices {
  final ref = FirebaseFirestore.instance.collection(clientCollection);
/*   final clientRef = FirebaseFirestore.instance
      .collection(clientCollection)
      .withConverter<Profil>(
          fromFirestore: (snaphsot, _) =>
              Profil.fromJson(snaphsot.data() as Map<String, dynamic>),
          toFirestore: (user, _) => user.toJson()); */

/*   Future<void> saveUser(Profil user) async {
    await userRef.doc(user.uid).set(user, SetOptions(merge: true));
  }

  Future<Profil> getUser(String uid) async {
    return userRef.doc(uid).get().then((snapshot) => snapshot.data()!);
  }

  Future<bool> verifyUserExist(String number) {
    return userRef
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

  List<Profil> contactFromSnapshot(QuerySnapshot<Profil> snapshot) {
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