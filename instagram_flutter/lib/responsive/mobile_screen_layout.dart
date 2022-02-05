import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:instagram_flutter/providers/user_provider.dart';
// import 'package:instagram_flutter/utils/colors.dart';
// import 'package:provider/provider.dart';
// import 'package:instagram_flutter/models/user.dart'as model;

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  // final FirebaseAuth _auth =FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    // final UserProvider? user = Provider.of<UserProvider>(context);
    // model.User? user=Provider.of<UserProvider>(context).getUser;
    // return user==null? const Center(child: CircularProgressIndicator(color: primaryColor,),):const Scaffold(
    //     body: Center(
    //   child: Text(''),
    // ));
    return const Scaffold(
      body: Center(child: Text("s")),
    );
  }

}
