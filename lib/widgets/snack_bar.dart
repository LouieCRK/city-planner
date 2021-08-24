import 'package:flutter/material.dart';

class RegisterMessages {
  // user registration is successful
  SnackBar registerConfirm() {
    final userRegistered = SnackBar(
      content: Text('User registered.'),
      behavior: SnackBarBehavior.floating,
    );
    return userRegistered;
  }

  // user registration failed
  SnackBar registerFail() {
    final registerFail = SnackBar(
      content: Text('Passwords do not match.'),
      behavior: SnackBarBehavior.floating,
    );
    return registerFail;
  }

  SnackBar NoEntry() {
    final SnackBar NoEntry = SnackBar(
      content: Text('Please enter all fields.'),
      behavior: SnackBarBehavior.floating,
    );
    return NoEntry;
  }

  SnackBar userTaken() {
    final SnackBar userTaken = SnackBar(
      content: Text('The email address is already in use by another account.'),
      behavior: SnackBarBehavior.floating,
    );
    return userTaken;
  }
}

class LoginMessages {
  // email / password is incorrect
  SnackBar credentialFail() {
    final credentialFail = SnackBar(
      content: Text('Email or password is incorrect.'),
      behavior: SnackBarBehavior.floating,
    );
    return credentialFail;
  }

  SnackBar wrongPassword() {
    final wrongPassword = SnackBar(
      content: Text('The password entered is invalid for this user.'),
      behavior: SnackBarBehavior.floating,
    );
    return wrongPassword;
  }

  // login successful
  SnackBar credentialSuccess() {
    final credentialSuccess = SnackBar(
      content: Text('Login Successful.'),
      behavior: SnackBarBehavior.floating,
    );
    return credentialSuccess;
  }

  // email format incorrect
  SnackBar emailFormat() {
    final emailFormat = SnackBar(
      content: Text('Email is not formatted correctly.'),
      behavior: SnackBarBehavior.floating,
    );
    return emailFormat;
  }

  // login successful
  SnackBar NoEntry() {
    final SnackBar NoEntry = SnackBar(
      content: Text('Please enter your email & password.'),
      behavior: SnackBarBehavior.floating,
    );
    return NoEntry;
  }
}

class LogoutMessages {

  SnackBar logoutMessage() {
    final SnackBar logoutMessage = SnackBar(
      content: Text('User logged out.'),
      behavior: SnackBarBehavior.floating,
    );
    return logoutMessage;
  }

}
