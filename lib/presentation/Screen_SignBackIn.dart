import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_signing/const/colors.dart';
import 'package:google_signing/presentation/Screen_UserDetails.dart';
import 'package:google_signing/presentation/widgets.dart';
import 'package:google_signing/services/service.dart';

class Screen_SignBackIn extends StatelessWidget {
  const Screen_SignBackIn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: SkyBlack,
              ),
              height: screenwidth * 0.1,
              width: screenwidth * 0.8,
              child: const Center(child: Text("Successfully Logout")),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await FireBase_Services().userSignIn();
                    final snapshot = await FirebaseAuth.instance.currentUser!;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Screen_User_details(snapshot: snapshot),
                        ));
                  },
                  child: googleIcon(screenHeight, screenwidth),
                ),
                const Text("Tap to Sign back in")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
