import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uk_city_planner/services/networking/authentication_service.dart';
import 'package:uk_city_planner/ui/registration/login_page.dart';
import 'package:uk_city_planner/ui/user-access/home_page.dart';
import 'package:uk_city_planner/ui/user-access/navigation_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // initialize firebase / ensure initialization
  runApp(CityPlannerApp());
}

class CityPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
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
        // todo - uncomment when firebase has been initialised
        home: AuthenticationWrapper(),
        // home: LoginPage(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return NavBar();
    }
    return LoginPage();
  }
}