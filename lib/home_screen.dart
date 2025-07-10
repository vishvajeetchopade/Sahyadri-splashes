import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import "package:google_fonts/google_fonts.dart";

import 'package:sahyadri_splashes/amboli_detail.dart';
import 'package:sahyadri_splashes/bhiv_detail.dart';

import 'package:sahyadri_splashes/bookmark_screen.dart';
import 'package:sahyadri_splashes/dev_detail.dart';
import 'package:sahyadri_splashes/dudh_detail.dart';

import 'package:sahyadri_splashes/kalu_detailscreen.dart';
import 'package:sahyadri_splashes/katal_detailscreen.dart';

import 'package:sahyadri_splashes/kumbhe_detal.dart';
import 'package:sahyadri_splashes/malshej_detail.dart';
import 'package:sahyadri_splashes/nane_detail.dart';

import 'package:sahyadri_splashes/phop_detail.dart';

import 'package:sahyadri_splashes/ran_detail.dart';
// import 'package:sahyadri_splashes/search.dart';
import 'package:sahyadri_splashes/search2.dart';

import 'package:sahyadri_splashes/tamhini_detail.dart';

import 'package:sahyadri_splashes/thoseghat_detail.dart';

import 'package:sahyadri_splashes/vajrai_detail.dart';

class SahyadriSplashes extends StatefulWidget {
  const SahyadriSplashes({super.key});
  static List<Widget> savedList = [];

  @override
  State createState() => _SahyadriSplashesState();
}

class _SahyadriSplashesState extends State with TickerProviderStateMixin {
  final List<Map<String, dynamic>> waterfalls3 = [
    {
      'name': 'Fofsandi Waterfall',
      'location': 'Fofsandi, Akole',
      'rating': 4.1,
      'image': 'assets/phopsandi.jpeg',
      'navigateTo': const PhopDetail(
        index: 0,
      ),
    },
    {
      'name': 'Nanemachi Waterfall',
      'location': 'Mahad, Raigad',
      'rating': 4.1,
      'image': 'assets/nanemachi.jpg',
      'navigateTo': const NaneDetail(index: 0),
    },
    {
      'name': 'Bhivpuri Waterfall',
      'location': 'Bhivpuri Camp, Ashane',
      'rating': 3.9,
      'image': 'assets/bhivpuri.jpg',
      'navigateTo': const BhivDetail(index: 0)
    },
  ];

  final List<Map<String, dynamic>> rowwaterfalls = [
    {
      'name': 'Dudhsagar Waterfall',
      'location': 'Sonauli, Goa',
      'rating': 4.4,
      'image': 'assets/dudhsagar.jpeg',
      'navigateTo': const DudhDetail(
        index: 0,
      ),
    },
    {
      'name': 'Kataldhara Waterfall',
      'location': 'Lonavala',
      'rating': 4.3,
      'image': 'assets/kataldhara.jpeg',
      'navigateTo': const KatalDetailscreen(
        index: 0,
      ),
    },
    {
      'name': 'Kumbhe Waterfall',
      'location': 'Kumbhe, Raigad',
      'rating': 4.2,
      'image': 'assets/kumbhe.jpeg',
      'navigateTo': const KatalDetailscreen(
        index: 0,
      ),
    },
  ];
  final List<Map<String, String>> waterfalls = [
    {
      "name": "Kalu Waterfall",
      "location": "Malshej Ghat, Murbad",
      "rating": "4.4",
      "image": "assets/kalu2.jpeg",
      "route": "Kalu",
    },
    {
      "name": "Devkund Waterfall",
      "location": "Tamhini Ghat, Mulshi",
      "rating": "4.2",
      "image": "assets/Devkund.jpeg",
      "route": "Devkund",
    },
    {
      "name": "Kumbhe Waterfall",
      "location": "Kumbhe, Raigad",
      "rating": "4.2",
      "image": "assets/kumbhe.jpeg",
      "route": "Kumbhe",
    },
    {
      "name": "Randha Waterfall",
      "location": "Bhandardara, Ahilyanagar",
      "rating": "4.2",
      "image": "assets/randha.jpg",
      "route": "Randha",
    },
    {
      "name": "Amboli Waterfall",
      "location": "Amboli",
      "rating": "4.4",
      "image": "assets/amboli.jpg",
      "route": "Amboli",
    },
    {
      "name": "Thoseghar Waterfall",
      "location": "Satara",
      "rating": "4.4",
      "image": "assets/thoseghar.jpg",
      "route": "Thoseghar",
    },
  ];
  final List<Map<String, dynamic>> topwaterfalls = [
    {
      'name': 'Malshej Ghat Falls',
      'location': 'Murbad',
      'rating': 4.4,
      'image': 'assets/Malshej.jpg',
      'navigateTo': const MalshejDetail(index: 0), // Replace with your widget
    },
    {
      'name': 'Tamhini Ghat Falls',
      'location': 'Mulshi',
      'rating': 4.2,
      'image': 'assets/tamhini.jpg',
      'navigateTo': const TamhiniDetail(index: 0) // Replace with your widget
    },
    {
      'name': 'Vajrai WaterFalls',
      'location': 'Kas, Satara',
      'rating': 4.1,
      'image': 'assets/Vajrai/vaj2.jpg',
      'navigateTo': const VajraiDetail(index: 0) // Replace with your widget
    },
  ];

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
              fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, top: 25, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sahyadri Splashes !!",
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(
              "Lets'Explore Together",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                child: Align(
              alignment: Alignment.topLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                controller: tabController,
                isScrollable: true,
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(text: "Popular"),
                  Tab(text: "Recommonded"),
                ],
              ),
            )),
            SizedBox(
              height: 230,
              width: double.maxFinite,
              child: TabBarView(controller: tabController, children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: waterfalls
                        .map((waterfall) =>
                            buildWaterfallCard(context, waterfall))
                        .toList(),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(rowwaterfalls.length, (index) {
                      // Accessing the current waterfall data
                      final waterfall = rowwaterfalls[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return waterfall['navigateTo'];
                              },
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          margin: const EdgeInsets.only(left: 10),
                          width: 220,
                          height: 195,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 202,
                                height: 119,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(waterfall['image']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          waterfall['name'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFEE684A),
                                          size: 15,
                                        ),
                                        Text(
                                          waterfall['rating'].toString(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          size: 15,
                                          color: Color(0xFFEE684A),
                                        ),
                                        Text(
                                          waterfall['location'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                //Recommonded------------------------------------------------------------
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(waterfalls3.length, (index) {
                      final waterfall =
                          waterfalls3[index]; // Use waterfalls3 here

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => waterfall[
                                  'navigateTo'], // Use the correct navigation
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          margin: const EdgeInsets.only(left: 10),
                          width: 225,
                          height: 195,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white70,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 202,
                                height: 119,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: AssetImage(waterfall[
                                        'image']), // Access correct image path
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 15),
                                    Row(
                                      children: [
                                        Text(
                                          waterfall['name'], // Access name
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.star,
                                          color: Color(0xFFEE684A),
                                          size: 15,
                                        ),
                                        Text(
                                          waterfall['rating']
                                              .toString(), // Access rating
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_rounded,
                                          size: 15,
                                          color: Color(0xFFEE684A),
                                        ),
                                        Text(
                                          waterfall[
                                              'location'], // Access location
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                )
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top Places",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: List.generate(
                        topwaterfalls.length,
                        (index) {
                          final waterfall = topwaterfalls[index];

                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => waterfall['navigateTo'],
                                ),
                              );
                            },
                            child: Container(
                              width: 355,
                              height: 100,
                              padding: const EdgeInsets.only(
                                  top: 3, left: 10, right: 3),
                              margin: const EdgeInsets.only(top: 10, bottom: 3),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 85,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(waterfall['image']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          waterfall['name'],
                                          style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(
                                                Icons.location_on_rounded,
                                                size: 15,
                                                color: Color(0xFFEE684A)),
                                            Text(
                                              waterfall['location'],
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            const Icon(Icons.star,
                                                size: 15,
                                                color: Color(0xFFEE684A)),
                                            Text(
                                              waterfall['rating'].toString(),
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 20),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  //   return const MainApp(); // Replace with your home screen widget
                  // }));
                },
                icon: const Icon(Icons.home_filled, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SearchPage(); // Replace with your search screen widget
                  }));
                },
                icon: const Icon(Icons.search_outlined, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const BookmarkPage();
                  }));
                },
                icon: const Icon(Icons.bookmark, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildWaterfallCard(
      BuildContext context, Map<String, String> waterfall) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            switch (waterfall["route"]) {
              case "Kalu":
                return const KaluDetailscreen(
                  index: 0,
                ); // Replace with your actual class
              case "Devkund":
                return const DevDetail(
                    index: 0); // Replace with your actual class
              case "Kumbhe":
                return const KumbheDetal(
                  index: 0,
                ); // Replace with your actual class
              case "Randha":
                return const RanDetail(
                  index: 0,
                );
              case "Amboli":
                return const AmboliDetail(index: 0);
              case "Thoseghar":
                return const ThosegharDetail(index: 0);
              default:
                return const Scaffold(
                    body: Center(child: Text("Unknown Route")));
            }
          },
        ));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.only(left: 10),
        width: 213,
        height: 195,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white70,
        ),
        child: Column(
          children: [
            Container(
              width: 197,
              height: 119,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(waterfall["image"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text(
                        waterfall["name"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.star,
                          color: Color(0xFFEE684A), size: 15),
                      Text(
                        waterfall["rating"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.location_on_rounded,
                          size: 15, color: Color(0xFFEE684A)),
                      Text(
                        waterfall["location"]!,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
