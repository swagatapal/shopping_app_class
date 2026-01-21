import 'package:flutter/material.dart';

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 TOP ROW
          Row(
            children: [
              // Profile Image
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('asset/image/pic17.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 15),

              // My Activity
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: const Text("My Activity")),
                        body: const Center(child: Text("My Activity Screen")),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF004CFF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text(
                    "My Activity",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),

              const Spacer(),

              // Voucher Icon
              _iconCircle(
                icon: Icons.card_giftcard,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: const Text("Voucher")),
                        body: const Center(child: Text("Voucher Screen")),
                      ),
                    ),
                  );
                },
              ),

              // Message Icon
              _iconCircle(
                icon: Icons.message_outlined,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: const Text("Messages")),
                        body: const Center(child: Text("Message Screen")),
                      ),
                    ),
                  );
                },
              ),

              // Settings Icon
              _iconCircle(
                icon: Icons.settings,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: const Text("Settings")),
                        body: const Center(child: Text("Settings Screen")),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Greeting
          const Text(
            "Hello, Romina!",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,color: Color(0xFF202020)),
          ),

          const SizedBox(height: 16),

          /// 🔹 ANNOUNCEMENT CARD
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Color(0xFFF8F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Announcement",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 14,),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n"
                            "Maecenas hendrerit luctus libero ac vulputate.",
                        style: TextStyle(color: Color(0xFF000000), fontSize: 10,fontFamily: 'NunitoSans'),
                      ),
                    ],
                  ),
                ),

                // Arrow Button
                GestureDetector(
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Color(0xFF0C54FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFFFFFFF),
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 ICON CIRCLE (helper method, NOT a widget class)
  Widget _iconCircle({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }
}


