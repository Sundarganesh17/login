
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/screen/detailscreen.dart';
import 'package:taskapp/screen/newscreen.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email;
  String? _password;
GlobalKey<FormState> formkey=GlobalKey();
  onLogin(){
    if(formkey.currentState!.validate()){
 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) {
  return Detailscreen();
 })));
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:const Text('Login Form'),
      ),
      body: SingleChildScrollView(
        padding:const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Form(
          key: formkey,
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value){
                  if(value!.isEmpty ){
                    return "Please Enter Your Mail-id";
                  }else if(!value.contains("@")){
                    return "please enter valid mail-id";
                  }else{
                    return null;
                  }
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon:const Icon(Icons.email_outlined),
                  hintText: 'Your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.0)),
                ),
                
                onChanged: (value) => setState(() {
                  _email = value;
                }),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                obscureText: true,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(' '),
                ],
                decoration: InputDecoration(
                    prefixIcon:const Icon(Icons.lock_outline),
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22.0))),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value){
                          if(value!.length>=8){
                            return null;
                          }else{
                            return "Password must be in eight charaters";
                          }
                        },
                onChanged: (value) => setState(() {
                  _password = value;
                }),
              ),
              const SizedBox(
                height: 150,
              ),
              FlatButton(
                  padding:const EdgeInsets.symmetric(vertical: 18, horizontal: 72),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0)),
                  onPressed: () {
                  onLogin();
                  },
                  child:const Text(
                    'LOGIN',
                    style: TextStyle(fontSize: 18.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}