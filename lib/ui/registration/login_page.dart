import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uk_city_planner/services/networking/authentication_service.dart';
import 'file:///C:/Users/Crook/Documents/GitHub/uk-city-planner/lib/ui/registration/register_page.dart';
import '../user-access/navigation_bar.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              // username/email input entry
              top: size.height * 0.5,
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
                      Icons.person,
                      color: Colors.white,
                    ),
                    hintText: "Email",
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
              top: size.height * 0.59,
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
            Positioned(
                // 'forgot password?' text button
                top: size.height * 0.655,
                width: 160,
                child: TextButton(
                  child: Text('Forgot Password?'),
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    shadowColor: Colors.black,
                  ),
                  onPressed: () => print('Forgot password pressed...'),
                )),
            Positioned(
              // sign in button
              top: size.height * 0.71,
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
                    child: Text("SIGN IN"),
                    style: TextButton.styleFrom(
                      primary: Colors.black54,
                      minimumSize: Size(20, 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                      // todo - uncomment when firebase has been initialised
                      // context.read<AuthenticationService>().signIn(
                      //   email: emailController.text.trim(),
                      //   password: passwordController.text.trim(),
                      // );
                    },
                    ),
              ),
            ),
            Positioned(
                // 'don't have an account?' text button
                top: size.height * 0.775,
                width: 200,
                child: TextButton(
                    child: Text("Don't have an account?"),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      shadowColor: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    })),
            Positioned(
              // sign up button
              top: size.height * 0.84,
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
                    child: Text("SIGN UP"),
                    style: TextButton.styleFrom(
                      primary: Colors.black54,
                      minimumSize: Size(20, 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
