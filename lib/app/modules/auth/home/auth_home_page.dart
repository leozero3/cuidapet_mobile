import 'package:cuidapet_mobile/core/extensions/size_screen_extension.dart';
import 'package:flutter/material.dart';
    
class AuthHomePage extends StatelessWidget {

  const AuthHomePage({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

   
    return Scaffold(
      appBar: AppBar(
        title: const Text('auth home'),
      ),
      body: Center(
        child: Image.asset('assets/images/logo.png', 
        width: 162.w,
        height: 130.h,
        fit: BoxFit.contain,
        ),
      ),
    );
  }
}