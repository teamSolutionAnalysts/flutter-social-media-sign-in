
import 'package:custome_widget/constants.dart';
import 'package:custome_widget/social_login.dart';
import 'package:custome_widget/social_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialSignInScreen extends StatefulWidget{
  String? imagePath;
  socialLogin? platform;
  Function(SocialModel)? callback;
  SocialSignInScreen({@required this.imagePath,@required this.platform,@required this.callback});

  @override
  State<StatefulWidget> createState() => _SocialSignInScreenState();
}

class _SocialSignInScreenState extends State<SocialSignInScreen>{
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagePath!,
      width: 50,
      height: 50,
      fit: BoxFit.fill,
    ).onTap(() async {
      if(widget.platform==socialLogin.google){
        await initGoogleLogin(context)
            .then((value) {
          widget.callback!(value!);
        }).catchError((dynamic e) {
          widget.callback!(e);
        });
      }else if(widget.platform==socialLogin.facebook){
        await initFacebookLogin(context)
            .then((value) {
          widget.callback!(value!);
        }).catchError((dynamic e) {
          widget.callback!(e);
        });
      }else if(widget.platform==socialLogin.apple){
      await initiateSignInWithApple(context)
          .then((value) {
        widget.callback!(value);
      }).catchError((dynamic e) {
        widget.callback!(e);
      });
      }

    });
  }
}