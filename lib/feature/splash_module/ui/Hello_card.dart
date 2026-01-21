import 'package:flutter/material.dart';

class HelloCard extends StatefulWidget {
  const HelloCard({super.key});

  @override
  State<HelloCard> createState() => _HelloCardState();
}

class _HelloCardState extends State<HelloCard> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<Map<String, dynamic>> pages = [
    {
      "image": "asset/image/pic15.png",
      "title": "Hello",
      "description":
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.\nSed non consectetur turpis.\nMorbi eu eleifend lacus.",
      "showButton": false,
    },
    {
      "image": "asset/image/pic16.png",
      "title": "Ready?",
      "description":
      "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.",
      "showButton": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset("asset/image/pic14.png"),
          ),

          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.70,
              width: MediaQuery.of(context).size.width * 0.85,
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                itemBuilder: (context, index) {
                  final page = pages[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        /// 🔹 FULL IMAGE AREA
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(25),
                            ),
                            child: Image.asset(
                              page["image"],
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover, // ✅ fills completely
                            ),
                          ),
                        ),

                        /// 🔹 TEXT AREA
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                page["title"],
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF202020),
                                ),
                              ),

                              const SizedBox(height: 10),

                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  page["description"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 19,
                                    color: Color(0xFF000000),
                                    fontFamily: 'NunitoSans',
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),

                              if (page["showButton"])
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Profile');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF004CFF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 12,
                                    ),
                                  ),
                                  child: const Text("Let's Start",style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'NunitoSans',fontSize: 22,color: Color(0xFFF3F3F3)),),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          /// DOTS
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    2, // ONLY TWO DOTS
                        (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
                            ? const Color(0xFF004CFF) // deep blue
                            : const Color(0xFFBFD3FF), // light blue
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
