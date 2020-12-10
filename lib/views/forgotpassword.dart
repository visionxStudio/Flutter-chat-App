import 'package:chatapp/Widget/widget.dart';
import 'package:chatapp/services/auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController password=new TextEditingController();
  AuthService service=new AuthService();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/forgot.png',height: 200,),
              Text("Enter Your Email Id",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 17,
              ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (val) {
                  return RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(val)
                      ? null
                      : "Please Enter Correct Email";
                },
                style: simpleTextStyle(),
                controller: password,
                decoration: textFieldInputDecoration("email"),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: () {
          service.resetPass(password.text);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xff007EF4),
                          const Color(0xff2A75BC)
                        ],
                      )),
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Send Request",
                    style: biggerTextStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}