
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sample/main.dart';
import 'package:sample/screens/Home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {


   ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  bool  _isDatamatch = true;
  final _usernamecontroller = TextEditingController();

  final _passwordcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      validator: (value) => value == null || value.isEmpty ? "Value is empty" : null,
                      controller: _usernamecontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                        hintText: "Username",
                        
                      ),
                    ),
                  ),
                  
                  TextFormField(
                     validator: (value) => value == null || value.isEmpty ? "Value is empty" : null,
                    controller: _passwordcontroller,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
                      hintText: "Password",
                      
                    ),
                  ),
                 const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: !_isDatamatch,
                        child: const Text("username and password doesnt match",style: TextStyle(color: Colors.red),)),
                      ElevatedButton.icon(onPressed: (){
                        if(_formkey.currentState!.validate()){
                          checkLogin(context);
                        }
                        else{
                          print("data empty");
                        }
                        
                      }, icon:const Icon(Icons.check), label:const Text("Login")),
                    ],
                  ),
                  TextButton(onPressed: (){
                    ShowBottom(context);
                  }, child: const Text("Bottomsheet"))
                ],
              ),
            ),
          )
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async{
    final _username = _usernamecontroller.text;
    final _password = _passwordcontroller.text;
    if(_username == _password){
      final _sharepref = await SharedPreferences.getInstance();
      _sharepref.setBool(SAVE_LOGIN, true);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>screenHome()));
    }
    else{

      print("data doesnt match");
      //snackbar
     /* ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        margin:const EdgeInsets.all(10),
        content: Text(_error)));
        
        //alert

        showDialog(context: context, builder: (ctx){
          return AlertDialog(
            title: const Text("Error"),
            content: Text(_error),
           actions: [
            TextButton(onPressed: (){
              Navigator.of(ctx).pop();
            }, child:const Text("close")),
           ], 
          );
        });

        setState(() {
          _isDatamatch = false;
        });*/
    }
  }

  Future<void> ShowBottom(BuildContext context) async {
    showBottomSheet(context: context, builder: (ctx){
      return Container(
        width: double.infinity,
        height: 400,
        color: Colors.orange,
        child: ListView(
          children: [
           const Text("Flutter Demo",style: TextStyle(color: Colors.black),),
            TextButton(onPressed: (){
              Navigator.of(ctx).pop();
            }, child:const Text("close")),
          ],
        ),
      );
    }
    );
  }
}