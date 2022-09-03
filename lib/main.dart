
                                                                                                                                                                         
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/screen/authscreen.dart';
import 'package:taskapp/screen/newscreen.dart';
import 'package:taskapp/screen/detailscreen.dart';
import 'package:taskapp/provider.dart';

void main()async {

  runApp(const MyApp());
} 
  

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>Productdetails() ,
      child: 
         MaterialApp(
          debugShowCheckedModeBanner: false,
        
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Login(),
          routes: {
           Newscreen.routeName:(ctx) => Newscreen(null),
            Detailscreen.routeName:(ctx) => Detailscreen(),
          },
        ),
    );
    
  }
}
