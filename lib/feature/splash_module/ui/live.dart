import 'package:flutter/material.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends State<Live> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: const [
            LiveImage(),
            LiveInfoRow(),
          ],
        ),
      ),
    );
  }
}

// ---------------- IMAGE ----------------
class LiveImage extends StatelessWidget {
  const LiveImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          'asset/image/pic95.png',
          height: 700,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// ---------------- INFO ROW ----------------
class LiveInfoRow extends StatelessWidget {
  const LiveInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          LiveStatus(),
          ShopButton(),
        ],
      ),
    );
  }
}

// ---------------- LIVE STATUS ----------------
class LiveStatus extends StatelessWidget {
  const LiveStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children:  [
        ViewCount(),
        SizedBox(width: 8),
        LiveBadge(),

        Transform.translate(
          offset: Offset(14, 0),
          child: Icon(Icons.play_arrow, size: 30, color: Color(0xFF004CFF)),
        ),
        Icon(Icons.play_arrow, size: 30, color: Color(0xFF004CFF)),
      ],
    );
  }
}


// ---------------- VIEW COUNT ----------------
class ViewCount extends StatelessWidget {
  const ViewCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: const Row(
        children: [
          Icon(Icons.remove_red_eye, size: 25),
          SizedBox(width: 4),
          Text('2,530',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,fontFamily: 'NunitoSans'),),
        ],
      ),
    );
  }
}

// ---------------- LIVE BADGE ----------------
class LiveBadge extends StatelessWidget {
  const LiveBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Color(0xFF08C514),
        borderRadius: BorderRadius.circular(7),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // WHITE DOT
          CircleAvatar(
            radius: 3,
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 5),
          Text(
            'Live',
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}


// ---------------- SHOP BUTTON ----------------
class ShopButton extends StatelessWidget {
  const ShopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF004CFF),
          padding: const EdgeInsets.symmetric(horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/StoryProductStyle");
        },
        child: const Text(
          'Shop',
          style: TextStyle(
            color: Color(0xFFF3F3F3),
            fontWeight: FontWeight.w300,
            fontSize: 18,
            fontFamily: "NunitoSans",
          ),
        ),
      ),
    );
  }
}

