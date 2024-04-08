import 'package:blood_donation_app/Utils/constants.dart';
import 'package:blood_donation_app/Utils/utils.dart';
import 'package:blood_donation_app/Views/donor_profile_view.dart';
import 'package:blood_donation_app/Widgets/build_textwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildDonorListWidget extends StatefulWidget {
  final String? title;
  final String? address;
  final String? bloodGroup;
  final String? assetimage;
  const BuildDonorListWidget(
      {super.key, this.title, this.address, this.bloodGroup, this.assetimage});

  @override
  State<BuildDonorListWidget> createState() => _BuildDonorListWidgetState();
}

class _BuildDonorListWidgetState extends State<BuildDonorListWidget> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DonorProfileView(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
              color: Constants.kitGradients[0],
              border:
                  Border.all(color: Constants.kitGradients[1].withOpacity(0.1)),
              boxShadow: CupertinoContextMenu.kEndBoxShadow),
          height: screenHeight(context, dividedBy: 7.8),
          width: screenWidth(context, dividedBy: 1.1),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: screenWidth(context, dividedBy: 3),
                  width: screenHeight(context, dividedBy: 10.8),
                  color: CupertinoColors.systemPurple,
                  child: Image.network(
                      fit: BoxFit.cover, widget.assetimage.toString()),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      BuildTextWidget(
                        text: widget.title,
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      BuildTextWidget(
                        text: widget.bloodGroup,
                        fontWeight: FontWeight.bold,
                        size: 15,
                        color: Constants.kitGradients[3],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 150,
                    child: BuildTextWidget(
                      text: widget.address,
                      size: 10,
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: 33,
                    height: 33,
                    child: GestureDetector(
                      onTap: () async {
                        // _launchPhone('9847106713');
                        Uri phoneNumber = Uri.parse('tel:+8137988414');
                        if (await launchUrl(phoneNumber)) {
                          print('Dialer opened');
                        } else {
                          print('Dialer is not opened');
                        }
                        print('tapped');
                      },
                      child: Image(
                        color: Constants.kitGradients[8],
                        image: const AssetImage(
                            'assets/images/icon_images/accept-call-icon (1).png'),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _launchPhone(String phoneNumber) async {
  final url = 'tel:$phoneNumber';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
