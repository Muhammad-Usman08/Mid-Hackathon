import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/component/loginfield/loginfield.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/screens/signUp/signup_view.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      print(credential);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

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
                    child: MyButton(
                      buttonText: 'Log In',
                      onpressed: () {
                        login(context);
                      },
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
