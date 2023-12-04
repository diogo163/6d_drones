import 'package:flutter/material.dart';
import 'package:ap/perfil.dart';
import 'package:ap/pallete.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);


  void _navigateToPerfil(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Perfil()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 32),
      appBar: AppBar(
          title: Text('6D Drones'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 40.0),
              child: GestureDetector(
                onTap: () {
                  _navigateToPerfil(context);
                },
                child: Text(
                  'Perfil',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Mapa
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                            child: Image.asset('assets/images/algo.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
              ),
            ),

            // Projetos
            Expanded(
              child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 150,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Pallete.gradient3
                              ),
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
