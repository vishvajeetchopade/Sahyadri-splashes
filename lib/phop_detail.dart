// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class PhopDetail extends StatefulWidget {
//   final int index;

//   const PhopDetail({super.key, required this.index});

//   @override
//   State<PhopDetail> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<PhopDetail> {
//   final List<Map<String, dynamic>> waterfalls = [
//     {
//       'name': 'Phopsandi Waterfall',
//       'location': 'Akole',
//       'rating': 4.8,
//       'image': 'assets/phopsandi.jpeg',
//       'about': "Fofsandi Village Overview\n\n"
//           "Fofsandi is a small yet breathtaking village nestled in Ahmednagar, Maharashtra. "
//           "A hidden gem for nature lovers, this picturesque destination is surrounded by mesmerizing waterfalls, lush green fields, and towering mountains. "
//           "The scenic roads leading to the village offer stunning views at every turn, making the journey to Fofsandi as delightful as the destination itself.\n\n"
//           "Highlights\n"
//           "- **Waterfalls:** Fofsandi is home to several refreshing waterfalls, perfect for a tranquil escape or an adventurous exploration.\n"
//           "- **Lush Green Fields:** The expansive green fields are a treat to the eyes and provide a serene atmosphere to relax and unwind.\n"
//           "- **Towering Mountains:** The village is encircled by towering mountains, adding to its natural beauty and offering excellent trekking opportunities for adventure enthusiasts.\n\n"
//           "Why Visit Fofsandi?\n"
//           "- **Nature Enthusiasts:** Fofsandi's natural beauty makes it a paradise for those who love the outdoors.\n"
//           "- **Adventurers:** From trekking to exploring waterfalls, Fofsandi offers activities that will satisfy the adventurous soul.\n"
//           "- **Peace Seekers:** If you're looking for a peaceful getaway to rejuvenate your mind and soul, Fofsandi is the perfect escape.\n\n"
//           "Discover the magic of Fofsandi and let its serene atmosphere and breathtaking landscapes captivate your heart!",
//       'photos': [
//         "assets/Phopsandi/phop1.webp",
//         "assets/Phopsandi/phop2.jpeg",
//         "assets/Phopsandi/phop3.jpeg",
//         "assets/Phopsandi/phop1.jpeg",
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
//                         "name": "Phopsandi Waterfall",
//                         "location": "Akole",
//                         "rating": 4.8,
//                         "image": "assets/phopsandi.jpeg",
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

class PhopDetail extends StatefulWidget {
  final int index;

  const PhopDetail({super.key, required this.index});

  @override
  State<PhopDetail> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<PhopDetail> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Phopsandi Waterfall',
      'location': 'Akole',
      'rating': 4.8,
      'image': 'assets/phopsandi.jpeg',
      'about': "Fofsandi Village Overview\n\n"
          "Fofsandi is a small yet breathtaking village nestled in Ahmednagar, Maharashtra. "
          "A hidden gem for nature lovers, this picturesque destination is surrounded by mesmerizing waterfalls, lush green fields, and towering mountains. "
          "The scenic roads leading to the village offer stunning views at every turn, making the journey to Fofsandi as delightful as the destination itself.\n\n"
          "Highlights\n"
          "- **Waterfalls:** Fofsandi is home to several refreshing waterfalls, perfect for a tranquil escape or an adventurous exploration.\n"
          "- **Lush Green Fields:** The expansive green fields are a treat to the eyes and provide a serene atmosphere to relax and unwind.\n"
          "- **Towering Mountains:** The village is encircled by towering mountains, adding to its natural beauty and offering excellent trekking opportunities for adventure enthusiasts.\n\n"
          "Why Visit Fofsandi?\n"
          "- **Nature Enthusiasts:** Fofsandi's natural beauty makes it a paradise for those who love the outdoors.\n"
          "- **Adventurers:** From trekking to exploring waterfalls, Fofsandi offers activities that will satisfy the adventurous soul.\n"
          "- **Peace Seekers:** If you're looking for a peaceful getaway to rejuvenate your mind and soul, Fofsandi is the perfect escape.\n\n"
          "Discover the magic of Fofsandi and let its serene atmosphere and breathtaking landscapes captivate your heart!",
      'photos': [
        "assets/Phopsandi/phop1.webp",
        "assets/Phopsandi/phop2.jpeg",
        "assets/Phopsandi/phop3.jpeg",
        "assets/Phopsandi/phop1.jpeg",
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
