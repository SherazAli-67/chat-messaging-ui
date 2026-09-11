import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainMenuPage extends StatelessWidget{
  const MainMenuPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Navigation main menu"),),
    );

  }
}