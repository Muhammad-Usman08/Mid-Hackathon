import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/component/loginfield/loginfield.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/screens/login/login_view.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});

  //controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print(credential);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 35),
                  child: const Image(
                    image: AssetImage('assets/logo/logo.png'),
                  ),
                ),
                const LoginField(title: 'Full Name', fieldName: 'Enter Name'),
                LoginField(
                  title: 'Email',
                  fieldName: 'Enter email',
                  controller: emailController,
                ),
                LoginField(
                  title: 'Password',
                  fieldName: 'Enter password',
                  controller: passwordController,
                ),
                Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: MyButton(
                        buttonText: 'Create Account',
                        value: 10,
                        onpressed: () {
                          signUp(context);
                        },
                      )),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: const Text(
                      'Already have a account Login in',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
