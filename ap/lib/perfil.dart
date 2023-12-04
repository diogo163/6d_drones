import 'package:flutter/material.dart';
import 'package:ap/responsive copy/desktop_body2.dart';
import 'package:ap/responsive copy/mobile_body2.dart';
import 'package:ap/responsive copy/responsive_layout2.dart';

class Perfil extends StatefulWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody2: PerfilMob(),
        desktopBody2: PerfilDesk(),
      ),
    );
  }
}