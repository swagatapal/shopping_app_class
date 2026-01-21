import 'package:flutter/material.dart';

/// ================= MY ORDERS SECTION =================
class MyOrdersSection extends StatefulWidget {
  const MyOrdersSection({super.key});

  @override
  State<MyOrdersSection> createState() => _MyOrdersSectionState();
}

class _MyOrdersSectionState extends State<MyOrdersSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "My Orders",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202020)
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              _orderChip(
                text: "To Pay",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ToPayScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(width: 10),

              Stack(
                children: [
                  _orderChip(
                    text: "To Receive",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ToReceiveScreen(),
                        ),
                      );
                    },
                  ),

                  // Green notification dot
                  Positioned(
                    top: 1,
                    right: 2,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        color: Color(0xFF08C514),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 10),

              _orderChip(
                text: "To Review",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ToReviewScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _orderChip({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
          color: const Color(0xFFE5EBFC),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xFF0042E0),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// ================= TO PAY SCREEN =================
class ToPayScreen extends StatefulWidget {
  const ToPayScreen({super.key});

  @override
  State<ToPayScreen> createState() => _ToPayScreenState();
}

class _ToPayScreenState extends State<ToPayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Pay")),
      body: const Center(
        child: Text(
          "To Pay Orders Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// ================= TO RECEIVE SCREEN =================
class ToReceiveScreen extends StatefulWidget {
  const ToReceiveScreen({super.key});

  @override
  State<ToReceiveScreen> createState() => _ToReceiveScreenState();
}

class _ToReceiveScreenState extends State<ToReceiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Receive")),
      body: const Center(
        child: Text(
          "To Receive Orders Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

/// ================= TO REVIEW SCREEN =================
class ToReviewScreen extends StatefulWidget {
  const ToReviewScreen({super.key});

  @override
  State<ToReviewScreen> createState() => _ToReviewScreenState();
}

class _ToReviewScreenState extends State<ToReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Review")),
      body: const Center(
        child: Text(
          "To Review Orders Screen",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
