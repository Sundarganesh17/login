
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taskapp/screen/detailscreen.dart';
import 'package:taskapp/product.dart';
import 'package:taskapp/provider.dart';
class Newscreen extends StatefulWidget {
  static const routeName='\newScreen';
final Product? editprod;
Newscreen(this.editprod);
  @override
  State<Newscreen> createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
 final DescriptionController=TextEditingController();
  final nameController = TextEditingController();
 GlobalKey<FormState> formkey=GlobalKey();

//    void _submitdata(){
      File? _pickedImg;
@override
  void initState() {
    
    super.initState();
    if(widget.editprod!=null){ nameController.text=widget.editprod!.title!;
    DescriptionController.text=widget.editprod!.description!;
    _pickedImg=File(widget.editprod!.imagedir!);}
   
  }
  @override
  Widget build(BuildContext context) {
    final userData= Provider.of<Productdetails>(context);
   return Scaffold(
      appBar: AppBar(title:const Center(child: Text('your post')),
      backgroundColor: Colors.deepPurple,      
      ),
      body: SingleChildScrollView(
        child: Expanded(
          child: Container(
           
             padding:const EdgeInsets.all(20),
            child:  Form(
              key: formkey,
              child: Column(
                children:<Widget> [
                  TextFormField(
                        validator: (value){
                       if(value!.isEmpty){
                        return 'please fill the required field';
                       }else {
                        return null;
                       }
                        },
                   decoration:const InputDecoration(labelText:'   your name',),
                   controller:nameController ,
                    
                  ),
                  const SizedBox(height: 6,),
                  TextFormField(
                    validator: (value){
                       if(value!.isEmpty){
                        return 'please fill the required field';
                       }else {
                        return null;
                       }
                        },
                    
                    decoration:const InputDecoration(labelText: '   description'),
                    controller: DescriptionController,
                  ),
                  Row(
                    children: <Widget>[Expanded(
                      child: Container(height: 200,
                      child:_pickedImg==null? const Center(child:Text("pick image")): Image.file(_pickedImg!),
                    padding:const EdgeInsets.all(10),
                    margin:const EdgeInsets.all(10),
                    decoration:BoxDecoration(border: Border.all(width: 5))),),
              
                    IconButton(onPressed:()async{
                      final ImagePicker _picker = ImagePicker();
                     var file= await  _picker.pickImage(source: ImageSource.camera);
                     setState(() {
                       _pickedImg=File(file!.path);
                     });
                    },
                     icon:const Icon(Icons.camera_alt))],
                  ),
                 const SizedBox(height: 30,),
                  ElevatedButton(onPressed:(){
                    if(formkey.currentState!.validate()){
                      if(_pickedImg!=null){
                        if(widget.editprod!=null){
                          userData.editprod(
                            Product(
                              description: DescriptionController.text,
                              id: widget.editprod!.id,
                              title: nameController.text,
                              imagedir: _pickedImg!.path
                            )
                          );
                        }else{
                        userData.addTx(
                          nameController.text,
                         DescriptionController.text,
                         _pickedImg!.path);
                        }
                  
                     Navigator.of(context).pop();
                      }else{}
                    }else{}
                  },
                   style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                   child:const Text('submit',
                  style: TextStyle(
                  fontWeight: FontWeight.bold),))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}