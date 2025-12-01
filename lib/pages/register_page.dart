import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({super.key, required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
String? errorMessage;

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final comfirmPwContoller = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    pwController.dispose();
    comfirmPwContoller.dispose();
    super.dispose();
  }
  Future signUp () async{
    if (passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: pwController.text.trim(),
     );
    }
  }

  bool passwordConfirmed(){
    if (pwController.text.trim()== comfirmPwContoller.text.trim()){
      return true;
    } else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.bakery_dining_sharp,
                size: 150,
              ),
              //Welcome Text
              Text(
                "Hello Dear Costumers!",
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                ),
              ),
              Text(
                "Welcome, Register below with your details!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 50),
             
              SizedBox(height: 10),
              //email textField
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                       ),
                       focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Input Email:',
                       fillColor: Colors.grey[200],
                       filled: true,
                    ),
                  ),                                  
                ),
              SizedBox(height: 10),
              //password textFiel
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      obscureText: true,
                      controller: pwController,
                      decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                       ),
                       focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Input Password:',
                       fillColor: Colors.grey[200],
                       filled: true,
                    ),
                  ),                                  
                ),
                SizedBox(height: 10),
              //confirm password textFiel
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: TextField(
                      obscureText: true,
                      controller: comfirmPwContoller,
                      decoration: InputDecoration(
                       enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                       ),
                       focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                       ),
                       hintText: 'Confirm Password:',
                       fillColor: Colors.grey[200],
                       filled: true,
                    ),
                  ),                                  
                ),
                SizedBox(height: 10),
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: GestureDetector(
                  onTap: signUp,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              //if not member register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have an Account now!',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                GestureDetector(
                  onTap: widget.showLoginPage,
                  child: Text(
                  ' Login Now!',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                   ),
                  ),
                ),
               ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}