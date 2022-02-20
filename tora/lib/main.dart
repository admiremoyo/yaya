// ignore_for_file: prefer_const_constructors

import 'news.dart';
import 'stories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: ChangeNotifierProvider(
       create: (context) => NewsData(),
       builder: (context, child) {
      return Storiespage(); 
     },
     ),
     ); 
    
  }
}