import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future<bool> getData({required String email, password}) async {
  try {
    QuerySnapshot userSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .where('Email', isEqualTo: email)
        .where('password', isEqualTo: password)
        .get();
    if (userSnapshot.docs.isEmpty) {
      print('empty');
      return false;
    } else {
      print('exist');
      return true;
    }
    // print('userSnapshot.docs.first.data()');
    // print(userSnapshot.docs.first.data());
    // return true;
  } catch (e) {
    return false;
  }
}

uploadImage() {
  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();
}
