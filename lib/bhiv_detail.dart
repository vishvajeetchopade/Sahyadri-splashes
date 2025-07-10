import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BhivDetail extends StatefulWidget {
  final int index;

  const BhivDetail({super.key, required this.index});

  @override
  State<BhivDetail> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<BhivDetail> {
  final List<Map<String, dynamic>> waterfalls = [
    {
      'name': 'Bhivpuri Waterfalls',
      'location': 'Karjat, Mumbai',
      'rating': 4.8,
      'image': 'assets/bhivpuri.jpg',
      'about': "Bhivpuri Waterfalls, Karjat Overview\n\n"
          "Located around 90 km from Mumbai in Karjat, Bhivpuri Waterfalls is a stunning cascade nestled amidst lush greenery. "
          "This natural marvel is a popular destination for tourists and locals alike, offering a serene environment for families and an adventurous experience for thrill-seekers.\n\n"
          "Best Time to Visit\n"
          "The ideal time to visit Bhivpuri Waterfalls is during the monsoon months, especially between August and September, when the waterfall is at its fullest. "
          "The serene and safe waters make it a perfect spot for families to enjoy, while adventure enthusiasts can opt for waterfall rappelling to experience the falls from a unique perspective.\n\n"
          "How to Reach\n"
          "- **By Air:** The nearest airport is Chhatrapati Shivaji International Airport, located 90 km away from Bhivpuri.\n"
          "- **By Train:** Bhivpuri Road Railway Station, just 1 km away, is the closest railway station. Karjat Railway Station is also nearby, only 2 km from the falls.\n"
          "- **By Road:** Bhivpuri is well connected by road, making it easily accessible for visitors traveling by car or bus.\n"
          "- Visitors can walk to the waterfall from Bhivpuri or Karjat Railway Stations. Rickshaws are also readily available for those preferring a quick ride.\n\n"
          "Key Highlights\n"
          "- **Family-Friendly:** The calm waters offer a safe environment for families to play and relax.\n"
          "- **Adventure Activities:** Thrill-seekers can enjoy activities like waterfall rappelling.\n"
          "- **Scenic Beauty:** Surrounded by greenery, Bhivpuri Waterfalls offers breathtaking views and a tranquil atmosphere.\n\n"
          "Plan your trip to Bhivpuri Waterfalls to experience the perfect mix of nature, adventure, and relaxation!",
      'photos': [
        "assets/Bhivpuri/bhiv1.jpg",
        "assets/Bhivpuri/bhiv2.jpeg",
        "assets/Bhivpuri/bhiv3.jpeg",
        "assets/Bhivpuri/bhiv4.jpg",
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
