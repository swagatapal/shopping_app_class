import 'package:flutter/material.dart';

class CategoriesFilter extends StatefulWidget {
  const CategoriesFilter({super.key});

  @override
  State<CategoriesFilter> createState() => _CategoriesFilterState();
}

class _CategoriesFilterState extends State<CategoriesFilter> {
  String selectedGender = 'Female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 10),
                // ===== CUSTOM HEADER =====
                Row(
                  children: [
                    const Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF202020),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ===== YOUR EXISTING CONTENT (UNCHANGED) =====
                GenderSelector(
                  selected: selectedGender,
                  onChanged: (value) {

                      setState(() {
                        selectedGender = value;
                      });

                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView(
                    children: const [
                      CategorySection(
                        title: 'Clothing',
                        imagePath: 'asset/image/pic58.png',
                        items: [
                          'Dresses',
                          'Pants',
                          'Skirts',
                          'Shorts',
                          'Jackets',
                          'Hoodies',
                          'Shirts',
                          'Polo',
                          'T-Shirts',
                          'Tunics',
                        ],
                      ),
                      SimpleCategoryTile(
                        title: 'Shoes',
                        imagePath: 'asset/image/pic44.png',
                        items: [
                          'Sneakers',
                          'Heels',
                          'Flats',
                          'Sandals',
                          'Boots',
                          'Slippers',
                        ],
                      ),

                      SimpleCategoryTile(
                        title: 'Bags',
                        imagePath: 'asset/image/pic50.png',
                        items: [
                          'Handbags',
                          'Backpacks',
                          'Tote Bags',
                          'Clutches',
                          'Crossbody',
                        ],
                      ),

                      SimpleCategoryTile(
                        title: 'Lingerie',
                        imagePath: 'asset/image/pic53.png',
                        items: [
                          'Bras',
                          'Panties',
                          'Sleepwear',
                          'Shapewear',
                          'Nightwear',
                        ],
                      ),

                      SimpleCategoryTile(
                        title: 'Accessories',
                        imagePath: 'asset/image/pic103.png',
                        items: [
                          'Watches',
                          'Belts',
                          'Scarves',
                          'Sunglasses',
                          'Jewelry',
                        ],
                      ),

                      SizedBox(height: 12),
                      JustForYouTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );

        }
}

/* ---------------- GENDER SELECTOR ---------------- */

class GenderSelector extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const GenderSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ['All', 'Female', 'Male'].map((gender) {
        final bool isSelected = selected == gender;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: isSelected ? Color(0xFFE5EBFC) : null,
                foregroundColor: isSelected ? Color(0xFF004CFF) : Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9), // 👈 change here
                ),
              ),
              onPressed: () => onChanged(gender),
              child: Text(gender,
                style: const TextStyle(
                  fontSize: 18, // 👈 increase this value as you like
                  fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ),
          );
      }).toList(),
    );
  }
}

/* ---------------- CATEGORY SECTION (CLOTHING) ---------------- */

class CategorySection extends StatefulWidget {
  final String title;
  final List<String> items;
  final String imagePath;

  const CategorySection({
    super.key,
    required this.title,
    required this.items,
    required this.imagePath,
  });

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset(
              widget.imagePath,
              width: 40,
              height: 40,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Color(0xFF202020)),
            ),
            trailing: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
              color: isExpanded? Color(0xFF004BFE):Colors.black,
            ),
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
          ),
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: widget.items.length,
              itemBuilder: (_, index) =>
                  CategoryChip(label: widget.items[index]),
            ),
          ),
        const SizedBox(height: 8),
      ],
    );
  }
}

/* ---------------- CATEGORY CHIP ---------------- */

class CategoryChip extends StatelessWidget {
  final String label;

  const CategoryChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: Color(0xFFFFFFFF),   // 🔹 box background
        foregroundColor: Color(0xFF202020), // 🔹 text color
        side: const BorderSide(
          color: Color(0xFFFFEBEB),                  // 🔹 border color
          width: 1.5,                          // 🔹 border width
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15, // 👈 change this value
          fontWeight: FontWeight.w700,
          color: Color(0xFF202020)
        ),
      ),

    );
  }
}


/* ---------------- SIMPLE CATEGORY TILE ---------------- */
class SimpleCategoryTile extends StatefulWidget {
  final String title;
  final String imagePath;
  final List<String> items;

  const SimpleCategoryTile({
    super.key,
    required this.title,
    required this.imagePath,
    required this.items,
  });

  @override
  State<SimpleCategoryTile> createState() => _SimpleCategoryTileState();
}

class _SimpleCategoryTileState extends State<SimpleCategoryTile> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ListTile(
            leading: Image.asset(
              widget.imagePath,
              width: 40,
              height: 40,
            ),
            title: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: Color(0xFF202020),
              ),
            ),
            trailing: Icon(
              expanded
                  ? Icons.keyboard_arrow_up
                  : Icons.keyboard_arrow_down,
            ),
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
          ),
        ),

        if (expanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3.2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: widget.items.length,
              itemBuilder: (_, index) =>
                  CategoryChip(label: widget.items[index]),
            ),
          ),

        const SizedBox(height: 8),
      ],
    );
  }
}


/* ---------------- JUST FOR YOU ---------------- */

class JustForYouTile extends StatelessWidget {
  const JustForYouTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(
          'asset/image/pic95.png',
          width: 40,
          height: 40,
        ),
        title: const Text(
          'Just for You ⭐',
          style: TextStyle(fontWeight: FontWeight.w700,fontSize: 17,color: Color(0xFF202020)),
        ),
        // ➡️ arrow inside blue round container
        trailing: Container(
          width: 32,
          height: 32,
          decoration: const BoxDecoration(
            color: Color(0xFF004CFF),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 18,
          ),
        ),
        onTap: () {
          debugPrint('Just for You tapped');
        },
      ),

    );
  }
}

/* ---------------- OTHER SCREENS ---------------- */

class MaleCategoriesScreen extends StatelessWidget {
  const MaleCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Male categories screen')),
    );
  }
}

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('All categories screen')),
    );
  }
}
