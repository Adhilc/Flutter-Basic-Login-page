import 'package:flutter/material.dart';
import 'package:sample/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class screenHome extends StatelessWidget {
  const screenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Home"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            signout(context);
          }, icon: const Icon(Icons.logout),),
        ],
      ),
      body: SafeArea(child: 
      Text("Home Screen"),),
    );
  }

  signout(BuildContext context) async{
      final _sharepref = await SharedPreferences.getInstance();
      _sharepref.clear();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>ScreenLogin()), (route) => false);
  }
}