import 'package:blood_donation_app/Views/pick_your_blood_group_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Utils/object_factory.dart';
import '../Utils/utils.dart';

class LoginController {
  final String uid = "";
  // final String email = "";
  Future signInWithGoogle(
    BuildContext context,
  ) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      print("Google Sign-In Account: $googleSignInAccount");
      if (googleSignInAccount == null) {
        print('User cancelled Google Sign-In');

        return;
      }
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      ObjectFactory().appHive.putUserId(userId: user?.uid);
      ObjectFactory().appHive.putEmail(value: user?.email ?? "");
      // storeUserDataFireStore(uid: user?.uid ?? "", email: user?.email ?? "");
      print('users');
      await pushAndReplacement(context, const PickYourBloodGroup());

      print('Google Sign-In successful');
    } catch (error) {
      print('Google Sign-In failed: $error');
    }
  }

  storeUserDataFireStore({
    required String uid,
    required String email,
  }) {
    ObjectFactory().firebaseFireStore.collection("users").add({
      "Uid": uid,
      "email": email,
      "name": "",
      "address": "",
      "country": "",
      "district": "",
      "city": "",
      "pincode": "",
    }).then((value) async {
      // ObjectFactory()
      //     .firebaseFireStore
      //     .collection("users")
      //     .doc(value.id)
      //     .update({"docId": value.id});
      await ObjectFactory().appHive.putUserId(userId: uid);
      await ObjectFactory().appHive.putEmail(value: email);
      await ObjectFactory().appHive.putUserDocId(docId: value.id);
      print("User Data stored in Hive:");
      print("UserID: ${ObjectFactory().appHive.getUserId()}");
      print("Email: ${ObjectFactory().appHive.getEmail()}");
      print("UserDocId: ${ObjectFactory().appHive.getUserDocId()}");
    });
  }
}
