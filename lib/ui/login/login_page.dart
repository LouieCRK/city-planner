import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

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
        child: Stack( // stack used to be able to stack widgets
          alignment: Alignment.center,
          children: <Widget>[
            Positioned( // logo/banner at the top of the screen
              top: 0,
              width: size.width,
              child: Image.asset(
                'assets/images/login-banner.png',
              ),
            ),

            Positioned( // username/email input entry
              top: 400,
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
                    hintText: "Username or Email",
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ),

            Positioned( // password input entry
              top: 480,
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
                      Icons.lock,
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

            Positioned( // 'forgot password?' text button
              top: 535,
              width: 160,
              child: TextButton(
                child: Text('Forgot Password?'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  shadowColor: Colors.black,
                ),
                onPressed: () => print ('Forgot password pressed...'),
              )
            ),

            Positioned( // sign in button
              top: 587,
              width: size.width * 0.85,
              height: 50,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 5)
                    )],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: TextButton(
                  child: Text("SIGN IN"),
                  style: TextButton.styleFrom(
                    primary: Colors.black54,
                    minimumSize: Size(20,20),
                  ),
                  onPressed: () => print ("Sign in pressed..."),
                ),
              ),
            ),

            Positioned( // 'don't have an account?' text button
                top: 643,
                width: 200,
                child: TextButton(
                  child: Text("Don't have an account?"),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shadowColor: Colors.black,
                  ),
                  onPressed: () => print ("Don't have account pressed..."),
                )
            ),

            Positioned( // sign up button
              top: 695,
              width: size.width * 0.85,
              height: 50,
              child: NewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 5)
          )],
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextButton(
        child: Text("SIGN UP"),
        style: TextButton.styleFrom(
          primary: Colors.black54,
          minimumSize: Size(20,20),
        ),
        onPressed: () => print ("Sign up pressed..."),
      ),
    );
  }
}

