import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String password = "";

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: passwordBody(),
    );
  }

  Widget passwordBody() {
    return Stack(
      children: [
        /// 🔹 Backgrounds (UNCHANGED)
        Image.asset("asset/image/pic7.png"),
        Image.asset("asset/image/pic8.png"),

        /// 🔹 Main content (SCROLL SAFE)
        SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              const SizedBox(height: 156),

              CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  child: ClipOval(
                    child: Image.asset(
                      'asset/image/pic11.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Hello, Romina!!",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                "Type your password",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w300,
                ),
              ),

              const SizedBox(height: 15),

              /// 🔹 Password circles
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  6,
                      (index) => InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(_focusNode);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: index < password.length
                            ? const Color(0xFF004CFF)
                            : const Color(0xFFE5EBFC),
                        shape: BoxShape.circle,
                      ),
                      child: index < password.length
                          ? const Icon(
                        Icons.circle,
                        size: 10,
                        color: Colors.white,
                      )
                          : null,
                    ),
                  ),
                ),
              ),

              /// 🔹 Hidden TextField
              TextField(
                controller: _controller,
                focusNode: _focusNode,
                autofocus: false,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 6,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
                style: const TextStyle(color: Colors.transparent),
                cursorColor: Colors.transparent,
              ),

              InkWell(
                onTap: () {

                   Navigator.pushNamed(context, "/PasswordRecovery");
                  
                },
                child: const Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 30), // ✅ replaces Spacer()

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not you?",
                    style: TextStyle(
                      fontFamily: 'NunitoSans',
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        Navigator.pushNamed(context, "/HelloCard");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004CFF),
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                        elevation: 0,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
