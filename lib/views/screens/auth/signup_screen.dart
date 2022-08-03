import 'dart:typed_data';

import 'package:efotballactseller_app/controllers/auth_controller.dart';
import 'package:efotballactseller_app/views/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  Uint8List? _image;
  bool _isLoading = false;

  selectImage() async {
    Uint8List im = await AuthController().pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().signUpUser(
        _fullNameController.text,
        _usernameController.text,
        _emailController.text,
        _phoneNumberController.text,
        _passwordController.text,
        _image);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      return showSnackBar(res, context);
    } else {
      return showSnackBar('Account has been successfully created ', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
           decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/cr7.jpeg'),
          fit: BoxFit.cover),
      ),
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundColor: Colors.grey,
                        backgroundImage: MemoryImage(_image!))
                    : CircleAvatar(
                        radius: 64,
                        backgroundColor: Color.fromARGB(83, 158, 158, 158),
                        // backgroundImage: NetworkImage(
                        //     'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                      ),
                Positioned(
                  left: 0,
                  bottom: 10,
                  
                  child: InkWell(
                      onTap: selectImage, child: Icon(Icons.add_a_photo)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _fullNameController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'New Username',
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
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter your Full-Name',
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
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter your Email',
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
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter your WhattsApp Number',
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
                  signUpUser();
                  _fullNameController.clear();
                  _usernameController.clear();
                  _emailController.clear();
                  _passwordController.clear();
                  _image!.clear();
                },
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Text(
                        'Register',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                  'Already have an Account!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(235, 219, 211, 211),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Sign In',
                      style:
                           
                          TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(235, 255, 36, 36), fontSize: 18),
                    ))
              ],
            )
          ],
        ),
      ),
    ));
  }
}
