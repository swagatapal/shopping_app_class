import 'package:flutter/material.dart';

class HelloCard extends StatefulWidget {
  const HelloCard({super.key});

  @override
  State<HelloCard> createState() => _HelloCardState();
}

class _HelloCardState extends State<HelloCard> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'asset/image/pic15.png',
    'asset/image/pic16.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: helloCardBody(),
    );
  }

  Widget helloCardBody() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset("asset/image/pic14.png"),
        ),

        Center(
          child: Container(
            height: MediaQuery.of(context).size.height*0.75,
            width: MediaQuery.of(context).size.width * 0.85,
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
              mainAxisSize: MainAxisSize.min,
              children: [

                /// IMAGE SLIDE
                ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(25)),
                  child: SizedBox(
                    height: 220,
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: images.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 TITLE CHANGES
                Text(
                  currentIndex == 1 ? 'Ready?' : 'Hello',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                /// 🔹 DESCRIPTION CHANGES
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    currentIndex == 1
                        ? 'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.'
                        : 'Lorem ipsum dolor sit amet,\n'
                        'consectetur adipiscing elit.\n'
                        'Sed non consectetur turpis.\n'
                        'Morbi eu eleifend lacus.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 BUTTON ONLY ON SECOND SCREEN
                if (currentIndex == 1)
                  ElevatedButton(
                    onPressed: () {
                     Navigator.pushNamed(context, '/Profile');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      ),
                    ),
                    child: const Text("Let's Start"),
                  ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),

        /// DOT INDICATOR
        Positioned(
          bottom: 25,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              images.length,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Colors.blue
                      : Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


