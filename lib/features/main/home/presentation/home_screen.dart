import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/Color_Manager.dart';
import 'package:movies_app/features/main/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: HomeScreenBody());
  }
}
