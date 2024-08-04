import 'package:flutter/material.dart';
import 'package:myapp/component/buttons/mybutton.dart';
import 'package:myapp/component/loginfield/loginfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 35),
                child: Image.asset('name'),
              ),
              const LoginField(title: 'Full Name', fieldName: 'Enter Name'),
              const LoginField(title: 'Email', fieldName: 'Enter email'),
              const LoginField(title: 'Password', fieldName: 'Enter password'),
              Center(
                child: Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: const MyButton(buttonText: 'Create Account')),
              ),
              const Center(
                child: Text(
                  'Already have a account Login in',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
