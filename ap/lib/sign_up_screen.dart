import 'package:ap/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:ap/login_screen.dart';
import 'package:ap/widgets/gradient_button2.dart';
import 'package:ap/widgets/login_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ap/post.dart';
import 'dart:convert';
import 'package:ap/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Sign_up_Screen extends StatelessWidget {


  final FirebaseAuthService _auth = FirebaseAuthService();

  bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return (int.tryParse(s) != null);
}

  String nome = "";
  dynamic email = "";
  String senha = "";
  dynamic cnpj = "";

  Sign_up_Screen({Key? key}) : super(key: key);


  Future<Post> createPost(String email, String senha, String nome, String cnpj) async {
    final uri = Uri.parse("http://127.0.0.1:8000/users");
    final Map<String, dynamic> request = {
      "nome": nome,
      "email": email,
      "cnpj": cnpj,
      "senha": senha,
    };

    final response = await http.post(uri, body: request);

    if (response.statusCode == 200){
      return Post.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load post');
    }
  }


  void _navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  final _formKey = GlobalKey<FormState>();

  


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
                    'Registre-se',
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
                  const SizedBox(height: 15),
                  LoginField(hintText: 'Nome', onTextChanged: (value) {
                    nome = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Por favor insira o nome';
                    }
                      return null;
                  },
                  ),
                  const SizedBox(height: 15),
                  LoginField(hintText: 'CNPJ', onTextChanged: (value) {
                    cnpj = value;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty){
                      return 'Por favor insira o CNPJ';
                    }
                    else if (value.length != 14){
                      return 'O CNPJ deve ter 14 digitos (somente números)';
                    }
                    else if (!isNumeric(value)){
                      return 'O CNPJ deve conter apenas números';
                    }
                      return null;
                  },
                  ),
                  const SizedBox(height: 20),
                  GradientButton2(onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _signUp();
                      createPost(
                        email,
                        senha,
                        nome,
                        cnpj
                      );
                    }
                    else {
                      print("invalido");
                    }
                  }),
                  const SizedBox(height: 30),
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
                  const SizedBox(height: 30)
                ],
              ),
            ),
          ),
        ),
    );
  }

  void _signUp() async {
      
      String password = senha;

      User? user = await _auth.signUpWithEmailAndPassword(email, password);

      if (user != null){
        print("User is successfuly created");
      }
      else{
        print("Some error heppend");
      }

    }
  

}
