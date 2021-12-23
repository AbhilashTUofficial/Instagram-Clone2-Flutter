import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instagram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instagram_flutter/responsive/web_screen_layout.dart';
import 'package:instagram_flutter/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDcSjTQ_4XyallsBEY5UoxQ_L3IGodJqRE",
          authDomain: "instagram-clone-d4776.firebaseapp.com",
          projectId: "instagram-clone-d4776",
          storageBucket: "instagram-clone-d4776.appspot.com",
          messagingSenderId: "776629533881",
          appId: "1:776629533881:web:d2e0931da233fa84e06f68"
      ),
    );

  }
  else{
    await Firebase.initializeApp();

  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
