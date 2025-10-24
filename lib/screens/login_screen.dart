import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_pages.dart';
import '../controllers/login_controller.dart';

class LoginScreenPage extends StatefulWidget {
  const LoginScreenPage({super.key});

  @override
  State<LoginScreenPage> createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
       child: Form(
         key: formKey,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(child: Image.asset("assets/logo.png",scale: 3.0,)),
             SizedBox(height: 20.0,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
               child: Text(
                 "Email",
                 style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),

               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5.0),
               child: TextFormField(
                 controller: loginController.emailController.value,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.deepPurple,width: 1),
                       borderRadius: BorderRadius.all(Radius.circular(5.0))
                   ),
                   enabledBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                   focusedBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 15.0,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
               child: Text(
                 "Password",
                 style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w600),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5.0),
               child: TextFormField(
                 controller: loginController.passwordController.value,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple,width: 1),
                     borderRadius: BorderRadius.all(Radius.circular(5.0))
                   ),
                   enabledBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                   focusedBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple, width: 1),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 50.0,),
             SizedBox(
               height: 50.0,
               width: double.infinity,
               child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                   foregroundColor: Colors.white,
                   backgroundColor: Colors.deepPurple,
                   shape:RoundedRectangleBorder(
                     borderRadius:BorderRadius.circular(20.0)
                   )
                 ),
                   onPressed: (){
                     Get.offAllNamed(Routes.BIOMETRIC);
                   },
                   child: Text("LOGIN",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w800),)
               ),
             )
           ],
         ),
       ),
     ),
    );
  }
}
