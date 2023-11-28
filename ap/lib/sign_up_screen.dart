import 'package:ap/login_screen.dart';
import 'package:ap/widgets/gradient_button2.dart';
import 'package:ap/widgets/login_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ap/post.dart';
import 'dart:convert';

class Sign_up_Screen extends StatelessWidget {

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
              LoginField(hintText: 'Email', onTextChanged: (value) {
                email = value;
              }),
              const SizedBox(height: 15),
              LoginField(hintText: 'Senha', onTextChanged: (value) {
                senha = value;
              }),
              const SizedBox(height: 15),
              LoginField(hintText: 'Nome', onTextChanged: (value) {
                nome = value;
              }),
              const SizedBox(height: 15),
              LoginField(hintText: 'CNPJ', onTextChanged: (value) {
                cnpj = value;
              }),
              const SizedBox(height: 20),
              GradientButton2(onPressed: () {
                createPost(
                  email,
                  senha,
                  nome,
                  cnpj
                );
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
    );
  }
}