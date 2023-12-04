import 'package:ap/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:ap/widgets/gradient_button.dart';
import 'package:ap/widgets/login_field.dart';
import 'package:ap/project_screen.dart';
import 'package:ap/widgets/social_button.dart';
import 'package:ap/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ap/project_screen.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final FirebaseAuthService _auth = FirebaseAuthService();


  final _formKey = GlobalKey<FormState>();


  dynamic email = "";
  String senha = "";


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
          child: Form(
            key: _formKey,
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
                    LoginField(hintText: 'Email', onTextChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Por favor insira um e-mail';
                      }
                      else if (!value.contains("@")) {
                        return 'Por favor digite um email válido';
                      }
                        return null;
                    },
                    ),
                    const SizedBox(height: 15),
                    LoginField(hintText: 'Senha', onTextChanged: (value) {
                      senha = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Por favor insira a senha';
                      }
                      else if (value.length < 8) {
                        return 'A senha deve ter no mínimo 8 caracteres';
                      }
                        return null;
                    },
                    isPassword: true,
                    ),
                const SizedBox(height: 20),
                GradientButton2(onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    User? user = await _auth.signInWithEmailAndPassword(email, senha);

                    if (user != null) {
                      _navigateToHome(context);
                    } else {
                      print("Falha na autenticação. Verifique suas credenciais.");
                    }
                  }
                }),

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
      ),
    );
  }
}