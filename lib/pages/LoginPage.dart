import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var _formKey = GlobalKey<FormState>();
  var emailFormController = TextEditingController();
  var passwordFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 40, bottom: 80, left: 30, right: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: Text(
                              "Login to access",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(24, 132, 111, 0.8),
                              ),
                            ),
                          ),
                          Text(
                            "Sign in with your email and password of continue with social media",
                            style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                            ),
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        maxLength: 30,
                        autofocus: true,
                        controller: emailFormController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please enter your email!";
                          bool emailValid = RegExp(
                              r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                              .hasMatch(value);
                          if (!emailValid)
                            return "Your email is invalid. Please re-enter email!";
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                          hintText: "Enter your email",
                          labelText: "Email",
                          suffixIcon: Icon(Icons.email),
                          iconColor: Color.fromRGBO(24, 132, 111, 0.8),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color.fromRGBO(24, 132, 111, 0.8)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color.fromRGBO(24, 132, 111, 0.8)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 40),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordFormController,
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return "Please enter your password!";
                          if (value.length < 8)
                            return "Your password cannot be more less 8 characters!";
                          return null;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
                          hintText: "Enter your password",
                          labelText: "Password",
                          iconColor: Color.fromRGBO(24, 132, 111, 0.8),
                          suffixIcon: Icon(Icons.lock),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color.fromRGBO(24, 132, 111, 0.8)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 2, color: Color.fromRGBO(24, 132, 111, 0.8)),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot a password?",
                          style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            color: Colors.black26,
                          ),
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 60),
                      child: ElevatedButton(
                        onPressed: () {
                          var email = emailFormController.text;
                          var password = passwordFormController.text;
                          if (_formKey.currentState!.validate() && authentication(email, password)) {
                            Navigator.pushNamed(context, "homePage");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Login failed. Please check the information again!")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          primary: Color.fromRGBO(24, 132, 111, 0.8),
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                        ),
                        child: Text("Login",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            alignment: Alignment.center,
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                                color: Colors.grey.shade300),
                            child: TextButton(
                              child: Icon(Icons.account_circle),
                              style: TextButton.styleFrom(
                                primary: Color.fromRGBO(24, 132, 111, 0.8),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            alignment: Alignment.center,
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                                color: Colors.grey.shade300),
                            child: TextButton(
                              child: Icon(Icons.facebook),
                              style: TextButton.styleFrom(
                                primary: Color.fromRGBO(24, 132, 111, 0.8),
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                                color: Colors.grey.shade300),
                            child: TextButton(
                              child: Icon(Icons.apple),
                              style: TextButton.styleFrom(
                                primary: Color.fromRGBO(24, 132, 111, 0.8),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 30),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, "registerPage");
                                },
                              text: "Sign up",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color.fromRGBO(24, 132, 111, 0.8),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

authentication(String email, String passWord) {
  if (email == 'duy9117@gmail.com' && passWord == 'lecongquocduy1003') {
    return true;
  } else {
    return false;
  }
}
