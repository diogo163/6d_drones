import 'package:flutter/material.dart';
import 'package:ap/pallete.dart';
import 'package:ap/widgets/gradient_button3.dart';
import 'package:ap/widgets/login_field.dart';
import 'package:ap/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Perfil extends StatelessWidget {
  Perfil({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();


  String nome = "";
  dynamic email = "";
  String senha = "";


  Future<Post> getData() async {
    final uri = Uri.parse("http://127.0.0.1:8000/users");
    final response = await http.get(uri);


    if (response.statusCode == 200){
      return Post.fromJson(json.decode(response.body));
    }else{
      throw Exception('Failed to load get');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 32),
      appBar: AppBar(
        title: Text('6D Drones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 700,
                child: SingleChildScrollView(
                child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            'Editar/adicionar dados',
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
                          LoginField(hintText: 'Endereço'),
                          const SizedBox(height: 15),
                          LoginField(hintText: 'Celular'),
                          
                          const SizedBox(height: 20),
                          GradientButton2(onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                            }
                            else {
                              print("invalido");
                            }
                          }),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              width: 2,
              color: Colors.white,
            ),


            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 800,
                            child: Center(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 100),
                                    const Text(
                                      'Funcionários',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    const SizedBox(height: 40),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      height: 625,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: FutureBuilder<Post>(
                                        future: getData(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Text('Error: ${snapshot.error}');
                                          } else {
                                            final post = snapshot.data!;
                                            return Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Nome: ${post.idOrg}'),
                                                Text('Nome: ${post.nome}'),
                                                Text('Email: ${post.email}'),
                                                Text('Senha: ${post.senha}'),
                                                Text('cnpj: ${post.cnpj}')
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
