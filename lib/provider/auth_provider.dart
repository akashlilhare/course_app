import 'package:course_app/constants/app_constants.dart';
import 'package:course_app/page/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../enum/app_loading_staus.dart';
import '../page/login_page.dart';

class AuthProvider with ChangeNotifier {
  AppConnectionStatus connectionStatus = AppConnectionStatus.none;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future emailLogin({required BuildContext context}) async {
    bool isValidEmail = AppConstants.validateEmail(emailController.text);

    if (!isValidEmail) {
      return AppConstants.getSnackBar(
          msg: "Please enter valid email", context: context);
    }

    connectionStatus = AppConnectionStatus.loading;
    notifyListeners();
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (credential.user == null) {
        throw "user not login properly";
      }
      navigateToNextPage(context: context);
      AppConstants.getSnackBar(
          msg: "User Login Successfully", context: context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        AppConstants.getSnackBar(
            msg: 'No user found for that email.', context: context);
      } else if (e.code == 'wrong-password') {
        AppConstants.getSnackBar(
            msg: 'Wrong password provided for that user.', context: context);
      } else {
        AppConstants.getSnackBar(
            msg: 'Wrong email or password', context: context);
      }
    } catch (e) {
      AppConstants.getSnackBar(msg: 'something went wrong', context: context);
      print(e.toString());
    } finally {
      connectionStatus = AppConnectionStatus.success;
      notifyListeners();
    }
  }

  Future emailSignup({required BuildContext context}) async {
    bool isValidEmail = AppConstants.validateEmail(emailController.text);

    if (!isValidEmail) {
      return AppConstants.getSnackBar(
          msg: "Please enter valid email", context: context);
    }

    if (confirmPasswordController.text != passwordController.text) {
      return AppConstants.getSnackBar(
          msg: "Password must be same", context: context);
    }
    bool isValidPassword = AppConstants.validatePassword(emailController.text);

    if (!isValidPassword) {
      return AppConstants.getSnackBar(
          msg: "Please enter valid password", context: context);
    }

    connectionStatus = AppConnectionStatus.loading;
    notifyListeners();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      navigateToNextPage(context: context);
      AppConstants.getSnackBar(
          msg: "User Login Successfully", context: context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppConstants.getSnackBar(
            msg: 'The password provided is too weak.', context: context);
      } else if (e.code == 'email-already-in-use') {
        AppConstants.getSnackBar(
            msg: 'The account already exists for that email.',
            context: context);
      }
    } catch (e) {
      AppConstants.getSnackBar(msg: 'something went wrong', context: context);
      print(e.toString());
    } finally {
      connectionStatus = AppConnectionStatus.success;
      notifyListeners();
    }
  }

  Future logout({required BuildContext context}) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw "user not found";
      }

      FirebaseAuth.instance.signOut();

      AppConstants.getSnackBar(
          msg: "User Logout Successfully", context: context);

      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (builder) {
        return LoginPage();
      }), (route) => route.isFirst);
    } catch (e) {
      AppConstants.getSnackBar(msg: "Something went wrong", context: context);
      print("error : ${e.toString()}");
    }
  }

  navigateToNextPage({required BuildContext context}) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return CoursePage();
    }));
  }
}
