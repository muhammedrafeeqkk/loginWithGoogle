import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_signing/presentation/Screen_SignBackIn.dart';
import 'package:google_signing/presentation/Screen_loginPage.dart';
import 'package:google_signing/presentation/widgets.dart';
import 'package:google_signing/services/service.dart';

import '../const/colors.dart';

class Screen_User_details extends StatelessWidget {
  final User snapshot;

  const Screen_User_details({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(172, 223, 172, 1),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Are You Sure"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("NO"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Screen_SignBackIn(),
                                        ),
                                        (route) => false);
                                  },
                                  child: Text("OK"),
                                )
                              ],
                            ),
                          );
                        },
                        icon: Icon(Icons.logout)),
                    IconButton(
                        onPressed: () async {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("Are You Sure"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("NO"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    snapshot
                                        .delete()
                                        .then((value) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage(),
                                              ),
                                            ));
                                  },
                                  child: Text("OK"),
                                )
                              ],
                            ),
                          );

                          //  await
                        },
                        icon: Icon(Icons.delete))
                  ]),
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(130),
                    child: Image.network(snapshot.photoURL ?? "")),
                SizedBox(
                  height: 30,
                ),
                DetailText(
                    title: snapshot.displayName ?? "",
                    color: Black,
                    fontweight: FontWeight.w400,
                    size: 19),
                constSizedBox7(),
                DetailText(
                    title: snapshot.email ?? "",
                    color: liteBlack,
                    fontweight: FontWeight.w400,
                    size: 15),
                constSizedBox7(),
                DetailText(
                    title: "could't find gender",
                    color: liteBlack,
                    fontweight: FontWeight.w400,
                    size: 14),
                constSizedBox7(),
                DetailText(
                    title: "could't find birthdate",
                    color: liteBlack,
                    fontweight: FontWeight.w400,
                    size: 12),
                constSizedBox7(),
                DetailText(
                    color: liteBlack,
                    title: snapshot.phoneNumber == null
                        ? "could't find contact number"
                        : snapshot.phoneNumber ?? "",
                    fontweight: FontWeight.w400,
                    size: 15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
