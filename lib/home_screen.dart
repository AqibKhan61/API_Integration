import 'package:get/get.dart';
import 'package:flutter/material.dart';



class HomeScreen extends GetView{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Intedration'),
        centerTitle: true,
      ),
    );
  }
}