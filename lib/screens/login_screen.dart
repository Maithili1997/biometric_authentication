import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../app_pages.dart';
import '../controllers/biometric_controller.dart';
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
    final biometricController = Get.put(BiometricController());
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
       child: Form(
         key: formKey,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Center(child: Image.asset("assets/logo.png",scale: 5.0,)),
             SizedBox(height: 20.0,),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 5.0),
               child: Text(
                 "Email",
                 style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),

               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5.0),
               child: TextFormField(
                 style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),
                 controller: loginController.emailController.value,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                       borderSide: BorderSide(color: Colors.deepPurple),
                       borderRadius: BorderRadius.all(Radius.circular(5.0))
                   ),
                   enabledBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                   focusedBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple),
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
                 style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),
               ),
             ),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 5.0),
               child: TextFormField(
                 style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w600),
                 controller: loginController.passwordController.value,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple),
                     borderRadius: BorderRadius.all(Radius.circular(5.0))
                   ),
                   enabledBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                   focusedBorder: const OutlineInputBorder(
                     borderSide: BorderSide(color: Colors.deepPurple),
                     borderRadius: BorderRadius.all(Radius.circular(5.0)),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 50.0,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 SizedBox(
                   height: 40.0,
                   width: 170.0,
                   child: ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
                       side: const BorderSide(
                         color: Colors.deepPurple,
                         width: 1,
                       ),
                     ),
                     onPressed: (){
                       loginController.login();
                     },
                     icon: const Icon(Icons.login_outlined, color: Colors.deepPurple),
                     label: const Text('Login',style: TextStyle(color: Colors.deepPurple),),
                   ),
                 ),
                 SizedBox(
                   height: 40.0,
                     width: 170.0,
                   child:  ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
                       side: const BorderSide(
                         color: Colors.deepPurple,
                         width: 1,
                       ),
                     ),
                     onPressed: (){
                       biometricController.authenticate();
                     },
                     icon: const Icon(Icons.fingerprint, color: Colors.deepPurple),
                     label: const Text('Use fingerprint',style: TextStyle(color: Colors.deepPurple),),
                   )
                 )
               ],
             )

           ],
         ),
       ),
     ),
    );
  }
}
