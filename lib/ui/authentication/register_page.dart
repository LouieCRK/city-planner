import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/services/networking/authentication_service.dart';
import 'package:uk_city_planner/widgets/snack_bar.dart';
import 'login_page.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        // gradient background within container
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.teal, Colors.cyan],
          ),
        ),
        child: Stack(
          // stack used to be able to stack widgets
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              // back button - direct back to login page
              top: size.height * 0.1,
              left: 22,
              child: IconButton(
                  icon: Icon(Icons.keyboard_backspace_rounded),
                  // icon: Icon(Icons.keyboard_arrow_left_rounded),
                  hoverColor: Colors.grey,
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {
                    print("Register Page - Back button pressed");
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }),
            ),
            Positioned(
              // first name input entry
              top: size.height * 0.25,
              width: size.width * 0.85,
              height: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.3,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.east,
                      color: Colors.white,
                    ),
                    hintText: "First Name",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // email address input entry
              top: size.height * 0.35,
              width: size.width * 0.85,
              height: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.3,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // password input entry
              top: size.height * 0.45,
              width: size.width * 0.85,
              height: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.3,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // confirm password input entry
              top: size.height * 0.55,
              width: size.width * 0.85,
              height: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2.3,
                  ),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                    ),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // registration button
              top: size.height * 0.65,
              width: size.width * 0.85,
              height: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 5))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  child: Text("REGISTER"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    minimumSize: Size(20, 20),
                  ),
                  onPressed: () async {
                    // on register button pressed, send credentials to service
                    String test = "";
                    bool noErrors = false;
                    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
                      test = "Passwords don't match.";
                    } else {
                      test = await context
                          .read<AuthenticationService>()
                          .signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()) as String;
                      noErrors = true;

                    }
                    // error messages

                    if (test == 'Signed in') {
                      context.read<AuthenticationService>().signUp(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                      ScaffoldMessenger.of(context)
                          .showSnackBar(LoginMessages().credentialSuccess());
                    }
                    if (test == 'The email address is badly formatted.') {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(LoginMessages().emailFormat());
                    }
                    if (test == 'Given String is empty or null') {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(RegisterMessages().NoEntry());
                    }
                    if (test == "Passwords don't match.") {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(RegisterMessages().registerFail());
                    }
                    if (test == 'The email address is already in use by another account.') {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(RegisterMessages().userTaken());
                      emailController.text = "";
                    }
                    if (passwordController.text.trim()  != "" && confirmPasswordController.text.trim() != "" ) {
                      if (passwordController.text.trim() == confirmPasswordController.text.trim() && test != 'The email address is badly formatted.') {
                        context.read<AuthenticationService>().signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());
                        ScaffoldMessenger.of(context)
                            .showSnackBar(RegisterMessages().registerConfirm());
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
