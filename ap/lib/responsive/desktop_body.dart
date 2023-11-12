import 'package:flutter/material.dart';
import 'package:ap/pallete.dart';

class MyDesktopBody extends StatelessWidget {
  const MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 118, 117, 119),
      appBar: AppBar(
        title: Text('6D Drones'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Primeira Coluna
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
                            color: Colors.deepPurple[300],
                            height: 900,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // Barra dos projetos
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(              
                width: 200,
                color: Colors.deepPurple[300],
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
