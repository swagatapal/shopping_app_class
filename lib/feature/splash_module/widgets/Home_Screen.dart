import 'package:flutter/material.dart';

import 'Categories_Section.dart';
import 'Flash_Sale_Section.dart';
import 'Just_for_you.dart';
import 'MostPopular_Section.dart';
import 'My_Order_Section.dart';
import 'New_items_Section.dart';
import 'Recently_Viewed.dart';
import 'Stories_Section.dart';
import 'Top_Header.dart';
import 'Top_product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children:  [
            TopHeader(),
            RecentlyViewedSection(),
            MyOrdersSection(),
            StoriesSection(),
            NewItemsSection(),
            MostPopularSection(),
            CategoriesSection(
              onTap: (){
               Navigator.pushNamed(context, "/Shop");
              },
            ),
            FlashSaleSection(),
            TopProductsSection(),
            JustForYouSection(),
          ],
        ),
      ),
    );
  }
}
