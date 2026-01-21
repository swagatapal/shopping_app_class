import 'dart:async';
import 'package:flutter/material.dart';

class FlashSaleSection extends StatefulWidget {
  const FlashSaleSection({super.key});

  @override
  State<FlashSaleSection> createState() => _FlashSaleSectionState();
}

class _FlashSaleSectionState extends State<FlashSaleSection> {
  late Timer _timer;
  Duration _duration = const Duration(hours: 0, minutes: 36, seconds: 58);

  final List<String> images = [
    'asset/image/pic56.png',
    'asset/image/pic57.png',
    'asset/image/pic58.png',
    'asset/image/pic59.png',
    'asset/image/pic60.png',
    'asset/image/pic61.png',
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          _duration -= const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = twoDigits(_duration.inHours);
    final minutes = twoDigits(_duration.inMinutes.remainder(60));
    final seconds = twoDigits(_duration.inSeconds.remainder(60));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // 🔹 FLASH SALE HEADER (TAPPABLE)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/FlashSaleFullprofile");
            },
            child: Row(
              children: [
                const Text(
                  "Flash Sale",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.timer, color: Colors.blue, size: 20),
                const SizedBox(width: 6),
                _timeBox(hours),
                const Text(" : "),
                _timeBox(minutes),
                const Text(" : "),
                _timeBox(seconds),
                const SizedBox(width: 6),
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // 🔹 GRID ITEMS
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ImageZoomScreen(imagePath: images[index]),
                    ),
                  );
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "-20%",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _timeBox(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

/// 🔹 FLASH SALE FULL PAGE (Dummy Screen)
class FlashSaleAllProductsScreen extends StatelessWidget {
  const FlashSaleAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flash Sale")),
      body: const Center(
        child: Text("All Flash Sale Products"),
      ),
    );
  }
}

/// 🔹 ZOOM IMAGE SCREEN
class ImageZoomScreen extends StatelessWidget {
  final String imagePath;
  const ImageZoomScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: InteractiveViewer(
        minScale: 1.0,
        maxScale: 4.0,
        child: Center(
          child: Image.asset(imagePath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
