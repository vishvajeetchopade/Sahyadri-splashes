import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TamhiniDetail extends StatefulWidget {
  final int index;

  const TamhiniDetail({super.key, required this.index});

  @override
  State<TamhiniDetail> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<TamhiniDetail> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Tamhini Waterfalls',
      'location': 'Mulshi',
      'rating': 4.8,
      'image': 'assets/tamhini.jpg',
      'about': "About Tamhini Ghat\n\n"
          "Tamhini Ghat is a mountain passage located between Mulshi and Tamhini in Maharashtra, India. "
          "Situated on the crest of the Western Ghat mountain ranges, Tamhini Ghat is famous for its picturesque surroundings, "
          "including scenic waterfalls, serene lakes, and dense woods. The best time to visit is between October and December, "
          "when the region is lush and vibrant.\n\n"
          "History:\n"
          "Tamhini Ghat was developed to provide an additional route for traffic heading to the Konkan region from Pune and Lonavala. "
          "The area originally belonged to Tata Power. This 15-kilometer ghat stretch cuts through the Sahyadri range, connecting Mulshi to Tamhini. "
          "The road is now well-maintained, making it a favorite monsoon destination. During the rainy season, the ghat transforms into "
          "a green paradise, with countless waterfalls and streams.\n\n"
          "How to Reach:\n"
          "- **By Road:** Tamhini Ghat can be accessed from Mumbai via the Mumbai-Goa Highway. After crossing the Kundalika River bridge at Kolad, "
          "take the left turn toward Pune via Mulshi Dam. The road between Kolad and Mulshi is the Tamhini Ghat stretch, adorned with "
          "lush greenery, waterfalls, and misty clouds.\n"
          "- **By Rail:** Although a railway project connecting Pimpri-Chinchwad to Kolad was proposed, it was scrapped due to the challenging terrain. "
          "Currently, there is no railway access to Tamhini Ghat.\n\n"
          "Nearby Attractions:\n"
          "1. **Mulshi Dam Backwaters:** Accessible from the ghat, offering tranquil views.\n"
          "2. **Palse Waterfall:** A popular but increasingly crowded waterfall along the route.\n"
          "3. **Kolad:** Known for river rafting on the Kundalika River.\n\n"
          "Tamhini Ghat is a perfect retreat for nature enthusiasts, with its gushing streams, velvety green landscapes, and monsoon magic.",
      'photos': [
        "assets/Tamhini/tam1.jpg",
        "assets/Tamhini/tam2.jpg",
        "assets/Tamhini/tam3.jpeg",
        "assets/Tamhini/tam4.webp",
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Access the selected waterfall using the index
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
                    onPressed: () async {
                      final Map<String, dynamic> dataToSave = {
                        "name": "Tamhini Waterfall",
                        "location": "Mulshi",
                        "rating": 4.8,
                        "image": "assets/tamhini.jpg",
                        "timestamp":
                            DateTime.now().toString(), // Optional for sorting
                      };

                      try {
                        // Save data to Firestore
                        final collectionRef = FirebaseFirestore.instance
                            .collection('bookmarked_waterfalls');
                        await collectionRef.add(dataToSave);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('Waterfall bookmarked successfully!')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error bookmarking: $e')),
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.bookmark_border,
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
                              Tab(text: "Videos"),
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
                                Center(
                                  child: Text(
                                    "Video section coming soon!",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15, color: Colors.grey),
                                  ),
                                ),
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
