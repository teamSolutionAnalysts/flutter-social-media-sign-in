
import 'package:custome_widget/social_login_model.dart';
import 'package:custome_widget/social_login_sc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:custome_widget/constants.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.purple, // status bar color
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue,
        primaryColorDark: Colors.blue,
        primaryColorLight: Colors.blue,
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.deepPurple,
    //     statusBarIconBrightness: Brightness.light,
    //     statusBarBrightness: Brightness.dark
    // ));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black,
    ));
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Social Login"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialSignInScreen(imagePath: "assets/images/ic_google.png",platform:socialLogin.google,callback: (SocialModel data){
                      print("google sign in======${data.email}");
                      _handelSocialLogin(data);
                  },).paddingRight(30),
                  SocialSignInScreen(imagePath: "assets/images/ic_facebook.png",platform:socialLogin.facebook,callback: (SocialModel data){
                    print("facebook sign in======${data.email}");
                    _handelSocialLogin(data);
                  },).paddingRight(30),
                  SocialSignInScreen(imagePath: "assets/images/ic_apple.png",platform:socialLogin.apple,callback: (SocialModel data){
                    print("apple sign in======${data.email}");
                    _handelSocialLogin(data);
                  },)
                ],
              )
            ],
          ),
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _handelSocialLogin(dynamic data){
    if(data.status==200){
      print(data);
    }else{
      print(data.error!);
    }
  }
}
