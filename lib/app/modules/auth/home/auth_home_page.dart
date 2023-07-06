import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
    
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