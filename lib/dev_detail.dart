// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Dev_DetailScreen extends StatefulWidget {
//   final int index;

//   const Dev_DetailScreen({super.key, required this.index});

//   @override
//   State<Dev_DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<Dev_DetailScreen> {
//   bool isBookmarked = false; // State to track bookmark status

//   final List<Map<String, dynamic>> waterfalls = [
//     {
//       'name': 'Devkund Waterfalls',
//       'location': 'Tamhini Ghat,Mulshi',
//       'rating': 4.8,
//       'image': 'assets/Devkund.jpeg',
//       'about': "Devkund Waterfall is a waterfall located near Bhira, in Raigad district, Maharashtra, India. "
//           "It is a 'plunge' waterfall pouring massive amounts of water on the rocky surface underneath. "
//           "It is a popular spot for one-day picnics.\n\n"
//           "Location\n"
//           "Devkund Waterfall is located in Bhira Patnus and has become extremely crowded and dangerous, "
//           "especially after gaining popularity on social media. Several lives have been lost while amateurs try to visit this place on their own. "
//           "It is the confluence of three waterfalls and is said to be the origin of the Kundalika River. "
//           "The trek to Devkund is about three hours from the base village, following the dam backwater and passing through forests. "
//           "A guide is required as the area is surrounded by dense forest. Locals suggest visiting between September and mid-November.\n\n"
//           "Commutation\n"
//           "Distance from Pune: 110 km\n"
//           "Distance from Mumbai: 170 km\n"
//           "Distance from Lonavala: 52 km\n\n"
//           "Nearest airports:\n"
//           "- Pune: international\n"
//           "- Mumbai: international\n\n"
//           "Nearest railway junctions:\n"
//           "- Mangaon railway station on Konkan Railway, 30 km away\n"
//           "- Lonavala railway station on Central Railway, 82 km away\n\n"
//           "Bathing\n"
//           "Devkund Waterfall is great for enjoying a bath under the waterfall, but the area has become polluted due to tourist activities.\n\n"
//           "Trek Details\n"
//           "Duration: 1.5-2 hrs (to reach the waterfall from the start point)\n"
//           "Distance: 6.5 km approx. (one way)\n"
//           "Difficulty level: moderate (life-threatening during heavy monsoons due to crossing three streams)\n"
//           "Endurance required: medium\n\n"
//           "Safety\n"
//           "During the monsoon, water volume increases rapidly due to the design of the hills, making it unsafe. "
//           "In 2017, Devkund Waterfall was closed to tourists for three months during the monsoon after several accidents. "
//           "In 2018, district authorities prohibited access to Devkund waterfall between 12 July and 12 September. "
//           "Tourists are advised to avoid the location during heavy rains."
//       // Additional details...
//       ,
//       'photos': [
//         "assets/Devkund/Dev1.jpeg",
//         "assets/Devkund/Dev2.jpeg",
//         "assets/Devkund/Dev3.jpeg",
//         "assets/Devkund/Dev4.jpeg",
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
//                       if (!isBookmarked) {
//                         final Map<String, dynamic> dataToSave = {
//                           "name": waterfall['name'],
//                           "location": waterfall['location'],
//                           "rating": waterfall['rating'],
//                           "image": waterfall['image'],
//                           "timestamp": DateTime.now().toString(),
//                         };

//                         try {
//                           // Save data to Firestore
//                           final collectionRef = FirebaseFirestore.instance
//                               .collection('bookmarked_waterfalls');
//                           await collectionRef.add(dataToSave);
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                                 content:
//                                     Text('Waterfall bookmarked successfully!')),
//                           );
//                           setState(() {
//                             isBookmarked = true; // Mark as bookmarked
//                           });
//                         } catch (e) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Error bookmarking: $e')),
//                           );
//                         }
//                       } else {
//                         // Unbookmark functionality if desired
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(content: Text('Already bookmarked!')),
//                         );
//                       }
//                     },
//                     icon: Icon(
//                       isBookmarked
//                           ? Icons.bookmark // Filled bookmark icon
//                           : Icons.bookmark_border, // Outlined bookmark icon
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

class DevDetail extends StatefulWidget {
  final int index;

  const DevDetail({super.key, required this.index});

  @override
  State<DevDetail> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DevDetail> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Devkund Waterfalls',
      'location': 'Tamhini Ghat,Mulshi',
      'rating': 4.8,
      'image': 'assets/Devkund.jpeg',
      'about': "Devkund Waterfall is a waterfall located near Bhira, in Raigad district, Maharashtra, India. "
          "It is a 'plunge' waterfall pouring massive amounts of water on the rocky surface underneath. "
          "It is a popular spot for one-day picnics.\n\n"
          "Location\n"
          "Devkund Waterfall is located in Bhira Patnus and has become extremely crowded and dangerous, "
          "especially after gaining popularity on social media. Several lives have been lost while amateurs try to visit this place on their own. "
          "It is the confluence of three waterfalls and is said to be the origin of the Kundalika River. "
          "The trek to Devkund is about three hours from the base village, following the dam backwater and passing through forests. "
          "A guide is required as the area is surrounded by dense forest. Locals suggest visiting between September and mid-November.\n\n"
          "Commutation\n"
          "Distance from Pune: 110 km\n"
          "Distance from Mumbai: 170 km\n"
          "Distance from Lonavala: 52 km\n\n"
          "Nearest airports:\n"
          "- Pune: international\n"
          "- Mumbai: international\n\n"
          "Nearest railway junctions:\n"
          "- Mangaon railway station on Konkan Railway, 30 km away\n"
          "- Lonavala railway station on Central Railway, 82 km away\n\n"
          "Bathing\n"
          "Devkund Waterfall is great for enjoying a bath under the waterfall, but the area has become polluted due to tourist activities.\n\n"
          "Trek Details\n"
          "Duration: 1.5-2 hrs (to reach the waterfall from the start point)\n"
          "Distance: 6.5 km approx. (one way)\n"
          "Difficulty level: moderate (life-threatening during heavy monsoons due to crossing three streams)\n"
          "Endurance required: medium\n\n"
          "Safety\n"
          "During the monsoon, water volume increases rapidly due to the design of the hills, making it unsafe. "
          "In 2017, Devkund Waterfall was closed to tourists for three months during the monsoon after several accidents. "
          "In 2018, district authorities prohibited access to Devkund waterfall between 12 July and 12 September. "
          "Tourists are advised to avoid the location during heavy rains."
      // Additional details...
      ,
      'photos': [
        "assets/Devkund/Dev1.jpeg",
        "assets/Devkund/Dev2.jpeg",
        "assets/Devkund/Dev3.jpeg",
        "assets/Devkund/Dev4.jpeg",
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
