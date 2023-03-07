import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_signing/presentation/widgets.dart';
import 'package:google_signing/services/service.dart';

import 'Screen_UserDetails.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
   // final ? email= FirebaseAuth.instance.currentUser!.phoneNumber;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await FireBase_Services().userSignIn();
                final snapshot= await FirebaseAuth.instance.currentUser!;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen_User_details(snapshot: snapshot ),
                    ));
              },
              child: googleIcon(screenHeight, screenwidth),
            ),
            Text("Tap to login")
          ],
        ),
      ),
    );
  }
}
