import 'package:course_app/page/login_page.dart';
import 'package:course_app/page/main_page.dart';
import 'package:course_app/provider/auth_provider.dart';
import 'package:course_app/provider/course_provider.dart';
import 'package:course_app/constants/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.black));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CourseProvider()),
          ChangeNotifierProvider(create: (context) => AuthProvider()),
        ],
        builder: (context, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.theme,
            home: firebase_auth.FirebaseAuth.instance.currentUser != null
                ? CoursePage()
                : LoginPage(),
          );
        });
  }
}
