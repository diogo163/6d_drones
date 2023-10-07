import 'package:ap/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:ap/widgets/gradient_button2.dart';
import 'package:ap/widgets/login_field.dart';

class Sign_up_Screen extends StatelessWidget {
  const Sign_up_Screen({Key? key}) : super(key: key);

  void _navigateToLogin(BuildContext context) {    
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()), 
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
                'Registre-se',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              const LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Senha'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'Número de celular'),
              const SizedBox(height: 15),
              const LoginField(hintText: 'CPF'),
              const SizedBox(height: 20),
              const GradientButton2(),
              const SizedBox(height: 15),

              InkWell(
                onTap: () {
                  _navigateToLogin(context);
                },
                child: Text(
                  'Já tem uma conta? Logar',
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
