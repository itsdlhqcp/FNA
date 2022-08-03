import 'package:efotballactseller_app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';


// class ForgotPassworScreen extends StatelessWidget {
//   const ForgotPassworScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Forgot Password'),
//       ),
//     );
//   }
// }
class ForgotPassworScreen extends StatefulWidget {
  static const routeName = '\ForgetPassword';

  @override
  State<ForgotPassworScreen> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgotPassworScreen> {
  bool _isLoading = false;

  TextEditingController _emailController = TextEditingController();

  void ForgetPassword() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthController().forgotPassword(_emailController.text);
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      showSnackBar('Reset Link has been sent to the provided email', context);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forget Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(8),
                hintText: 'Enter email',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: InkWell(
                onTap: () {
                  ForgetPassword();
                  _emailController.clear();
                },
                child: Center(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
                          'Reset Password',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}