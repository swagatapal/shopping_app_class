import 'package:flutter/material.dart';

class StoryProductStyle extends StatefulWidget {
  const StoryProductStyle({super.key});

  @override
  State<StoryProductStyle> createState() => _StoryProductStyleState();
}

class _StoryProductStyleState extends State<StoryProductStyle> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentIndex = index);
                },
                children: const [
                  FirstStoryPopupScreen(), // POPUP ONLY HERE
                  NormalStoryScreen(image: 'asset/image/screen2.png'),
                  SaleStoryScreen(),
                  BottomPopupStoryScreen(image: 'asset/image/screen4.png'),
                ],
              ),
            ),
            StoryDotsIndicator(currentIndex: _currentIndex),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// DOTS INDICATOR
////////////////////////////////////////////////////////////

class StoryDotsIndicator extends StatelessWidget {
  final int currentIndex;
  const StoryDotsIndicator({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 6,
          width: currentIndex == index ? 22 : 6,
          decoration: BoxDecoration(
            color:
            currentIndex == index ? Colors.blue : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}

////////////////////////////////////////////////////////////
/// FIRST STORY SCREEN (TAGGED PRODUCT STYLE)
////////////////////////////////////////////////////////////
class FirstStoryPopupScreen extends StatelessWidget {
  const FirstStoryPopupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // BACKGROUND IMAGE
            Positioned.fill(
              child: Image.asset(
                'asset/image/pic98.png',
                fit: BoxFit.cover,
              ),
            ),

            // IMAGE PRODUCT DOT (LEFT)
            const Positioned(
              left: 30,
              top: 290,
              child: ProductDot(),
            ),

            // POPUP CARD
            Positioned(
              bottom: 50,
              left: 100,
              right: 100,
              child: Stack(
                clipBehavior: Clip.none,
                children: const [
                  ProductPopupCard(),

                  // DOT ON POPUP (TOP CENTER)
                  Positioned(
                    bottom: 178,
                    left: 134,
                    child: Center(child: ProductDot()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// BLUE PRODUCT DOT
////////////////////////////////////////////////////////////

class ProductDot extends StatelessWidget {
  const ProductDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Color(0xFF004CFF),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// POPUP CARD (SMALL & CENTERED)
////////////////////////////////////////////////////////////
class ProductPopupCard extends StatelessWidget {
  const ProductPopupCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(12),
          constraints: const BoxConstraints(
            minHeight: 190, // ⬅ increases popup height ONLY
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // ⬅ spreads content
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'asset/image/pic97.png',
                  height: 120, // ⬅ image size unchanged
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(
                width: double.infinity,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004CFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    'Shop',
                    style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'NunitoSans',color: Color(0xFFF3F3F3),fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// SECOND SCREEN (TEXT + SHOP IN SAME ROW)
////////////////////////////////////////////////////////////

class NormalStoryScreen extends StatelessWidget {
  final String image;
  const NormalStoryScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "asset/image/pic99.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔽 TEXT + SHOP BUTTON IN SAME ROW
          Row(
            children: [
              SizedBox(width: 35),
              const Expanded(
                child: Text(
                  'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit.',
                  style: TextStyle(fontSize: 12,fontFamily: "NunitoSans",color: Color(0xFF000000),fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 36,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF004CFF),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    'Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'NunitoSans',
                      color: Color(0xFFF3F3F3),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


////////////////////////////////////////////////////////////
/// THIRD SCREEN (SALE)
////////////////////////////////////////////////////////////

class SaleStoryScreen extends StatelessWidget {
  const SaleStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          // TOP IMAGE
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                'asset/image/pic100.png',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          // SALE CARD
          SizedBox(
            height: 140,
            width: double.infinity,
            child: ClipRRect( // ⬅ ensures rounded edges for whole card
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Background image
                  Image.asset(
                    "asset/image/pic94.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),

                  // Foreground model image (rounded properly)
                  Positioned(
                    right: -9,
                    top: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "asset/image/pic92.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Text
                  Positioned(
                    left: 16,
                    top: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Big Sale",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Up to 50%",
                          style: TextStyle(
                            fontFamily: 'NunitoSans',
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Happening Now (NO BLUE BACKGROUND)
                  const Positioned(
                    left: 16,
                    bottom: 16,
                    child: Text(
                      "Happening Now",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // TEXT + SHOP BUTTON ROW
          Row(
            children: [
              SizedBox(width: 20),
              const Expanded(
                child: Text(
                  'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "NunitoSans",
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                height: 36,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF004CFF),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: const Text(
                    'Shop',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'NunitoSans',
                      color: Color(0xFFF3F3F3),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}



////////////////////////////////////////////////////////////
/// FOURTH SCREEN (BOTTOM CARD)
////////////////////////////////////////////////////////////

class BottomPopupStoryScreen extends StatelessWidget {
  final String image;
  const BottomPopupStoryScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          // BACKGROUND IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "asset/image/pic101.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // BOTTOM POPUP CARD
          Positioned(
            bottom: 25,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // LEFT PRODUCT IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'asset/image/pic102.png',
                      height: 105,
                      width: 105,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 30),

                  // TEXT + BUTTON (COLUMN)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lorem ipsum dolor sit amet consectetur.',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'NunitoSans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 35),

                        // SHOP BUTTON (below text)
                        SizedBox(
                          height: 34,
                          child: ElevatedButton(
                            onPressed: () {

                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF004CFF),
                              padding: const EdgeInsets.symmetric(horizontal: 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
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
          ),
        ],
      ),
    );
  }
}


////////////////////////////////////////////////////////////
/// SHOP BUTTON (REUSABLE)
////////////////////////////////////////////////////////////

class StoryShopButton extends StatelessWidget {
  const StoryShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {},
      child: const Text(
        'Shop',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
