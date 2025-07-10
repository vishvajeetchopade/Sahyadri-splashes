// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class NaneDetail extends StatefulWidget {
//   final int index;

//   const NaneDetail({super.key, required this.index});

//   @override
//   State<NaneDetail> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<NaneDetail> {
//   final List<Map<String, dynamic>> waterfalls = [
//     {
//       'name': 'NaneMachi Waterfalls',
//       'location': 'Mahad,Raigad',
//       'rating': 4.8,
//       'image': 'assets/nanemachi.jpg',
//       'about': "About Nanemachi Waterfall Trek\n\n"
//           "Nanemachi Waterfall is one of the most spectacular waterfalls in Maharashtra, "
//           "located a few kilometers from Mahad in the Raigad district. Nestled within dense green forests, this hidden gem boasts a breathtaking 410-foot waterfall with striking blue water that changes shades throughout the day, creating a magical experience for visitors.\n\n"
//           "Trek Highlights:\n"
//           "- **Height:** 410 feet\n"
//           "- **Trek Location:** Raigad District, Mahad, Maharashtra\n"
//           "- **Trek Distance:** 3 to 4 km\n"
//           "- **Trail Type:** Dense Forest Trail\n"
//           "- **Difficulty Level:** Easy\n"
//           "- **Endurance Level:** Easy to Medium\n"
//           "- **Time Required:** Approximately 1 hour from the parking area\n\n"
//           "Why Visit Nanemachi Waterfall?\n"
//           "Experience the untouched beauty of nature with this incredible waterfall. The waterfall's pool glows with different shades of color throughout the day, adding to its mystic charm. Whether you're a trek enthusiast or a nature lover, this destination promises a rejuvenating experience.\n\n"
//           "Best Time to Visit:\n"
//           "The monsoon season (June to September) is the ideal time to visit Nanemachi Waterfall to witness the cascade in its full glory.\n\n"
//           "How to Reach:\n"
//           "- **By Train:** The nearest railway stations are Veer and Sape Wamne, located near Mahad.\n"
//           "- **By Road:**\n"
//           "  - From Pune: 175 km\n"
//           "  - From Mumbai: 240 km\n\n",
//       'photos': [
//         "assets/Nanemachi/nane1.jpeg",
//         "assets/Nanemachi/nane2.jpeg",
//         "assets/Nanemachi/nane3.jpeg",
//         "assets/Nanemachi/nane4.jpeg",
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
//                         "name": "Nanemachi Waterfall",
//                         "location": "Mahad,Raigad",
//                         "rating": 4.8,
//                         "image": "assets/nanemachi.jpg",
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

class NaneDetail extends StatefulWidget {
  final int index;

  const NaneDetail({super.key, required this.index});

  @override
  State<NaneDetail> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<NaneDetail> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'NaneMachi Waterfalls',
      'location': 'Mahad,Raigad',
      'rating': 4.8,
      'image': 'assets/nanemachi.jpg',
      'about': "About Nanemachi Waterfall Trek\n\n"
          "Nanemachi Waterfall is one of the most spectacular waterfalls in Maharashtra, "
          "located a few kilometers from Mahad in the Raigad district. Nestled within dense green forests, this hidden gem boasts a breathtaking 410-foot waterfall with striking blue water that changes shades throughout the day, creating a magical experience for visitors.\n\n"
          "Trek Highlights:\n"
          "- **Height:** 410 feet\n"
          "- **Trek Location:** Raigad District, Mahad, Maharashtra\n"
          "- **Trek Distance:** 3 to 4 km\n"
          "- **Trail Type:** Dense Forest Trail\n"
          "- **Difficulty Level:** Easy\n"
          "- **Endurance Level:** Easy to Medium\n"
          "- **Time Required:** Approximately 1 hour from the parking area\n\n"
          "Why Visit Nanemachi Waterfall?\n"
          "Experience the untouched beauty of nature with this incredible waterfall. The waterfall's pool glows with different shades of color throughout the day, adding to its mystic charm. Whether you're a trek enthusiast or a nature lover, this destination promises a rejuvenating experience.\n\n"
          "Best Time to Visit:\n"
          "The monsoon season (June to September) is the ideal time to visit Nanemachi Waterfall to witness the cascade in its full glory.\n\n"
          "How to Reach:\n"
          "- **By Train:** The nearest railway stations are Veer and Sape Wamne, located near Mahad.\n"
          "- **By Road:**\n"
          "  - From Pune: 175 km\n"
          "  - From Mumbai: 240 km\n\n",
      'photos': [
        "assets/Nanemachi/nane1.jpeg",
        "assets/Nanemachi/nane2.jpeg",
        "assets/Nanemachi/nane3.jpeg",
        "assets/Nanemachi/nane4.jpeg",
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
