import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/MostPopular_Section.dart';

/// ================= PRODUCT MODEL =================
class Product {
  final String image;
  final String title;
  final String price;
  final String oldPrice;
  final String discount;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discount,
  });
}

class FlashSaleFullprofile extends StatefulWidget {
  const FlashSaleFullprofile({super.key});

  @override
  State<FlashSaleFullprofile> createState() => _FlashSaleFullprofileState();
}

class _FlashSaleFullprofileState extends State<FlashSaleFullprofile> {
  int selectedIndex = 2;

  Duration duration = const Duration(hours: 0, minutes: 36, seconds: 58);
  Timer? timer;

  /// MAIN PRODUCTS (FIRST GRID – 4 ITEMS)
  final List<Product> products = [
    Product(
      image: "asset/image/pic86.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic87.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic88.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic89.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic90.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic91.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
  ];

  /// SHOES GRID DATA
  final List<Product> shoesProducts = [
    Product(
      image: "asset/image/pic44.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic45.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic46.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
    Product(
      image: "asset/image/pic47.png",
      title: "Lorem ipsum dolor sit amet consectetur",
      price: "\$16,00",
      oldPrice: "\$20,00",
      discount: "-20%",
    ),
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (duration.inSeconds > 0) {
          duration -= const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            flashSaleHeader(),
            articleSection(),
            discountTitle(),
            /// FIRST GRID (4 ITEMS)
            productGrid(),
            /// BIG SALE BANNER
            bigSaleBanner(),
            /// SHOES GRID
            shoesGrid(),
            /// MOST POPULAR (YOUR EXISTING WIDGET)
            mostPopularSection(),
          ],
        ),
      ),
    );
  }

  // ================= HEADER =================
  Widget flashSaleHeader() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 74,
          right: 0,
          child: Image.asset("asset/image/pic83.png"),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Image.asset("asset/image/pic84.png"),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 50, 16, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerTopRow(),
              const SizedBox(height: 18),
              discountSelector(),
            ],
          ),
        ),
      ],
    );
  }

  Widget headerTopRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Flash Sale",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text("Choose Your Discount"),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.timer, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            timerBox(format(duration.inHours)),
            colon(),
            timerBox(format(duration.inMinutes % 60)),
            colon(),
            timerBox(format(duration.inSeconds % 60)),
          ],
        ),
      ],
    );
  }

  Widget discountSelector() {
    final discounts = ["All", "10%", "20%", "30%", "40%", "50%"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(discounts.length, (index) {
        final isSelected = selectedIndex == index;

        return GestureDetector(
          onTap: () => setState(() => selectedIndex = index),
          child: Container(
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              discounts[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }

  // ================= ARTICLE =================
  Widget articleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                "asset/image/pic85.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Live Clicked")),
                  );
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Live",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget discountTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "20% Discount",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () {
              // filter action here
            },
          ),
        ],
      ),
    );
  }


  // ================= FIRST GRID =================
  Widget productGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Expanded(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (_, i) => productCard(products[i]),
        ),
      ),
    );
  }

  // ================= BIG SALE =================
  Widget bigSaleBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Background
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "asset/image/pic94.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            // Foreground model image
            Positioned(
              right: -10,
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
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text("Up to 50%",style: TextStyle(fontFamily: 'NunitoSans',fontSize: 12,fontWeight: FontWeight.w700,color: Color(0xFF202020)),),
                ],
              ),
            ),

            // Button
            Positioned(
              left: 16,
              bottom: 0,
              child: Text(
                "Happening \n Now",
                style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }


  // ================= SHOES GRID =================
  Widget shoesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: shoesProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.72,
        ),
        itemBuilder: (_, i) => productCard(shoesProducts[i]),
      ),
    );
  }

  /// CALL YOUR EXISTING MOST POPULAR WIDGET
  Widget mostPopularSection() {
    return MostPopularSection(); // <-- replace with your widget call
  }

  Widget productCard(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 155, // ✅ SAME HEIGHT FOR ALL IMAGES
          width: double.infinity,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    product.discount,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 6),
        Text(product.title, maxLines: 2),
        Row(
          children: [
            Text(product.price,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 6),
            Text(product.oldPrice,
                style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  Widget timerBox(String value) => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(6)),
    child: Text(value),
  );

  Widget colon() =>
      const Padding(padding: EdgeInsets.symmetric(horizontal: 4), child: Text(":"));

  String format(int n) => n.toString().padLeft(2, '0');
}
