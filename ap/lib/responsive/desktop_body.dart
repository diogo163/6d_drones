import 'package:flutter/material.dart';
import 'package:ap/pallete.dart';
import 'package:ap/perfil.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);


  void _navigateToPerfil(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Perfil()),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 117, 119),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  //Mapa
                  Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 900,
                            child: Image.asset('assets/images/algo.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),

                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                color: const Color.fromARGB(255, 24, 24, 32),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
