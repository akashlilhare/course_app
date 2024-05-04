import 'package:course_app/widget/app_text_input_box.dart';
import 'package:course_app/page/signup_page.dart';
import 'package:course_app/provider/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../enum/app_loading_staus.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .18,
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          child: Image.asset(
                            "assets/login_image.png",
                            height: 80,
                          )),
                      Text("Log in",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextInputBox(
                        title: "Email",
                        icon: Icons.email_outlined,
                        controller: authProvider.emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      AppTextInputBox(
                        title: "Password",
                        icon: Icons.lock_open_outlined,
                        controller: authProvider.passwordController,
                        isPassword: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Consumer<AuthProvider>(builder: (context, provider, _) {
                        return ElevatedButton(
                            onPressed: () {
                              provider.emailLogin(context: context);
                            },
                            child: provider.connectionStatus ==
                                    AppConnectionStatus.loading
                                ? Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text("Login"));
                      }),
                      SizedBox(
                        height: 40,
                      )
                    ],
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Don\'t have an account? ',
                  ),
                  TextSpan(
                    text: 'Sign up',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return SignInPage();
                        }));
                      },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
