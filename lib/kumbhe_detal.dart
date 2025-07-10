// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class Kum_DetailScreen extends StatefulWidget {
//   final int index;

//   const Kum_DetailScreen({super.key, required this.index});

//   @override
//   State<Kum_DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<Kum_DetailScreen> {
//   final List<Map<String, dynamic>> waterfalls = [
//     {
//       'name': 'Kumbhe Waterfalls',
//       'location': 'Kumbhe,Raigad',
//       'rating': 4.8,
//       'image': 'assets/kumbhe.jpeg',
//       'about': "      Kumbhe Waterfall is one of the famous waterfalls near Mumbai and Pune city. "
//           "It is located in Raigad district, Mangaon taluka, village Kumhe. "
//           "Kumbhe Waterfall is so beautiful to watch, falling 178 feet above. "
//           "Once you reach, you will witness the beauty of this waterfall. "
//           "Kumbhe Waterfall is gaining its popularity day by day, thanks to the power of social media. "
//           "Travelers are now exploring this gem of the country.\n\n"
//           "We don't have access to reach the bottom side of this beautiful waterfall. "
//           "Kumbhe Waterfall is surrounded by mountains on three sides. "
//           "You will be on the top side of the waterfall where it falls.\n\n"
//           "Kumbhe Waterfall is so famous that one scene from South superstar Thalapathy Vijay’s movie 'Varisu' was shot here.\n\n"
//           "Points to Visit\n"
//           "1. Top View: Start your journey from here.\n"
//           "2. Kumbhe Waterfall Viewpoint: 10 minutes from the starting point, offering a clear view of the waterfall. "
//           "Most photos and videos are captured from this point.\n"
//           "3. Kumbhe Waterfall Ridge View: This is the hardest point to reach. Only experienced and courageous trekkers visit here.\n\n"
//           "Location\n"
//           "Kumbhe Waterfall is located in Raigad district, just a 3 to 4-hour drive from Mumbai and Navi Mumbai. "
//           "It falls within Kumbhe village territory and is easily accessible by vehicle. "
//           "The major nearby villages are Mangaon and Nizampur.\n\n"
//           "Nearest Railway Station\n"
//           "The nearest railway station is Mangaon Railway Station, 25 km away. You can hire an auto-rickshaw for Rs. 400–600. "
//           "Note that fewer trains from Mumbai stop at Mangaon station.\n\n"
//           "How to Reach\n"
//           "From Mumbai:\n"
//           "1. By Vehicle: Follow this route - Mumbai - Panvel - Pen - Nagothane - Kolad - Kumbhe. "
//           "Distance: 145–165 km, Time: 4–5 hours.\n"
//           "2. By Train: Mangaon is the nearest station. Hire an auto-rickshaw to reach the waterfall.\n\n"
//           "From Pune:\n"
//           "1. By Vehicle: Follow this route - Pune - Kothrud - Valane - Tamhini Ghat - Vile - Nizampur - Kumbhe. "
//           "Distance: 115 km, Time: ~4 hours. "
//           "Note: No direct train route from Pune. Few state transport buses run on this route.\n\n"
//           "During the Pune route, you can spot other waterfalls in Tamhini Ghat, like the Secret Waterfall and Devkund Waterfall.\n\n"
//           "Things to Do\n"
//           "- Trekking\n"
//           "- Create memories with photos and videos\n"
//           "- Explore nature\n"
//           "- Bike ride\n"
//           "- Visit the Kumbhe Waterfall Ridge for scenic views\n\n"
//           "Hotels and Restaurants\n"
//           "There are no hotels or restaurants nearby. Plan your journey accordingly.\n\n"
//           "Best Time to Visit\n"
//           "The best time to visit Kumbhe Waterfall is from June to October.",
//       'photos': [
//         "assets/Kumbhe/kum1.jpeg",
//         "assets/Kumbhe/kum2.jpeg",
//         "assets/Kumbhe/kum3.jpeg",
//         "assets/Kumbhe/kum4.jpeg",
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
//                         "name": "Kumbhe Waterfall",
//                         "location": "Kumbhe,Raigad",
//                         "rating": 4.8,
//                         "image": "assets/kumbhe.jpeg",
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

class KumbheDetal extends StatefulWidget {
  final int index;

  const KumbheDetal({super.key, required this.index});

  @override
  State<KumbheDetal> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<KumbheDetal> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Kumbhe Waterfalls',
      'location': 'Kumbhe,Raigad',
      'rating': 4.8,
      'image': 'assets/kumbhe.jpeg',
      'about': "      Kumbhe Waterfall is one of the famous waterfalls near Mumbai and Pune city. "
          "It is located in Raigad district, Mangaon taluka, village Kumhe. "
          "Kumbhe Waterfall is so beautiful to watch, falling 178 feet above. "
          "Once you reach, you will witness the beauty of this waterfall. "
          "Kumbhe Waterfall is gaining its popularity day by day, thanks to the power of social media. "
          "Travelers are now exploring this gem of the country.\n\n"
          "We don't have access to reach the bottom side of this beautiful waterfall. "
          "Kumbhe Waterfall is surrounded by mountains on three sides. "
          "You will be on the top side of the waterfall where it falls.\n\n"
          "Kumbhe Waterfall is so famous that one scene from South superstar Thalapathy Vijay’s movie 'Varisu' was shot here.\n\n"
          "Points to Visit\n"
          "1. Top View: Start your journey from here.\n"
          "2. Kumbhe Waterfall Viewpoint: 10 minutes from the starting point, offering a clear view of the waterfall. "
          "Most photos and videos are captured from this point.\n"
          "3. Kumbhe Waterfall Ridge View: This is the hardest point to reach. Only experienced and courageous trekkers visit here.\n\n"
          "Location\n"
          "Kumbhe Waterfall is located in Raigad district, just a 3 to 4-hour drive from Mumbai and Navi Mumbai. "
          "It falls within Kumbhe village territory and is easily accessible by vehicle. "
          "The major nearby villages are Mangaon and Nizampur.\n\n"
          "Nearest Railway Station\n"
          "The nearest railway station is Mangaon Railway Station, 25 km away. You can hire an auto-rickshaw for Rs. 400–600. "
          "Note that fewer trains from Mumbai stop at Mangaon station.\n\n"
          "How to Reach\n"
          "From Mumbai:\n"
          "1. By Vehicle: Follow this route - Mumbai - Panvel - Pen - Nagothane - Kolad - Kumbhe. "
          "Distance: 145–165 km, Time: 4–5 hours.\n"
          "2. By Train: Mangaon is the nearest station. Hire an auto-rickshaw to reach the waterfall.\n\n"
          "From Pune:\n"
          "1. By Vehicle: Follow this route - Pune - Kothrud - Valane - Tamhini Ghat - Vile - Nizampur - Kumbhe. "
          "Distance: 115 km, Time: ~4 hours. "
          "Note: No direct train route from Pune. Few state transport buses run on this route.\n\n"
          "During the Pune route, you can spot other waterfalls in Tamhini Ghat, like the Secret Waterfall and Devkund Waterfall.\n\n"
          "Things to Do\n"
          "- Trekking\n"
          "- Create memories with photos and videos\n"
          "- Explore nature\n"
          "- Bike ride\n"
          "- Visit the Kumbhe Waterfall Ridge for scenic views\n\n"
          "Hotels and Restaurants\n"
          "There are no hotels or restaurants nearby. Plan your journey accordingly.\n\n"
          "Best Time to Visit\n"
          "The best time to visit Kumbhe Waterfall is from June to October.",
      'photos': [
        "assets/Kumbhe/kum1.jpeg",
        "assets/Kumbhe/kum2.jpeg",
        "assets/Kumbhe/kum3.jpeg",
        "assets/Kumbhe/kum4.jpeg",
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
