import 'package:flutter/material.dart';

class PasswordRecoveryCode extends StatefulWidget {
  const PasswordRecoveryCode({super.key});

  @override
  State<PasswordRecoveryCode> createState() => _PasswordRecoveryCodeState();
}

class _PasswordRecoveryCodeState extends State<PasswordRecoveryCode> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: passwordRecoveryWidget(),
    );
  }

  // 🔹 Main Widget
  Widget passwordRecoveryWidget() {
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
        const SizedBox(height: 20),

        // 🔐 Title
        const Text(
          "Password Recovery",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 8),

        const Text(
          "Enter 4-digits code we sent you\non your phone number",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 12),

        const Text(
          "+98*******00",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,fontFamily: 'NunitoSans'),
        ),

        const SizedBox(height: 20),

        // 🔢 OTP DOT INPUT (LIKE IMAGE)
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(_otpFocusNode);
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: otpController.text.length > index
                          ? const Color(0xFF0D47FF)
                          : Colors.grey.shade300,
                    ),
                  );
                }),
              ),

              // 🔒 Hidden TextField
              SizedBox(
                height: 0,
                width: 0,
                child: TextField(
                  controller: otpController,
                  focusNode: _otpFocusNode,
                  maxLength: 4,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    counterText: "",
                    border: InputBorder.none,
                  ),
                  onChanged: (_) {
                    setState(() {});
                  },
                  onSubmitted: (value) {
                    if (value.length == 4) {
                      Navigator.pushNamed(
                          context, '/NewPasswordScreen');
                    }
                  },
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 200,),

        // 🔴 Send Again
        Container(
          width: 201,
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xFFFF5790),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "Send Again",
            style: TextStyle(
              color: Color(0xFFf3f3f3),
              fontWeight: FontWeight.w300,
              fontFamily: 'NunitoSans',
              fontSize: 22
            ),
          ),
        ),

        const SizedBox(height: 15),

        Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Color(0xFF202020),
                  fontSize: 15,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),

      ],
    );
  }
}


