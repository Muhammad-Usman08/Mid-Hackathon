import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/component/loginfield/loginfield.dart';
import 'package:myapp/screens/signUp/signup_view.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 35),
                child: Image.asset('assets/logo/logo.png'),
              ),
              LoginField(
                  title: 'Email',
                  fieldName: 'Enter email',
                  controller: emailController),
              LoginField(
                title: 'Password',
                fieldName: 'Enter password',
                controller: passwordController,
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: const MyButton(
                      buttonText: 'Create Account',
                      value: 10,
                    )),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ));
                  },
                  child: const Text(
                    'Dont have a account Sign Up',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
