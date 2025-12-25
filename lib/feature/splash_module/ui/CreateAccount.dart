import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: createAccountWidget(context),
    );
  }
}
Widget createAccountWidget(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),

          /// Title
          const Text(
            "Create\nAccount",
            style: TextStyle(
              fontFamily: 'Raleway',
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202020),
            ),
          ),

          const SizedBox(height: 30),

          /// Camera Icon
          Center(
            child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFF004CFF),
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Image.asset(
                  "asset/image/pic3.png", // your asset
                  height: 30,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          /// Input Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF004CFF)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [

                /// Email
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                  ),
                ),

                const Divider(),

                /// Password
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),

                const Divider(),

                /// Phone Number
                Row(
                  children: [
                    Image.network(
                      "https://flagcdn.com/w40/gb.png",
                      width: 30,
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.keyboard_arrow_down),
                    const SizedBox(width: 8),
                    Container(
                      height: 25,
                      width: 1,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: "Your number",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          /// Done Button
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF004CFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Done",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFF3F3F3),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// Cancel
          const Center(
            child: Text(
              "Cancel",
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xFF202020),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

