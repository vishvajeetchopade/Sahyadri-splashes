import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Khandi(),
    );
  }
}

class Khandi extends StatefulWidget {
  const Khandi({super.key});
  @override
  State createState() => _SahyadriSplashesState2();
}

class _SahyadriSplashesState2 extends State with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Stack(
        children: [
          // Top Image Section
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/khandi.jpg'),
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
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  // Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      )),
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
                      "Khandi Waterfall",
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
                          "Khandi,Maval",
                          style: GoogleFonts.poppins(color: Colors.grey),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    // Rating Section
                    const Row(children: [
                      Text(
                        "4.8",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.star,
                        color: Color(0xFFEE684A),
                      ),
                    ]),
                    const SizedBox(height: 16),
                    // Tab Section
                    Container(
                        child: Align(
                      alignment: Alignment.center,
                      child: TabBar(
                        labelPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        controller: tabController,
                        isScrollable: true,
                        tabs: const [
                          Tab(
                            text: "About",
                          ),
                          Tab(text: "Videos"),
                          Tab(text: "Photo"),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 230,
                      width: double.maxFinite,
                      child: TabBarView(controller: tabController, children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Waterfalls in Khandi, Maharashtra\n\n"
                                "Khandi, an area near Pune, Maharashtra, is known for its many beautiful waterfalls, including:\n\n"
                                "- **Jagtap Waterfall**: A family-friendly waterfall located on the old Mumbai-Pune highway. "
                                "It has an entry fee and makeshift washrooms. It is recommended to visit during the peak monsoon, on a weekday, "
                                "or when it's raining heavily.\n\n"
                                "- **Bendewadi Waterfall**: A large waterfall with a small dam and a parking area. It is an excellent place to visit during the monsoon. "
                                "There's a man-made pond below the waterfall where you can bathe, and a nearby dhaba offers food.\n\n"
                                "- **Thokarwadi Waterfall**: Another famous waterfall in Khandi.\n\n"
                                "- **Lalwadi Waterfall**: A popular waterfall in the Khandi area.\n\n"
                                "- **Milky Waterfalls**: Other stunning waterfalls in the region.\n\n"
                                "Tips for Visiting the Waterfalls in Khandi:\n\n"
                                "1. The area is close to Pune and has good roads, making it easy to access.\n"
                                "2. The monsoon season is considered the best time to visit.\n"
                                "3. The road from Kanhe to Khandi is dotted with waterfalls, some high and some low, offering scenic views along the way.\n"
                                "4. It is recommended to bring your own vehicle, as local transport options are limited and not very comfortable.",
                                style: GoogleFonts.poppins(
                                    fontSize: 15, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        //videos_Section
                        const Text("Videos"),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 180,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/Khandi/kha1.jpg"),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 180,
                                      height: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  "assets/Khandi/kha2.jpeg"),
                                              fit: BoxFit.cover)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/Khandi/kha3.jpeg"),
                                          fit: BoxFit.cover)),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: 400,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/Khandi/kha4.jpeg"),
                                          fit: BoxFit.cover)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
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

class TabButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const TabButton({super.key, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        color: isActive ? Colors.black : Colors.grey,
      ),
    );
  }
}
