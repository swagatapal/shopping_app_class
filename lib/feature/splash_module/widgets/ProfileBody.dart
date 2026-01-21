import 'package:flutter/material.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          SizedBox(height: 40),
          CircleAvatar(radius: 45),
          SizedBox(height: 10),
          Text("Romina Doe",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          ListTile(title: Text("Edit Profile")),
          ListTile(title: Text("Orders")),
          ListTile(title: Text("Logout")),
        ],
      ),
    );
  }
}
