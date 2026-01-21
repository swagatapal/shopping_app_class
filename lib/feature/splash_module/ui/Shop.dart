import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopping_app/feature/splash_module/widgets/Categories_Section.dart';
import 'package:shopping_app/feature/splash_module/widgets/Flash_Sale.dart';
import 'package:shopping_app/feature/splash_module/widgets/Just_for_you.dart';
import 'package:shopping_app/feature/splash_module/widgets/MostPopular_Section.dart';
import 'package:shopping_app/feature/splash_module/widgets/New_items_Section.dart';
import 'package:shopping_app/feature/splash_module/widgets/Top_product.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final ImagePicker _picker = ImagePicker();

  Future<void> openCamera() async {
    await _picker.pickImage(source: ImageSource.camera);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔝 SHOP TITLE + SEARCH BAR
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    const Text(
                      "Shop",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),

                    /// SEARCH FIELD
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: openCamera,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          contentPadding: const EdgeInsets.symmetric(vertical: -15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🟡 BIG SALE BANNER
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Stack(
                    children: [
                      Image.asset(
                        "asset/image/pic69.jpg", // your banner image
                      ),

                      /// TEXT OVER IMAGE
                      Positioned(
                        left: 13,
                        top: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Big Sale",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "Up to 50%",
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(height: 30),
                            Text(
                                "Happening\nNow",
                                style: TextStyle(color: Color(0xFFFFFFFF),fontSize: 11,fontWeight: FontWeight.w700),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// 🔵 SLIDER INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildDot(true),
                  buildDot(false),
                  buildDot(false),
                  buildDot(false),
                ],
              ),

              const SizedBox(height: 20),

              /// ⬇️ BELOW THIS YOU WILL ADD YOUR OWN WIDGETS
              CategoriesSection(),
              TopProductsSection(),
              NewItemsSection(),
              FlashSaleSection(),
              MostPopularSection(),
              JustForYouSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔵 DOT WIDGET
  Widget buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 37 : 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF0042e0) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
