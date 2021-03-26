import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
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
              // logo/banner at the top of the screen
              top: 0,
              width: size.width,
              child: Image.asset(
                'assets/images/login-banner.png',
              ),
            ),
            Positioned(
              // back button - direct back to login page
              top: size.height * 0.07,
              left: -4,
              child: IconButton(
                  // icon: Icon(Icons.keyboard_backspace_rounded),
                  icon: Icon(Icons.keyboard_arrow_left_rounded),
                  hoverColor: Colors.grey,
                  iconSize: 50,
                  color: Colors.cyan,
                  onPressed: () {
                    Navigator.of(context).pop(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  }),
            ),
            Positioned(
              // first name input entry
              top: size.height * 0.48,
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
              // username input entry
              top: size.height * 0.565,
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
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: "Username",
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
              top: size.height * 0.65,
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
              top: size.height * 0.735,
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
              top: size.height * 0.82,
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
              top: size.height * 0.905,
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
                  onPressed: () => print("Register pressed..."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
