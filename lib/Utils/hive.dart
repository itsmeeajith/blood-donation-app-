import 'dart:typed_data';

import 'package:hive/hive.dart';

import 'constants.dart';

AppHive appHive = AppHive();

class AppHive {
  // void main (){}

  // void openBox()async{
  //   await Hive.openBox(Constants.B,OX_NAME);
  //
  // }
  static const String _USER_ID = "user_id";
  static const String _NAME = "name";
  static const String _TOKEN = "token";
  static const String _EMAIL = "email";
  static const String _PREFERENCE = "preferenceid";
  static const String _LATITUDE = "longitude";
  static const String _XUSER = "newuserid";
  static const String _PASSWORD = "userpassword";
  static const String _FCMTOKEN = "fcm_token";
  static const String _ISLOGGEDIN = "is_logged_in";
  static const String _DOC_ID = "user_docId";
  static const String _PHONE_NUMBER = "phone_number";
  static const String _BLOOD_GROUP = "bloood_group";
  static const String _IMAGE = "user_image";
  static const String _GENDER = "gender";
  static const String _AGE = "Age";
  static const String _ADDRESS = "Address";

  void hivePut({String? key, String? value}) async {
    await Hive.box(Constants.BOX_NAME).put(key, value);
  }

  String hiveGet({String? key}) {
    // openBox();
    return Hive.box(Constants.BOX_NAME).get(key);
  }

  void hivePutBool({String? key, bool? value}) async {
    await Hive.box(Constants.BOX_NAME).put(key, value);
  }

  bool hiveGetBool({String? key}) {
    return Hive.box(Constants.BOX_NAME).get(key) ?? false;
  }

  void putImage({Uint8List? value}) {
    hivePut(key: _IMAGE, value: value.toString());
  }

  String getImage() {
    return hiveGet(key: _IMAGE);
  }

  void putBloodGroup({String? value}) {
    hivePut(key: _BLOOD_GROUP, value: value);
  }

  String getBloodGroup() {
    return hiveGet(key: _BLOOD_GROUP);
  }

  putUserId({String? userId}) {
    hivePut(key: _USER_ID, value: userId);
  }

  String getUserId() {
    return hiveGet(key: _USER_ID);
  }

  putUserPassword({String? email}) {
    hivePut(key: _PASSWORD, value: email);
  }

  String getUserPassword() {
    return hiveGet(key: _PASSWORD);
  }

  putName({String? name}) {
    hivePut(key: _NAME, value: name);
  }

  String getName() {
    return hiveGet(key: _NAME);
  }

  putPhone_Number({String? phoneNumber}) {
    hivePut(key: _PHONE_NUMBER, value: phoneNumber);
  }

  String getPhone_Number() {
    return hiveGet(key: _PHONE_NUMBER);
  }

  putToken({String? token}) {
    hivePut(key: _TOKEN, value: token);
  }

  String getToken() {
    return hiveGet(key: _TOKEN);
  }

  String getEmail() {
    return hiveGet(key: _EMAIL);
  }

  putEmail({required String value}) {
    return hivePut(key: _EMAIL, value: value);
  }

  putPreference(String value) {
    return hivePut(key: _PREFERENCE, value: value);
  }

  String getPreferenceId() {
    return hiveGet(key: _PREFERENCE);
  }

  putXUser(String value) {
    return hivePut(key: _XUSER, value: value);
  }

  getXUser() {
    return hiveGet(
      key: _XUSER,
    );
  }

  putFcmToken({String? value}) {
    return hivePut(key: _FCMTOKEN, value: value);
  }

  getFcmToken() {
    return hiveGet(
      key: _FCMTOKEN,
    );
  }

  putIsLoggedIn({bool? value}) {
    return hivePutBool(key: _ISLOGGEDIN, value: value);
  }

  getIsLoggedIn() {
    return Hive.box(Constants.BOX_NAME).get(_ISLOGGEDIN);
  }

  putUserDocId({String? docId}) {
    hivePut(key: _DOC_ID, value: docId);
  }

  getUserDocId() {
    return hiveGet(key: _DOC_ID);
  }

  void putGender({String? value}) {
    hivePut(key: _GENDER, value: value);
  }

  String getGender() {
    return hiveGet(key: _GENDER);
  }

  void putAge({String? value}) {
    hivePut(key: _AGE, value: value);
  }

  String getAge() {
    return hiveGet(key: _AGE);
  }

  void putAddress({String? value}) {
    hivePut(key: _ADDRESS, value: value);
  }

  String getAddress() {
    return hiveGet(key: _ADDRESS);
  }

  AppHive();
}
