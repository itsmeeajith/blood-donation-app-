import 'package:blood_donation_app/Views/select_location_view.dart';
import 'package:flutter/material.dart';
import '../Models/donor_response_model.dart';
import '../Utils/constants.dart';
import '../Utils/utils.dart';
import '../Widgets/build_blood_group_widget.dart';
import '../Widgets/build_donor_list_widget.dart';
import '../Widgets/build_location_bar_widget.dart';
import '../Widgets/build_textwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? tappedBlood;
  bool isLoading = false;
  List<bool> chooseBloodGroup =
      List.generate(Constants.bloodgroup.length, (index) => false);
  List names = [];
  List<DonorResponseModel> donorDatas = [];
  List bloodgroup = [];
  String? selectedBlood;

  getData() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot donorSnapshot =
        await FirebaseFirestore.instance.collection("donors").get();
    for (QueryDocumentSnapshot document in donorSnapshot.docs) {
      DonorResponseModel donorData =
          DonorResponseModel.fromJson(document.data() as Map<String, dynamic>);
      print(document.get("blood_group"));

      donorDatas.add(donorData);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _filterBlood() async {
    try {
      setState(() {
        isLoading = true;
      });

      QuerySnapshot querySnapshot;
      if (tappedBlood == null || tappedBlood == "All") {
        querySnapshot =
            await FirebaseFirestore.instance.collection('donors').get();
      } else {
        querySnapshot = await FirebaseFirestore.instance
            .collection('donors')
            .where('blood_group', isEqualTo: tappedBlood)
            .get();
      }

      donorDatas.clear();
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        DonorResponseModel donorData = DonorResponseModel.fromJson(
            document.data() as Map<String, dynamic>);
        donorDatas.add(donorData);
      }

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('Error getting blood group: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    tappedBlood = "All";
    getData();
    _filterBlood();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: screenWidth(context, dividedBy: 1.3),
        backgroundColor: Constants.kitGradients[0],
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Constants.kitGradients[2]),
            arrowColor: Constants.kitGradients[0],
            accountName: Text("kevin De Bruyne"),
            accountEmail: Text("Kevindebruyne@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Constants.kitGradients[0],
              child: Text(
                "K",
                style:
                    TextStyle(fontSize: 40.0, color: Constants.kitGradients[3]),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.question_mark),
            title: Text('Help and feedback'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privicy Policy'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.handshake_sharp),
            title: Text('Support us'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
      appBar: AppBar(
        backgroundColor: Constants.kitGradients[3],
        centerTitle: true,
        title: Text(
          'Blood Stream',
          style: TextStyle(
            color: Constants.kitGradients[0],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectLocationView(),
                ));
          },
          child: Container(
            height: screenHeight(context, dividedBy: 12),
            color: Constants.kitGradients[3],
            child: const Center(
                child: BuildLocationBarWidget(
              icon: Icons.location_on,
              text: 'Kochi',
            )),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 235),
          child: BuildTextWidget(
            text: 'Donors in Kochi',
            color: Constants.kitGradients[1].withOpacity(0.9),
            fontWeight: FontWeight.w500,
            size: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 6.0,
          children: List.generate(
            Constants.bloodgroup.length,
            (index) => BuildBloodGroupWidget(
                title: Constants.bloodgroup[index].title,
                onTap: () {
                  setState(
                    () {
                      // chooseBloodGroup[index] = !chooseBloodGroup[index];
                      for (int i = 0; i < chooseBloodGroup.length; i++) {
                        chooseBloodGroup[i] = (i == index);
                      }
                      setState(() {
                        tappedBlood = Constants.bloodgroup[index].title;
                        print(tappedBlood);
                        _filterBlood();
                      });
                      // _filterBlood(tappedBlood!);

                      // print(tappedBlood?.length);
                    },
                  );
                },
                isSelected: chooseBloodGroup[index]),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        isLoading
            ? SizedBox(
                width: screenWidth(context),
                height: screenHeight(context),
                child: const Center(child: CircularProgressIndicator()))
            : ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: donorDatas.length,
                itemBuilder: (context, index) {
                  return BuildDonorListWidget(
                    title: donorDatas[index].name,
                    address: donorDatas[index].address,
                    bloodGroup: donorDatas[index].blood_Group,
                    assetimage: donorDatas[index].image,
                  );
                })
      ])),
    );
  }
}
