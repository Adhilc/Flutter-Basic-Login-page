
import 'package:flutter/material.dart';
import 'package:sample/main.dart';
import 'package:sample/screens/Home.dart';
import 'package:sample/screens/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ScreenSplash extends StatefulWidget {

  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
 
 int _currentvalue = 0;

 @override
  void initState() {
    checkUserLogin(context);
    super.initState();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentvalue,
        onTap: (newIndex){
          setState(() {
           _currentvalue: newIndex;
          });
        },
        items:const  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person')
      ]),
      body: SafeArea(child: Center(
        child: Image.asset("assets/images/loading.jpg"),
      ),),
    );
  }

  Future<void> goToLogin(BuildContext context) async {
   await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> ScreenLogin(),),);
  }


  Future<void> checkUserLogin(BuildContext context) async {
    final _sharepref = await SharedPreferences.getInstance();
    final _userlogin = _sharepref.getBool(SAVE_LOGIN);
    if(_userlogin == null || _userlogin == false){
      goToLogin(context);
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>screenHome()));
    }
  }
}