import 'dart:io';
import 'dart:typed_data';
import 'package:blood_donation_app/Utils/hive.dart';
import 'package:blood_donation_app/Utils/object_factory.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Views/home_view.dart';
import 'package:blood_donation_app/Views/pick_your_blood_group_view.dart';
import 'package:blood_donation_app/Views/second_registration_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Utils/constants.dart';
import '../Widgets/build_dotted_border_widget.dart';
import '../Widgets/build_icon_widget.dart';
import '../Widgets/build_textwidget.dart';

class AddImageView extends StatefulWidget {
  const AddImageView({super.key});

  @override
  State<AddImageView> createState() => _AddImageViewState();
}

class _AddImageViewState extends State<AddImageView> {
  Uint8List? _image;
  File? selectedIMage;

  Future<void> uploadImageToFirebaseStorage(Uint8List imageBytes) async {
    try {
      String filename = "${DateTime.now().millisecondsSinceEpoch}.jpg";
      final firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child("user_images")
          .child(filename);

      await storageReference.putData(imageBytes);

      String downloadUrl = await storageReference.getDownloadURL();

      await FirebaseFirestore.instance.collection("donors").doc().set({
        'image': downloadUrl,
        'name': ObjectFactory().appHive.getName(),
        'email': ObjectFactory().appHive.getEmail(),
        'user_id': ObjectFactory().appHive.getUserId(),
        'blood_group': ObjectFactory().appHive.getBloodGroup(),
        'age': ObjectFactory().appHive.getAge(),
        'address': ObjectFactory().appHive.getAddress(),
        'gender': ObjectFactory().appHive.getGender(),
        // ... other user data fields
      });
      // await FirebaseFirestore.instance
      //     .collection("donors")
      //     .doc(ObjectFactory().appHive.getUserId())
      //     .set({
      //   'image': downloadUrl, // Store the download URL in Firestore
      // });
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kitGradients[0],
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRegistrationView(),
                ));
          },
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickYourBloodGroup(),
                  ));
            },
            child: BuildIconWidget(
                iconData: Icons.arrow_back_outlined,
                color: Constants.kitGradients[1]),
          ),
        ),
        backgroundColor: Constants.kitGradients[0],
        centerTitle: true,
        title: BuildTextWidget(
          text: 'Add Your Image',
          color: Constants.kitGradients[1],
          fontWeight: FontWeight.w500,
          size: 16,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight(context, dividedBy: 5.5),
          ),
          _image != null
              ? Center(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Container(
                        height: screenHeight(context, dividedBy: 3),
                        width: screenWidth(context, dividedBy: 1.3),
                        color: Constants.kitGradients[0],
                        child: Image(
                          image: MemoryImage(_image!),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(
                  child: GestureDetector(
                      onTap: () async {
                        showImagePickerOption(context);
                      },
                      child: BuildDottedBorderWidget()),
                ),
          const SizedBox(
            height: 15,
          ),
          _image != null
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _image = null;
                    });
                  },
                  child: const BuildIconWidget(
                    iconData: Icons.delete_forever,
                    size: 50,
                  ),
                )
              : Container(),
          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   width: 5,
                // ),
                const BuildTextWidget(
                  text: 'Skip',
                  size: 16,
                ),
                Container(
                  width: screenWidth(context, dividedBy: 2),
                  height: screenHeight(context, dividedBy: 16),
                  decoration: BoxDecoration(
                      color: _image != null
                          ? Constants.kitGradients[4]
                          : Constants.kitGradients[4].withOpacity(0.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(25))),
                  child: Center(
                    child: GestureDetector(
                      onTap: () async {
                        if (_image != null) {
                          await uploadImageToFirebaseStorage(_image!);
                          // try {
                          // await FirebaseFirestore.instance
                          //     .collection("donors")
                          //     .doc(ObjectFactory().appHive.getUserId())
                          //     .set({
                          //   'email': ObjectFactory().appHive.getEmail(),
                          //   'user_id': ObjectFactory().appHive.getUserId(),
                          //   'blood_group':
                          //       ObjectFactory().appHive.getBloodGroup(),
                          //   'age': ObjectFactory().appHive.getAge(),
                          //   'address': ObjectFactory().appHive.getAddress(),
                          //   'gender': ObjectFactory().appHive.getGender(),
                          //   'image': ObjectFactory().appHive.getImage(),
                          // });

                          // Navigate to the next screen or perform any other actions
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ),
                          );
                        }
                        // catch (e) {
                        //   print('Error adding to Firestore: $e');
                        // }
                      },
                      child: BuildTextWidget(
                        text: 'Next',
                        color: Constants.kitGradients[0],
                        fontWeight: FontWeight.w400,
                        size: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // BuildPageNavigator(text: 'Next', color: Constants.kitGradients[0]),
          SizedBox(
            height: screenHeight(context, dividedBy: 40),
          ),
        ],
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.black,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 6.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              size: 60,
                              color: Constants.kitGradients[0],
                            ),
                            Text(
                              "Gallery",
                              style:
                                  TextStyle(color: Constants.kitGradients[0]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 60,
                              color: Constants.kitGradients[0],
                            ),
                            Text(
                              "Camera",
                              style:
                                  TextStyle(color: Constants.kitGradients[0]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      AppHive().putImage(value: _image);
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
      AppHive().putImage(value: _image);
    });
    Navigator.of(context).pop();
  }
}
