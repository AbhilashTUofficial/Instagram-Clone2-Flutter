import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/models/user.dart' as model;
import 'package:instagram_flutter/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;



  // Future<model.User>getUserDetails()async{
  //   User currentUser=_auth.currentUser!;
  //
  //   DocumentSnapshot snap =await _firestore.collection("users").doc(currentUser.uid).get();
  //
  //   return model.User.fromSnap(snap);
  // }


  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "error occurred";
    try {
      if (email.isNotEmpty ||
          username.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        // Register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // uploading dp

        String photoUrl = await StorageMethods()
            .uploadImageToStorage("profilePics", file, false);

        // Add user to database
        model.LocalUser user = model.LocalUser(
          username: username,
          email: email,
          bio: bio,
          photoUrl: photoUrl,
          uid: cred.user!.uid,
          followers: [],
          following: [],
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        res = 'success';

        // await _firestore.collection('users').add({
        //   'username':username,
        //   'email':email,
        //   'bio':bio,
        //   'followers':[],
        //   'following':[],
        //   'uid':cred.user!.uid,
        // });
      }
    }
    // on FirebaseAuthException catch(e){
    //   if(e.code=='invalid-email'){
    //     print("email is badly formatted");
    //   }else if(e.code=='weak-password'){
    //     print('password is weak');
    //   }
    // }
    on FirebaseAuthException catch (err) {
      res = err.code.toString();
    }
    return res;
  }

  // Login user
  Future<String> logInUser(
      {required String email, required String password}) async {
    String res = "an error occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Enter email and password";
      }
    } on FirebaseAuthException catch (err) {
      res = err.code.toString();
    }

    return res;
  }
}
