import 'dart:convert';

import 'package:custome_widget/constants.dart';
import 'package:custome_widget/social_login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';


Future<SocialModel?> initGoogleLogin(BuildContext contex) async {
  SocialModel userModel;
  try {
    var _googleSignIn = GoogleSignIn();
    var googleUser = await _googleSignIn.signIn();

    if (googleUser != null) {
      print("google====${googleUser.email}");
      var googleAuth = await googleUser.authentication;
      var token = await googleAuth.idToken;
      if (googleAuth != null) {
        userModel = SocialModel(
            full_name: googleUser.displayName,
            email: googleUser.email,
            id: googleUser.id,
            accessToken: googleAuth.accessToken,
            status: 200,
            platform: socialLogin.google
            );
        return userModel;
      }
    }
  } on Exception catch (e) {
    if (e is PlatformException) {
      throw SocialModel(status: 500, error: e.message!
          // platform: ApiConstants.google
          );
    }
  }
}



Future<SocialModel?> initFacebookLogin(
    BuildContext context) async {
  SocialModel userModel;
    var facebookLogin = FacebookLogin();
    // facebookLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    var facebookLoginResult = await facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    print("facebook login resutl===${facebookLoginResult.status}=====${facebookLoginResult.error}");
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        throw SocialModel(
            error: facebookLoginResult.error!.developerMessage,
            status: 500);
        break;
      case FacebookLoginStatus.cancel:
        throw SocialModel(
            error: "Cancel by user",
            status: 500);;
        break;
      case FacebookLoginStatus.success:
        FacebookUserProfile? profile = await facebookLogin.getUserProfile();
        print("facebook login resutl===${facebookLoginResult.status}=====${profile!.toMap().toString()}");
        userModel = SocialModel(
            full_name: profile.name,
            email: facebookLoginResult.accessToken!.permissions.contains(FacebookPermission.email.name)? await facebookLogin.getUserEmail():"",
            id: profile.userId,
            first_name: profile.firstName,
            last_name: profile.lastName,
            accessToken: facebookLoginResult.accessToken!.token,
            status: 200,
            platform: socialLogin.facebook
        );
        return userModel;
        break;
    }
}

Future logOut(String provider) async {
  FacebookLogin().logOut();
}

Future<SocialModel> initiateSignInWithApple(BuildContext context) async {
  if (await SignInWithApple.isAvailable()) {
    try{
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      print("...email......${credential.email}");
      print("...given name......${credential.givenName}");
      print("....authcode.....${credential.authorizationCode}");
      print("....familyName.....${credential.familyName}");
      print("....identityToken.....${credential.identityToken}");
      print("....state.....${credential.state}");
      print("....userIdentifier.....${credential.userIdentifier}");
      return SocialModel(id: credential.authorizationCode,email: credential.email,full_name: "${credential.givenName} ${credential.familyName}",
          platform: socialLogin.apple,accessToken: credential.identityToken,appleUserToken: credential.userIdentifier,status: 200);
    }catch(e){
      throw SocialModel(
          error: "Not able to sign in.",
          status: 500);
  }}else{
    throw SocialModel(
        error: "Not able to sign in.",
        status: 500);
  }
}
