import 'package:flutter/material.dart';
import 'package:food/features/auth/views/signup.dart';
import 'package:food/root.dart';

import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/castumtextform.dart';
import '../../../shared/logo.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formkay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xFF3D8D2F),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Form(
                key: formkay,
                child: Column(
                  children: [
                    Gap(150),

                    LogoText(
                      textsize: 50,
                      fristcolor: Colors.white,
                      lastcolor: Colors.greenAccent,
                      text: 'Food Rush',
                    ),
                    LogoText(
                      textsize: 15,
                      fristcolor: Colors.white,
                      lastcolor: Colors.greenAccent,
                      text: 'Fresh. Fast. Right Now !',
                    ),

                    Gap(50),
                    Castumtextform(
                      hint: "Email",
                      controller: email,
                      ispass: false,
                    ),
                    Gap(25),
                    Castumtextform(
                      hint: "Password",
                      controller: password,
                      ispass: true,
                    ),
                    Gap(30),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (formkay.currentState!.validate()) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Root()),
                          );
                        }
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(10),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFFFF3C4),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text(
                        "Not Have account..?\n \n Sign Up ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
