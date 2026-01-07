import 'package:flutter/material.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  bool isSmsSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: passwordRecoveryWidget(context),
    );
  }

  /// =======================================================
  /// 🔹 SEPARATE WIDGET FUNCTION (LIKE startWidget)
  /// =======================================================
  Widget passwordRecoveryWidget(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "asset/image/pic12.png",
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                "asset/image/pic13.png",
              ),
            ),
          ],
        ),

        /// ❗ CircleAvatar part UNCHANGED
        CircleAvatar(
          radius: 55, // outer size
          backgroundColor: Color(0xFFFFFFFF), // white ring
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 60, // inner circle
            child: ClipOval(
              child: Image.asset(
                'asset/image/pic11.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 15),

        /// Title
        const Text(
          "Password Recovery",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 5),

        /// Subtitle
        const Text(
          "How you would like to restore\nyour password?",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 30),

        /// SMS option
        optionTile(
          title: "SMS",
          isSelected: isSmsSelected,
          onTap: () {
            setState(() {
              isSmsSelected = true;
            });
          },
        ),

        const SizedBox(height: 15),

        /// Email option
        optionTile(
          title: "Email",
          isSelected: !isSmsSelected,
          onTap: () {
            setState(() {
              isSmsSelected = false;
            });
          },
        ),

        SizedBox(height: 175),

        /// Next button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1),
          child: SizedBox(
            width: 335,
            height: 61,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/PasswordRecoveryCode");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004CFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(116),
                ),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFFF3F3F3),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// Cancel
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.grey),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  /// =======================================================
  /// 🔹 OPTION TILE (ONLY ROW MODIFIED)
  /// =======================================================
  Widget optionTile({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 90),
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFFE8F0FF)
              : const Color(0xFFFFEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// SMS / Email text (FIXED)
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF004CFF)
                    : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),

            /// 👈 ONLY CHANGE
              SizedBox(width: 40,),
            /// Checkbox
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? const Color(0xFF004CFF)
                    : Colors.transparent,
                border: Border.all(
                  color: isSelected
                      ? const Color(0xFF004CFF)
                      : Colors.grey,
                ),
              ),
              child: isSelected
                  ? const Icon(
                Icons.check,
                size: 12,
                color: Colors.white,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}



