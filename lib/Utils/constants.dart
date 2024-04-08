import 'dart:ui';

import 'package:blood_donation_app/Models/subplaces_model.dart';
import 'package:flutter/material.dart';

import '../Models/blood_group_model.dart';
import '../Models/donor_list_model.dart';
import '../Models/pick_your_blood_group_model.dart';
import '../Models/places_images_model.dart';
import '../Models/positive_negative_model.dart';

class Constants {
  static const String BOX_NAME = "BloodDonation";
  static List<Color> kitGradients = [
    Colors.white, //0
    Colors.black, //1
    Colors.red, //2
    const Color(0xffc40000), //3
    const Color(0xffe30000), //4
    const Color(0xffffb0b0), //5
    const Color(0xff474bff), //6
    const Color(0xffb7b7b7), //7
    const Color(0xff00c40b), //8
    const Color(0xff191970), //8
  ];
  static List<PickBloodGroupList> pickblood = [
    PickBloodGroupList(
      title: 'A',
    ),
    PickBloodGroupList(
      title: 'B',
    ),
    PickBloodGroupList(
      title: 'o',
    ),
    PickBloodGroupList(
      title: 'AB',
    ),
    PickBloodGroupList(
      title: 'HH',
    ),
    PickBloodGroupList(
      title: 'A+',
    ),
    PickBloodGroupList(
      title: 'A-',
    ),
    PickBloodGroupList(
      title: 'B+',
    ),
    PickBloodGroupList(
      title: 'B-',
    ),
    PickBloodGroupList(
      title: 'o+',
    ),
    PickBloodGroupList(
      title: 'o-',
    ),
    PickBloodGroupList(
      title: 'AB+',
    ),
    PickBloodGroupList(
      title: 'AB-',
    ),
  ];
  static List<PositiveNegativeList> positivenegative = [
    PositiveNegativeList(
      title: '+',
    ),
    PositiveNegativeList(
      title: '-',
    ),
  ];
  static List<BloodGroupList> bloodgroup = [
    BloodGroupList(
      title: 'All',
    ),
    BloodGroupList(title: 'A-'),
    BloodGroupList(title: 'A+'),
    BloodGroupList(title: 'B-'),
    BloodGroupList(title: 'B+'),
    BloodGroupList(title: 'O-'),
    BloodGroupList(title: 'O+'),
    BloodGroupList(title: 'AB-'),
    BloodGroupList(title: 'AB+'),
  ];
  static List<DonorsList> donorslist = [
    DonorsList(
        title: 'Kevin De Bruyne',
        address: 'Kevin De Bruyne, Drongen, Ghent, Flanders, Belgium.',
        bloodGroup: "B+",
        assetimage:
            'assets/images/donors_image/let_kevin_de_bruyne_talk___the_turning_point-1ab24a5f934c2722495780a848aee4dc.webp'),
    DonorsList(
        title: 'osimhen',
        address:
            'Louis-Philippe Riel, based in Brooklyn, New York, United States,',
        bloodGroup: 'o+',
        assetimage: 'assets/images/donors_image/licensed-image.jpg'),
    DonorsList(
        title: 'Gavi',
        address:
            'Pablo Martín Páez Gavira, City Los Palacios y Villafranca, Spain.',
        bloodGroup: 'B-',
        assetimage: 'assets/images/donors_image/30-GAVI_.webp'),
    DonorsList(
        title: 'Garnacho',
        address: 'Rodrigo Hernandez Cascante, Madrid, Spain.',
        bloodGroup: 'A+',
        assetimage:
            'assets/images/donors_image/dd5b96408c788b4d385a7cc0d65d50cf_XL.jpg'),
    DonorsList(
        title: 'Rodri',
        address: 'Rodrigo Hernandez Cascante, Madrid, Spain.',
        bloodGroup: 'A-',
        assetimage:
            'assets/images/donors_image/123228-odhiybzhuc-1562239844.jpg'),
    DonorsList(
        title: 'Jude Bellingham',
        address: 'Rodrigo Hernandez Cascante, Madrid, Spain.',
        bloodGroup: 'AB+',
        assetimage:
            'assets/images/donors_image/1_England-Withdrawals-File-Photos.webp'),
    DonorsList(
      title: 'Lamine Yamal',
      address: 'Rodrigo Hernandez Cascante, Madrid, Spain.',
      bloodGroup: 'AB-',
      assetimage: 'assets/images/donors_image/images.jpg',
    ),
  ];

  static List<SubPlaces> places = [
    SubPlaces(title: 'Thiruvananthapuram', placeList: [
      'Aakkulam',
      'Adimalathura',
      'Akathumuri',
      'AKG Nagar',
      ' Amaravila',
      ' Amboori',
      'Anad',
      '  Anavoor',
      'Anchuthengu',
      'Andoorkonam',
      ' Arayoor',
      'Arikkadamukku',
      'Aruvikkara',
      'Aruvippuram',
      'Aryanadu',
    ]),
    SubPlaces(title: 'kollam', placeList: [
      'Koduvila',
      'Kottamkara',
      'Kottukadu',
      'Kottukkal',
      'Kudavattor',
      'Kulakkada',
      'Kulasekharapuram',
      'Kumbalam',
      'Kummil',
      'Kundayam',
      'Kunnathur',
      'Kunnicode',
      'Kureeppally',
      'Kuzhimathicadu',
      'Kuzhithura',
    ]),
    SubPlaces(title: 'Alappuzha', placeList: [
      'Kanjikuzhi',
      'Kayamkulam',
      'Kokkamangalam',
      'Kokkothamangalam',
      'Komalapuram',
      'Charummood',
      'Chengannur',
      'Cherthala',
      'Chettikulangara',
      'Mannar',
      'Mararikulam North',
      'Mavelikkara',
    ]),
    SubPlaces(title: 'pathanamthitta', placeList: [
      'Kottanad',
      'Kottangal',
      'Kottathur',
      'Kozhencherry East',
      'Kozhippalam',
      'Kudamuck',
      'Kulanada',
      'Kumbanad',
      'Kumbazha',
      'Kummannoor',
      'Kumplampoika',
      'Kunnamthanam',
      'Kurampala',
      'Kurangumala',
      'Kuttappuzha',
      'Kuttimannilbethel',
    ]),
    SubPlaces(title: 'Idukki', placeList: [
      'Marayur',
      'Munnar',
      'Murickassery',
      'Muthalakodam',
      'Paippad',
      'Palackattumala',
      'Pallickathodu',
      'Pallom',
      'Panachikkad',
      'Panackapalam',
      'Panakkachira',
      'Panamattom',
      'Peroor',
    ]),
    SubPlaces(title: 'Ernamkulam', placeList: [
      'Kalady',
      'Kanjoor',
      'Kaprikkad',
      'Keezhmad',
      'Kochi',
      'Kolenchery',
      'Koonammavu',
      'Koothattukulam',
      'Kothamangalam',
      'Kottuvally',
      'Kundannoor',
      'Kunnukara',
      'Kureekkad',
    ]),
    SubPlaces(title: 'Thrissur', placeList: [
      'Kalady',
      'Kanjoor',
      'Kaprikkad',
      'Keezhmad',
      'Kochi',
      'Kolenchery'
          'Koonammavu',
      'Koothattukulam',
      'Kothamangalam',
      'Kottuvally',
      'Kundannoor',
      'Kunnukara',
      'Kureekkad',
    ]),
    SubPlaces(title: 'palakkad', placeList: [
      'Kalady',
      'Kanjoor',
      'Kaprikkad',
      'Keezhmad',
      'Kochi',
      'Kolenchery',
      'Koonammavu',
      'Koothattukulam',
      'Kothamangalam',
      'Kottuvally',
      'Kundannoor',
      'Kunnukara',
      'Kureekkad',
    ]),
    SubPlaces(title: 'malappuram', placeList: [
      'Kalady',
      'Kanjoor',
      'Kaprikkad',
      'Keezhmad',
      'Kochi',
      'Kolenchery',
      'Koonammavu',
      'Koothattukulam',
      'Kothamangalam',
      'Kottuvally',
      'Kundannoor',
      'Kunnukara',
      'Kureekkad',
    ]),
    SubPlaces(title: 'wayanad', placeList: [
      'Kalady',
      'Kanjoor',
      'Kaprikkad,'
          'Keezhmad',
      'Kochi',
      'Kolenchery',
      'Koonammavu',
      'Koothattukulam',
      'Kothamangalam',
      'Kottuvally',
      'Kundannoor',
      'Kunnukara',
      'Kureekkad',
    ]),
    SubPlaces(title: 'kannur', placeList: [
      'ifhid'
          'dkvbk'
          ' kxjn cjn'
    ]),
    SubPlaces(title: 'kasargod', placeList: ['yfjf', 'fhf', 'gkhhf']),
  ];
  static List<PlacesImages> placesimages = [
    PlacesImages(
      assetImage: 'assets/images/places_images/sree-padmanabhaswamy.jpg',
      title: 'Thiruvanthapuram',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/chinnakada-clock-tower-817521.webp',
      title: 'kollam',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/house-boat-river-kerala-backwaters-alleppey-alappuzha-india-november-tropical-palm-trees-162002326.webp',
      title: 'Alappuzha',
    ),
    PlacesImages(
      assetImage: 'assets/images/places_images/IMAGE_1670071327.jpg',
      title: 'Pathanamthitta',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/kottayam-india-shutterstock_1026587635_4ace4aba3b.jpeg',
      title: 'Kottayam',
    ),
    PlacesImages(
      assetImage: 'assets/images/places_images/cr-20220807en62ef76e687d3a.jpg',
      title: 'Idukki',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/fortkochi-kerala_1513932088_1513932093.jpg',
      title: 'Ernamkulam',
    ),
    PlacesImages(
      assetImage: 'assets/images/places_images/VADAKKUNNATHAN-TEMPLE.jpg',
      title: 'Thrissur',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/299d33cdd38bfe576a8ef30bf5407e87.jpg',
      title: 'Palakkad',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/mampuram-mosque-famous-located-tirurangadi-260nw-1489895897.webp',
      title: 'Malappuram',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/360_F_489493520_RpxWXdoNKCda1bnrjp3Bi9XqiiZFJID8.jpg',
      title: 'Kozhikkode',
    ),
    PlacesImages(
      assetImage:
          'assets/images/places_images/wayanad-churam-ghat-pass-popularly-known-as-thamarassery-connects-kozhikode-districts-kerala-state-southern-india-153859223.webp',
      title: 'Wayanad',
    ),
    PlacesImages(
      assetImage: 'assets/images/places_images/1514021570_Payyambalam.jpg',
      title: 'Kannur',
    ),
    PlacesImages(
      assetImage: 'assets/images/places_images/01-1443701401-bekalforte.jpg',
      title: 'Kasargod',
    ),
  ];
}
