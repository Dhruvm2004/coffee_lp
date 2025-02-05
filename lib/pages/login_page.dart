import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lp_2024/pages/auth.dart';
// import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String name = "";
  // bool changeButton = false;
  String? errorMessage = '';
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var pass = TextEditingController();
  bool obscureText = true;
  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(email: email.text, pass: pass.text);
      Navigator.pushNamedAndRemoveUntil(context, '/bottom',(Route route)=>false);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/coffe8.jpg"), fit: BoxFit.cover),
          ),

          // filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: 400,
              width: 350,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.brown.shade800),
                  color: Colors.black38.withOpacity(0.6)),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Login',
                      style: GoogleFonts.baskervville(
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                          fontSize: 50),
                    ),
                    const SizedBox(
                      height: 10 + 10,
                    ),
                    TextFormField(
                        style: const TextStyle(color: Colors.white70, fontSize: 16),
                        controller: email,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.mail,
                              color: Colors.white70,
                            ),
                            hintText: 'enter email',
                            labelText: 'Email',
                            hintStyle: const TextStyle(color: Colors.white38),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.blueAccent,
                                ))),
                        validator: (email) {
                          if (email!.isEmpty ||
                              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(email)) {
                            return 'enter valid email';
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                      ),
                      controller: pass,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white70,
                        ),
                        hintText: 'enter password',
                        labelText: 'password',
                        hintStyle: const TextStyle(color: Colors.white38),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.blueAccent,
                            )),
                      ),
                      validator: (pass) {
                        if (pass!.isEmpty) {
                          return "password cannot be empty ";
                        } else if (pass.length < 6) {
                          return "password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?,",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            "SignUp",
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     TextButton(onPressed: () {
                    //       Naviga
                    //     })
                    //   ],

                    // )
                    const SizedBox(
                      height: 10,
                    ),

                    FilledButton(onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        await signInWithEmailAndPassword();
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.brown[900])
                    ),
                    child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                    ),),),
                      // Text(
                      //   errorMessage == '' ? '' : ' $errorMessage',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     color: Colors.white70
                      //   ),),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
