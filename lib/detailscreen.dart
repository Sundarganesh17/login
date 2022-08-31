import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/newscreen.dart';
import 'package:taskapp/provider.dart';

class Detailscreen extends StatelessWidget {
  static const routeName = '\detailscreen';

  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<Productdetails>(context);
    final proData = pro.items;
   
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Center(
              child: Text(
            'YOUR POSTS',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          )),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Newscreen.routeName);
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: pro.items.isEmpty?Center(child: Text("Add Products"),):
        Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (ctx,i){
                return  Container(
              padding: EdgeInsets.all(20),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                       Image.file(
                  File(pro.items[i].imagedir!),
                  fit: BoxFit.cover,
                ),
                      Container(
                        decoration: BoxDecoration(
                         // borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(pro.items[i].title??""),
                                  Text(pro.items[i].description??""),
                                ],
                              ),
                               Row(
                              children: [
                                IconButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Newscreen(pro.items[i])));
                                }, icon: Icon(Icons.edit)),
                                 IconButton(onPressed: (){
                                  pro.deleteprod(i);
                                 }, icon: Icon(Icons.delete))
                              ],
                            ),
            
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },itemCount: pro.items.length,),
            ),
          ],
        ));
  }
}
