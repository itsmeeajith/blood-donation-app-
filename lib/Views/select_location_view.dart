import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Views/home_view.dart';
import 'package:blood_donation_app/Widgets/build_icon_widget.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/build_select_location_images_widget.dart';

class SelectLocationView extends StatefulWidget {
  const SelectLocationView({super.key});

  @override
  State<SelectLocationView> createState() => _SelectLocationViewState();
}

class _SelectLocationViewState extends State<SelectLocationView> {
  // List<bool> choosePlaceImages =
  // List.generate(Const
  //
  // ants.placesimages.length, (index) => false);
  // position? currentLocation;
  bool isSelected = false;
  TextEditingController _searchController = TextEditingController();
  String selectedLocation = '';
  int count = 0;
  String selectSubLocation = '';

  @override
  void initState() {
    // TODO: implement initState
    print('Constants.places[0].placeList[0]');
    print(Constants.places[0].placeList);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context, dividedBy: 5.0),
              width: screenWidth(context),
              color: Constants.kitGradients[4],
              child: Column(children: [
                SizedBox(
                  height: screenHeight(context, dividedBy: 18),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(),
                            ));
                      },
                      child: BuildIconWidget(
                        iconData: CupertinoIcons.back,
                        color: Constants.kitGradients[1],
                      ),
                    ),
                    SizedBox(
                      width: 52,
                    ),
                    BuildTextWidget(
                      text: 'select your location',
                      color: Constants.kitGradients[1],
                      size: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    BuildIconWidget(
                        iconData: Icons.gps_fixed,
                        color: Constants.kitGradients[1],
                        size: 19),
                  ],
                ),
                const SizedBox(
                  height: 21,
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 19),
                  width: screenWidth(
                    context,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0.8),
                          filled: true,
                          fillColor: Constants.kitGradients[0].withOpacity(0.9),
                          prefixIcon: const Icon(Icons.search_rounded),
                          hintText: _searchController.text,
                          border: OutlineInputBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              borderSide: BorderSide(
                                color: Constants.kitGradients[0],
                              ))),
                    ),
                  ),
                ),
              ]),
            ),
            Card(
              child: Container(
                height: screenHeight(context, dividedBy: 6.1),
                color: Colors.white,
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(12),
                    scrollDirection: Axis.horizontal,
                    itemCount: Constants.placesimages.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedLocation =
                                Constants.placesimages[index].title!;
                            count = index;
                            print(count);
                            print(selectedLocation);
                            // print(Constants.places[0].placeList[index]);
                          });
                        },
                        child: BuildSelectLocationImagesWidget(
                          title: Constants.placesimages[index].title,
                          assetImage: Constants.placesimages[index].assetImage,
                        ),
                      );
                    }),
              ),
            ),
            ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: ListView.builder(
                      itemCount: Constants.places[count].placeList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectSubLocation =
                                    Constants.places[count].placeList[index];
                                _searchController.text = selectSubLocation;
                                print(selectSubLocation);
                              });
                            },
                            child: Text(
                              Constants.places[count].placeList[index],
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
