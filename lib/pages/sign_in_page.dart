import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/const/colors.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: bgColor,
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
              child: Icon(
            Icons.movie,
            size: 100,
            color: Colors.red,
          )),
          const Text(
            'Movie App',
            style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const Text('Enjoy the world of movies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),

          // Email TextField
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  controller: _emailController,
                  decoration: const InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),

          // Password TextField
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: TextField(
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    icon: Padding(
                      padding: EdgeInsets.only(left: 12.0),
                      child: Icon(
                        Icons.password,
                        color: Colors.white,
                      ),
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    // prefixIcon: Icon(
                    //   Icons.password,
                    //   color: Colors.white,
                    // ),
                  ),
                ),
              ),
            ),
          ),

          // forgot password
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ForgotPasswordPage(),
                  //   ),
                  // );
                },
                child: const Text("Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                    )),
              ),
              const SizedBox(width: 20.0),
            ],
          ),

          // Sign In Button
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  signIn();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // Not a member text
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Not a member? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  )),
              Text("Sign Up Now",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  )),
            ],
          )
        ],
      ),
    ));
  }
}
