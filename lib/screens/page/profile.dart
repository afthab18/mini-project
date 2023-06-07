import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../welcome_screen.dart';



  
  final String? userName = FirebaseAuth.instance.currentUser?.displayName;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Profile')),
      //body:

      //const Center(
      // child: Text('profile', style: TextStyle(fontSize: 40)),
      appBar: AppBar(
        title: const Text(" Homepage"),
      ),
      body: Column(
        children: [
          Text("Hello $userName"),
          ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                if (!mounted) return;
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomeScreen();
                }));
              },
              child: const Text("Sign Out"))
        ],
      ),
    );
    // );
  }
}
