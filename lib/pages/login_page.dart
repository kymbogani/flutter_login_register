import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({super.key, required this.showRegisterPage});

 @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // Text controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();

   Future<String?> singIn() async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: pwController.text.trim(),
     );
         return null;
    }
    on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-email':
        return "Wrong email format";
      case 'user-not-found':
        return "Email not found";
      case 'wrong-password':
        return "Wrong password";
      case 'missing-password':
        return "Please enter your password";
      default:
        return "Login failed. Try again.";
    }
  } catch (e) {
    return "Something went wrong";
  }
   }
   @override
   void dispose() {
    emailController.dispose();
    pwController.dispose();
    super.dispose();
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
                "Hello Again, Dear Costumers!",
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                ),
              ),
              Text(
                "Welcome back, to our Bakeshop. Login Now!",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 50),
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
              //sign in button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: GestureDetector(
                  onTap: () async {
                    final message = await singIn();
                    if (message != null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border:Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        'Log In',
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
                    'No Account?',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                GestureDetector(
                  onTap: widget.showRegisterPage,
                  child: Text(
                  ' Register Now!',
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