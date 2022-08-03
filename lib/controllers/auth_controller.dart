import 'dart:typed_data';

import 'package:efotballactseller_app/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AuthController {
  //fuction yo add image to storage
  _uploadImageToStorage(Uint8List? image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePic')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //FUNCTION TO ENABLE USER OICK IMAGE

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _file = await _imagePicker.pickImage(source: source);
    if (_file != null) {
      return await _file.readAsBytes();
    } else {
      print('No Image Selected');
    }
  }

  //function to sighn up the users
  Future<String> signUpUser(String full_name, String username, String email,
      String phoneNumber, String password, Uint8List? image) async {
    String res = 'some error occured';
    try {
      if (full_name.isNotEmpty &&
          username.isNotEmpty &&
          email.isNotEmpty &&
          phoneNumber.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);

        String downloadUrl = await _uploadImageToStorage(image);
        _uploadImageToStorage(image);
        await firebaseStore.collection('users').doc(cred.user!.uid).set({
          'fullName': full_name,
          'username': username,
          'email': email,
          'phoneNumber': phoneNumber,
          'image': downloadUrl,
        });
        print(cred.user!.email);
        res = 'success';
      } else {
        res = 'Please fields must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

//function to login users
  loginUsers(String email, String password) async {
    String res = 'some error occured';
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'success';
        print('you are now logged in');
      } else {
        res = 'fields are empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  forgotPassword(String email) async {
    String res = 'Some error occured';
    try {
      if (email.isNotEmpty) {
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
        print('a reset link is sended to yr email');
      } else {
        res = 'Email field must not be empty';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}
