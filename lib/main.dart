import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uk_city_planner/services/networking/authentication_service.dart';
import 'package:uk_city_planner/ui/registration/login_page.dart';
import 'package:uk_city_planner/ui/user-access/navigation_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // initialize firebase / ensure initialization
  runApp(CityPlannerApp());
}

class CityPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // provide both authentication class and user stream we get from authentication class
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance), // pass firebase authentication instance
        ),
        StreamProvider( // the create provides us with auth service, which allows us to use our getter 'authStateChanges'
          create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'City Planner',
        theme: ThemeData(
          primaryColor: Color(0xffe1fcfc),
          accentColor: Color(0xff1dbfc2),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(), // load authentication wrapper
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>(); // context watch listens for user

    if (firebaseUser != null) { // if user is in firebase db return the homepage
      return NavBar(); // navbar is the home screen, it initialises with the home screen as default
    }
    return LoginPage();  // else stay within login page
  }
}