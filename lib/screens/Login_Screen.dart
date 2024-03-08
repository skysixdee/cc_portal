import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:training_proto_app/screens/login_screen/login_validation.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? isChecked = true;

  final _formKey =
      GlobalKey<FormState>(); // to get context and all only, we use GlobalKey
  String mobileNumber = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: SafeArea(
            child: Center(
          child: Container(
              width: 720,
              height: 531,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 72, left: 180, right: 200),
                        child: Text('LogIn to your Account',
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 180,
                          right: 170,
                        ),
                        child: TextFormField(
                          maxLength: 10,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Mobile Number',
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey[500],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 224, 224, 224)))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your mobile number';
                            } else if (value.length != 10) {
                              return 'Mobile number must be 10 digits';
                            } else if (!RegExp(r'^\d+$').hasMatch(value)) {
                              return 'Only digits are allowed';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            mobileNumber = value!;
                          },
                        ),
                      ),
                      SizedBox(height: 55),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 180,
                          right: 170,
                        ),
                        child: TextFormField(
                          obscureText: true,
                          maxLength: 12,
                          // minLength: 8,
                          decoration: InputDecoration(
                              counterText: '',
                              hintText: 'Password',
                              hintStyle: GoogleFonts.inter(
                                  color: Colors.grey[500],
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 224, 224, 224)))),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the password';
                            } else if (value.length < 8 || value.length > 12) {
                              return 'Password should be between 8 and 12 characters';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 160, right: 150),
                        child: ListTile(
                          leading: Checkbox(
                            value: isChecked,
                            onChanged: (val) {
                              setState(() {
                                isChecked = val;
                              });
                            },
                          ),
                          title: Text(
                            'Remember me',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 137, 137, 137),
                              fontSize: 14,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          trailing: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Colors.pink,
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 180,
                        ),
                        child: Container(
                          width: 180,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: () {
                              
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                )),
                            child: Text(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                                'Login'),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 180),
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 137, 137, 137),
                                  fontSize: 14,
                                  fontFamily: 'Nunito',
                                ),
                                children: [
                              TextSpan(
                                text: 'Don’t have the account?',
                              ),
                              WidgetSpan(child: SizedBox(width: 10)),
                              TextSpan(
                                  text: 'Sign Up!',
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 14,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap =
                                        () {} //by applying cascade notation, .. we are able to perform multiple operations without creating seperate instance to call it.
                                  )
                            ])),
                      )
                    ]),
              )),
        )));
  }
}
