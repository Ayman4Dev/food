import 'package:flutter/material.dart';
import 'package:food/core/constants/app_colors.dart';
import 'package:food/shared/castumtextform.dart';
import 'package:food/shared/logo.dart';
import 'package:gap/gap.dart';

class Signup extends StatelessWidget {
  Signup({super.key});
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final GlobalKey<FormState> formkay = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkay,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(backgroundColor: AppColors.primary),

          body: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  LogoText(
                    textsize: 50,
                    fristcolor: Colors.white,
                    lastcolor: Colors.greenAccent,
                    text: 'Food Rush',
                  ),
                  Gap(10),
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),

                  Gap(20),
                  Castumtextform(hint: "Name", controller: name, ispass: false),
                  Gap(10),
                  Castumtextform(
                    hint: "Email",
                    controller: email,
                    ispass: false,
                  ),
                  Gap(10),
                  Castumtextform(
                    hint: "Password",
                    controller: password,
                    ispass: true,
                  ),
                  Gap(10),
                  Castumtextform(
                    hint: "Confirm Password",
                    controller: confirmpassword,
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
                      if (formkay.currentState!.validate()) {}
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
