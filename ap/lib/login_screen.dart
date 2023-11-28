import 'package:ap/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:ap/widgets/gradient_button.dart';
import 'package:ap/widgets/login_field.dart';
import 'package:ap/project_screen.dart';
import 'package:ap/widgets/social_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void _navigateToSign_up(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Sign_up_Screen()),
    );
  }

  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(height: 30),
              const Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Senha'),
              const SizedBox(height: 20),
              const GradientButton(),
              const SizedBox(height: 15),

              InkWell(
                onTap: () {
                  _navigateToSign_up(context);
                },
                child: Text(
                  'Ainda não tem uma conta? Registrar-se',
                  style: TextStyle(
                    color: Color.fromARGB(255, 71, 141, 199),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}