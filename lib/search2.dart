import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sahyadri_splashes/Khandi.dart';

import 'package:sahyadri_splashes/amboli_detail.dart';
import 'package:sahyadri_splashes/bhiv_detail.dart';

import 'package:sahyadri_splashes/dudh_detail.dart';

import 'package:sahyadri_splashes/kalu_detailscreen.dart';
import 'package:sahyadri_splashes/katal_detailscreen.dart';

import 'package:sahyadri_splashes/nane_detail.dart';

import 'package:sahyadri_splashes/phop_detail.dart';

import 'package:sahyadri_splashes/ran_detail.dart';

import 'package:sahyadri_splashes/thoseghat_detail.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _WaterfallSearchPageState createState() => _WaterfallSearchPageState();
}

class _WaterfallSearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> allWaterfalls = [
    {
      "name": "Randha Waterfall",
      "location": " Ahilyanagar",
      "rating": "4.2",
      "image": "assets/Randha/randha3.webp",
    },
    {
      "name": "Thoseghar Waterfall",
      "location": "Satara",
      "rating": "4.2",
      "image": "assets/thoseghar.jpg", // Replace with actual URL
    },
    {
      "name": "Kataldhara Waterfall",
      "location": "Lonavala",
      "rating": "4.3",
      "image": "assets/kataldhara.jpeg", // Replace with actual URL
    },
    {
      "name": "Amboli Waterfall",
      "location": "Amboli",
      "rating": "4.2",
      "image": "assets/amboli.jpg", // Replace with actual URL
    },
    {
      "name": "Khandi Waterfall",
      "location": "Bendevadi, Maval",
      "rating": "4.2",
      "image": "assets/khandi.jpg", // Replace with actual URL
    },
    {
      "name": "Phopsandi Waterfall",
      "location": "Fofsandi, Akole",
      "rating": "4.1",
      "image": "assets/phopsandi.jpeg", // Replace with actual URL
    },
    {
      "name": "Dudhsagar Waterfall",
      "location": "Sonauli, Goa",
      "rating": "4.4",
      "image": "assets/dudhsagar.jpeg", // Replace with actual URL
    },
    {
      "name": "Nanemachi Waterfall",
      "location": "Mahad, Raigad",
      "rating": "4.1",
      "image": "assets/nanemachi.jpg", // Replace with actual URL
    },
    {
      "name": "Bhivpuri Waterfall",
      "location": "Bhivpuri, Ashane",
      "rating": "3.9",
      "image": "assets/bhivpuri.jpg", // Replace with actual URL
    },
    {
      "name": "Kalu Waterfall",
      "location": "Malshej Ghat,Murbad",
      "rating": "4.4",
      "image": "assets/kalu2.jpeg", // Replace with actual URL
    },
  ];

  List<Map<String, String>> filteredWaterfalls = [];

  @override
  void initState() {
    super.initState();
    filteredWaterfalls = allWaterfalls;

    _searchController.addListener(() {
      filterWaterfalls();
    });
  }

  void filterWaterfalls() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredWaterfalls = allWaterfalls.where((waterfall) {
        return waterfall["name"]!.toLowerCase().contains(query) ||
            waterfall["location"]!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Search",
            style: GoogleFonts.poppins(fontSize: 25, color: Colors.grey)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: GoogleFonts.poppins(fontSize: 20),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white70,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Breathtaking views, cascading waters—welcome to Sahyadri’s wonders.!!",
              style: GoogleFonts.poppins(
                fontSize: 25,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Recommended',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredWaterfalls.length,
                itemBuilder: (context, index) {
                  final waterfall = filteredWaterfalls[index];
                  return GestureDetector(
                    onTap: () {
                      //_navigateToDetailsPage(context, waterfall);
                      _navigateToDetailsPage1(index);
                      setState(() {});
                    },
                    child: _buildWaterfallCard(waterfall),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToDetailsPage1(int index) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const RanDetail(
                    index: 0,
                  )));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ThosegharDetail(index: 0)));
    } else if (index == 2) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => (const KatalDetailscreen(
                    index: 0,
                  ))));
    } else if (index == 3) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const AmboliDetail(
                    index: 0,
                  )));
    } else if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Khandi()));
    } else if (index == 5) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PhopDetail(
                    index: 0,
                  )));
    } else if (index == 6) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DudhDetail(
                    index: 0,
                  )));
    } else if (index == 7) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const NaneDetail(
                    index: 0,
                  )));
    } else if (index == 8) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const BhivDetail(
                    index: 0,
                  )));
    } else if (index == 9) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const KaluDetailscreen(index: 0)));
    }
  }

  Widget _buildWaterfallCard(Map<String, String> waterfall) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                waterfall["image"]!,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  waterfall["name"]!,
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    Text(waterfall["rating"]!),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  waterfall["location"]!,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
