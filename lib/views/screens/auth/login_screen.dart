import 'package:efotballactseller_app/controllers/auth_controller.dart';
import 'package:efotballactseller_app/views/screens/auth/forgot_password_screen.dart';
import 'package:efotballactseller_app/views/screens/auth/signup_screen.dart';
import 'package:efotballactseller_app/views/screens/bottom_navbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  // final urlImage = "https://images.app.goo.gl/4ksdpKv4R7ukhQDH6";
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  loginUsers() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController()
        .loginUsers(_emailController.text, _passwordController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      //do nothing now
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BottomNavBar()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/lmt.jpg'),
          fit: BoxFit.cover),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter your email',
               fillColor: Color.fromARGB(57, 189, 210, 232),
              // focusedBorder: OutlineInputBorder(borderRadius: BorderSide(color:  Colors.black)),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
              )),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              filled: true,
              hintText: 'Enter your Password',
               fillColor: Color.fromARGB(57, 189, 210, 232),
              // focusedBorder: OutlineInputBorder(borderRadius: BorderSide(color:  Colors.black)),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            height: 50,
            decoration: BoxDecoration(color: Colors.black),
            child: Center(
                child: InkWell(
              onTap: () {
                loginUsers();
                _emailController.clear();
                _passwordController.clear();
              },
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                  : Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
            )),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Need an Account?',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(235, 120, 153, 96),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(235, 255, 36, 36), fontSize: 18),
                  ))
            ],
          ),
          SizedBox(
            height: 6,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ForgotPassworScreen()));
              },
              child: Text(
                'Forgot Paasword?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                   color: Color.fromARGB(235, 219, 211, 211),
                ),
              ))
        ],
      ),
    ));
  }
}
