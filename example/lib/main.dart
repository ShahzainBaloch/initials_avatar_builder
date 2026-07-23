import 'package:flutter/material.dart';
import 'package:initials_avatar_builder/initials_avatar_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Initials Avatar Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Default Auto Color:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              // Default use (Auto color & standard size)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InitialsAvatar(name: 'Shahzain Baloch'),
                  SizedBox(width: 10),
                  InitialsAvatar(name: 'Ali Khan'),
                  SizedBox(width: 10),
                  InitialsAvatar(name: 'Zahra'),
                ],
              ),
              
              SizedBox(height: 30),
              
              Text('Custom Solid Color:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              // Custom size aur backgroundColor ke sath
              InitialsAvatar(
                name: 'Farooq Ahmad',
                radius: 40,
                backgroundColor: Colors.black,
              ),

              SizedBox(height: 30),
              
              Text('Custom Gradient:', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              InitialsAvatar(
                name: 'Developer',
                radius: 50,
                backgroundGradient: LinearGradient(
                  colors: [Colors.purple, Colors.deepOrange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}