import 'package:flutter/material.dart';

class PasswordRecoveryCode extends StatefulWidget {
  const PasswordRecoveryCode({super.key});

  @override
  State<PasswordRecoveryCode> createState() => _PasswordRecoveryCodeState();
}

class _PasswordRecoveryCodeState extends State<PasswordRecoveryCode> {
  final TextEditingController otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

  static const int otpLength = 4;
  int resendAttempts = 0;
  static const int maxAttempts = 4;

  @override
  void dispose() {
    otpController.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          /// 🔵 Background circles
          Positioned(
            top: -140,
            left: -120,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF0D47FF),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -40,
            left: -40,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: const Color(0xFF0D47FF).withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 120),

                  /// 👤 Avatar
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: const Color(0xFFFFB6D9),
                      child: ClipOval(
                        child: Image.asset(
                          'asset/image/pic11.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Password Recovery",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Enter 4-digits code we sent you\non your phone number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "+98*******00",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'NunitoSans',
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// 🔢 OTP dots (tap → keyboard opens)
                  GestureDetector(
                    onTapDown: (_) {
                      _otpFocusNode.requestFocus();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(otpLength, (index) {
                        final isFilled = index < otpController.text.length;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: isFilled
                                ? const Color(0xFF0D47FF)
                                : const Color(0xFFE0E7FF),
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                  ),

                  const SizedBox(height: 48),

                  /// ⌨️ Hidden TextField (NO autofocus)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextField(
                      controller: otpController,
                      focusNode: _otpFocusNode,
                      autofocus: false,
                      maxLength: otpLength,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: const TextStyle(color: Colors.transparent),
                      cursorColor: Colors.transparent,
                      decoration: const InputDecoration(
                        counterText: "",
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {});
                        if (value.length == otpLength) {
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(
                              context, '/NewPasswordScreen');
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// 🔴 Send Again
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        resendAttempts++;
                      });

                      if (resendAttempts >= maxAttempts) {
                        _showMaxAttemptDialog(context);
                      }
                    },
                    child: Container(
                      width: 201,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF5790),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "Send Again",
                        style: TextStyle(
                          color: Color(0xFFF3F3F3),
                          fontWeight: FontWeight.w300,
                          fontFamily: 'NunitoSans',
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// ❌ Cancel
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        color: Color(0xFF202020),
                        fontSize: 15,
                        fontFamily: 'NunitoSans',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔴 Alert after max resend attempts
  void _showMaxAttemptDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("Too many attempts"),
          content: const Text(
            "You reached the maximum number of resend attempts.\nPlease try again later.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
