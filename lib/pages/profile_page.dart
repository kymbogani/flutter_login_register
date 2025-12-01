import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State <ProfilePage> createState() =>  ProfilePageState();
}

class  ProfilePageState extends State <ProfilePage> {
   final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }
}