import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThosegharDetail extends StatefulWidget {
  final int index;

  const ThosegharDetail({super.key, required this.index});

  @override
  State<ThosegharDetail> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<ThosegharDetail> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Thoseghar Waterfalls',
      'location': 'Satara',
      'rating': 4.8,
      'image': 'assets/thoseghar.jpg',
      'about': "Thoseghar Waterfalls Overview\n\n"
          "Thoseghar Waterfalls is a scenic spot located near the small village of Thoseghar, "
          "20 km from Satara city, at the edge of the Konkan region in Western India. "
          "There are a series of waterfalls, some of them 15 to 20 meters and one approximately 200 meters in height. "
          "People come from all over Maharashtra to visit the area, especially during the rainy or monsoon season, from July to November. "
          "During the monsoon, heavy rains increase the water flow, making the falls even more spectacular.\n\n"
          "Description\n"
          "The area is calm and quiet, surrounded by a clean lake and dark woods in a hilly region. "
          "A newly constructed platform provides a good view of the waterfall. Visitors can enter the valley for a closer look, "
          "but it is not safe to do so during heavy rainfall. The site is also a great spot for bird watching.\n\n"
          "Transport Connectivity\n"
          "Thoseghar Waterfalls can be reached by public transport or private vehicle. "
          "Regular buses run from Swargate (Pune to Satara), and there are buses or rickshaws available from Satara. "
          "For the best view, visit Chalkewadi where vehicles can be parked at a newly designated parking lot, "
          "and a 0.5 km walk along a paved road leads to the waterfall.\n",
      'photos': [
        "assets/Thoseghar/tho1.jpg",
        "assets/Thoseghar/tho2.jpg",
        "assets/Thoseghar/tho3.jpg",
        "assets/Thoseghar/tho4.jpg"
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
                        "name": "Thoseghar Waterfall",
                        "location": "Satara",
                        "rating": 4.8,
                        "image": "assets/thoseghar.jpg",
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
