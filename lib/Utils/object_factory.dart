import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'hive.dart';

class ObjectFactory {
  static final _objectFactory = ObjectFactory._internal();

  ObjectFactory._internal();

  factory ObjectFactory() => _objectFactory;

  // instance initialization
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final AppHive _appHive = AppHive();

  static final FirebaseFirestore _firebaseFireStore =
      FirebaseFirestore.instance;

  FirebaseAuth get firebaseAuth => _firebaseAuth;

  FirebaseFirestore get firebaseFireStore => _firebaseFireStore;

  AppHive get appHive => _appHive;
}
