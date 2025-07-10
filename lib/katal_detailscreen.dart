// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Katal_DetailScreen extends StatefulWidget {
//   final int index;

//   const Katal_DetailScreen({super.key, required this.index});

//   @override
//   State<Katal_DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<Katal_DetailScreen> {
//   final List<Map<String, dynamic>> waterfalls = [
//     {
//       'name': 'Kataldhara Waterfall',
//       'location': 'Lonavla',
//       'rating': 4.8,
//       'image': 'assets/kataldhara.jpeg',
//       'about': "Kataldhar Waterfall Overview\n\n"
//           "Kataldhar is a stunning waterfall near Lonavala in Pune district, Maharashtra. "
//           "Although not widely known, the waterfall is a hidden gem for trekking enthusiasts. "
//           "Reaching the valley requires basic trekking experience, and water flows only during the monsoon season, "
//           "making it a seasonal marvel.\n\n"
//           "Location\n"
//           "Kataldhar Waterfall is located near Rajmachi Fort. To access it, you need to find three mango trees on the Rajmachi Trekking route. "
//           "From there, descend into the Ulhas Valley through dense forest. After reaching the waterfall, you'll find an eye-shaped cave that can "
//           "accommodate approximately 100 people. The cave also offers a spectacular view of Rajmachi Fort (Srivardhan Fort Balekilla).\n\n"
//           "Features\n"
//           "The Kataldhar Waterfall boasts a height of about 350 feet with an overhang of more than 100 feet, making it a captivating sight during the monsoon. "
//           "The combination of natural beauty, challenging trekking paths, and the cave's uniqueness make it a must-visit spot for adventure seekers.\n\n"
//           "Best Time to Visit\n"
//           "The best time to visit Kataldhar Waterfall is during the monsoon season, typically between June and September, when the water flow is at its peak. "
//           "The trek through lush greenery and the breathtaking view of the valley and Rajmachi Fort add to the experience.\n\n"
//           "Trekking Tips\n"
//           "- Ensure you are prepared for basic trekking challenges.\n"
//           "- Carry adequate water and snacks.\n"
//           "- Wear sturdy trekking shoes.\n"
//           "- Be mindful of slippery paths during the monsoon.\n"
//           "- Consider hiring a guide if unfamiliar with the route.\n",
//       'photos': [
//         'assets/kalu2.jpeg',
//         'assets/kalu.jpeg',
//         'assets/kalu3.jpeg',
//         'assets/kalu/kalu4.jpeg',
//       ],
//     },
//     {
//       'name': 'Malshej Waterfalls',
//       'location': 'Malshej Ghat, Murbad',
//       'rating': 4.8,
//       'image': 'assets/Malshej.jpg',
//       'about': "Located 6 km from Malshej Ghat ...",
//       'photos': [
//         'assets/Kataldhara/kat1.jpeg',
//         'assets/Kataldhara/kat2.webp',
//         'assets/Kataldhara/kat1.jpeg',
//         'assets/Kataldhara/kat1.jpg',
//       ],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // Access the selected waterfall using the index
//     final waterfall = waterfalls[widget.index];

//     return Scaffold(
//       body: Stack(
//         children: [
//           // Top Image Section
//           Container(
//             height: MediaQuery.of(context).size.height * 0.5,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(waterfall['image']),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                   ),
//                   IconButton(
//                     onPressed: () async {
//                       final Map<String, dynamic> dataToSave = {
//                         "name": "Kataldhara Waterfall",
//                         "location": "Lonavla",
//                         "rating": 4.8,
//                         "image": "assets/kataldhara.jpeg",
//                         "timestamp":
//                             DateTime.now().toString(), // Optional for sorting
//                       };

//                       try {
//                         // Save data to Firestore
//                         final collectionRef = FirebaseFirestore.instance
//                             .collection('bookmarked_waterfalls');
//                         await collectionRef.add(dataToSave);
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content:
//                                   Text('Waterfall bookmarked successfully!')),
//                         );
//                       } catch (e) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Error bookmarking: $e')),
//                         );
//                       }
//                     },
//                     icon: const Icon(
//                       Icons.bookmark_border,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Bottom Card Section
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.55,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Title and Location
//                     Text(
//                       waterfall['name'],
//                       style: GoogleFonts.poppins(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         const Icon(Icons.location_on,
//                             color: Colors.red, size: 18),
//                         const SizedBox(width: 4),
//                         Text(
//                           waterfall['location'],
//                           style: GoogleFonts.poppins(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     // Rating Section
//                     Row(
//                       children: [
//                         Text(
//                           waterfall['rating'].toString(),
//                           style: const TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         const Icon(Icons.star, color: Color(0xFFEE684A)),
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     // Tab Section
//                     DefaultTabController(
//                       length: 3,
//                       child: Column(
//                         children: [
//                           const TabBar(
//                             labelPadding: EdgeInsets.symmetric(horizontal: 20),
//                             isScrollable: true,
//                             tabs: [
//                               Tab(text: "About"),
//                               Tab(text: "Videos"),
//                               Tab(text: "Photos"),
//                             ],
//                           ),
//                           Container(
//                             height: 230,
//                             child: TabBarView(
//                               children: [
//                                 // About Section
//                                 SingleChildScrollView(
//                                   child: Text(
//                                     waterfall['about'],
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 15, color: Colors.grey),
//                                   ),
//                                 ),
//                                 // Videos Section
//                                 Center(
//                                   child: Text(
//                                     "Video section coming soon!",
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 15, color: Colors.grey),
//                                   ),
//                                 ),
//                                 // Photos Section
//                                 SingleChildScrollView(
//                                   child: Column(
//                                     children: List.generate(
//                                       waterfall['photos'].length,
//                                       (index) => Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             vertical: 10),
//                                         child: Container(
//                                           width: double.infinity,
//                                           height: 200,
//                                           decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(20),
//                                             image: DecorationImage(
//                                               image: AssetImage(
//                                                   waterfall['photos'][index]),
//                                               fit: BoxFit.cover,
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KatalDetailscreen extends StatefulWidget {
  final int index;

  const KatalDetailscreen({super.key, required this.index});

  @override
  State<KatalDetailscreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<KatalDetailscreen> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Kataldhara Waterfall',
      'location': 'Lonavla',
      'rating': 4.8,
      'image': 'assets/kataldhara.jpeg',
      'about': "Kataldhar Waterfall Overview\n\n"
          "Kataldhar is a stunning waterfall near Lonavala in Pune district, Maharashtra. "
          "Although not widely known, the waterfall is a hidden gem for trekking enthusiasts. "
          "Reaching the valley requires basic trekking experience, and water flows only during the monsoon season, "
          "making it a seasonal marvel.\n\n"
          "Location\n"
          "Kataldhar Waterfall is located near Rajmachi Fort. To access it, you need to find three mango trees on the Rajmachi Trekking route. "
          "From there, descend into the Ulhas Valley through dense forest. After reaching the waterfall, you'll find an eye-shaped cave that can "
          "accommodate approximately 100 people. The cave also offers a spectacular view of Rajmachi Fort (Srivardhan Fort Balekilla).\n\n"
          "Features\n"
          "The Kataldhar Waterfall boasts a height of about 350 feet with an overhang of more than 100 feet, making it a captivating sight during the monsoon. "
          "The combination of natural beauty, challenging trekking paths, and the cave's uniqueness make it a must-visit spot for adventure seekers.\n\n"
          "Best Time to Visit\n"
          "The best time to visit Kataldhar Waterfall is during the monsoon season, typically between June and September, when the water flow is at its peak. "
          "The trek through lush greenery and the breathtaking view of the valley and Rajmachi Fort add to the experience.\n\n"
          "Trekking Tips\n"
          "- Ensure you are prepared for basic trekking challenges.\n"
          "- Carry adequate water and snacks.\n"
          "- Wear sturdy trekking shoes.\n"
          "- Be mindful of slippery paths during the monsoon.\n"
          "- Consider hiring a guide if unfamiliar with the route.\n",
      'photos': [
        'assets/kalu2.jpeg',
        'assets/kalu.jpeg',
        'assets/kalu3.jpeg',
        'assets/kalu/kalu4.jpeg',
      ],
    },
    {
      'name': 'Malshej Waterfalls',
      'location': 'Malshej Ghat, Murbad',
      'rating': 4.8,
      'image': 'assets/Malshej.jpg',
      'about': "Located 6 km from Malshej Ghat ...",
      'photos': [
        'assets/Kataldhara/kat1.jpeg',
        'assets/Kataldhara/kat2.webp',
        'assets/Kataldhara/kat1.jpeg',
        'assets/Kataldhara/kat1.jpg',
      ],
    },
  ];
  bool isBookmarked = false; // Tracks bookmark status

  @override
  void initState() {
    super.initState();
    _checkBookmarkStatus();
  }

  Future<void> _checkBookmarkStatus() async {
    try {
      final collectionRef =
          FirebaseFirestore.instance.collection('bookmarked_waterfalls');
      final querySnapshot = await collectionRef
          .where('name', isEqualTo: waterfalls[widget.index]['name'])
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          isBookmarked = true;
        });
      }
    } catch (e) {
      print('Error checking bookmark status: $e');
    }
  }

  Future<void> _toggleBookmark() async {
    final collectionRef =
        FirebaseFirestore.instance.collection('bookmarked_waterfalls');
    final waterfall = waterfalls[widget.index];

    if (isBookmarked) {
      // Remove bookmark
      try {
        final querySnapshot = await collectionRef
            .where('name', isEqualTo: waterfall['name'])
            .get();
        for (var doc in querySnapshot.docs) {
          await doc.reference.delete();
        }
        setState(() {
          isBookmarked = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Bookmark removed successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error removing bookmark: $e')),
        );
      }
    } else {
      // Add bookmark
      final dataToSave = {
        "name": waterfall['name'],
        "location": waterfall['location'],
        "rating": waterfall['rating'],
        "image": waterfall['image'],
        "timestamp": DateTime.now().toString(),
      };

      try {
        await collectionRef.add(dataToSave);
        setState(() {
          isBookmarked = true;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Waterfall bookmarked successfully!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error bookmarking: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final waterfall = waterfalls[widget.index];

    return Scaffold(
      body: Stack(
        children: [
          // Top Image Section
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(waterfall['image']),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  IconButton(
                    onPressed: _toggleBookmark,
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom Card Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title and Location
                    Text(
                      waterfall['name'],
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.red, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          waterfall['location'],
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Rating Section
                    Row(
                      children: [
                        Text(
                          waterfall['rating'].toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.star, color: Color(0xFFEE684A)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Tab Section
                    DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const TabBar(
                            labelPadding: EdgeInsets.symmetric(horizontal: 20),
                            isScrollable: true,
                            tabs: [
                              Tab(text: "About"),
                              Tab(text: "Photos"),
                            ],
                          ),
                          SizedBox(
                            height: 230,
                            child: TabBarView(
                              children: [
                                // About Section
                                SingleChildScrollView(
                                  child: Text(
                                    waterfall['about'],
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
                                // Videos Section

                                // Photos Section
                                SingleChildScrollView(
                                  child: Column(
                                    children: List.generate(
                                      waterfall['photos'].length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Container(
                                          width: double.infinity,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                  waterfall['photos'][index]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
