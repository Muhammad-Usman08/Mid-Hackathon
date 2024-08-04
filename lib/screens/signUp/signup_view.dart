import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/component/loginfield/loginfield.dart';
import 'package:myapp/screens/login/login_view.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});

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
    );
  }
}
