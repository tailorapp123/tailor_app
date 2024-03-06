
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, SystemUiOverlayStyle, rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/home/screens/user_home_page.dart';
import 'package:taylor_app/utils/base_state.dart';

import 'modules/auth/screens/login_screen.dart';
import 'modules/home/home_controller/home_bloc.dart';

class SplashScreen extends StatefulWidget {


  SplashScreen({Key? key}) : super(key: key);

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  HomeBloc _bloc = new HomeBloc(initialState: Loading());
  bool isLoggedIn = false;

  _SplashScreenState();

  @override
  void initState() {
    isLoggedIn = false;
    initialize();

    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: BlocProvider(
        create: (_) => _bloc,
        child: buildPage(),
      ),
    );
  }


  Widget buildPage() {
    return BlocListener<HomeBloc, BaseState>(listener: (context, state) {
      if (state is BaseError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: Duration(milliseconds: 3000),
              content: Text('${state.errorMessage}'),
              backgroundColor: Colors.white),
        );
      } else if (state is DataLoaded) {

      }
    }, child: BlocBuilder<HomeBloc, BaseState>(
      builder: (context, state) {
        return Center(
          child:buildUi(context),
        );
      },
    ));
  }
  Future<void> onRefresh()async {
    bool data = false;
  }

  Widget buildUI(state, context) {
    return buildUi(context);
  }

  Widget buildUi(context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black,),
      child: Container(
        color: Colors.black,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Container(
            //   decoration: const BoxDecoration(color: Colors.white),
            // ),
            Stack(
              children: [
                Center(
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 100,
                    child: Icon(Icons.home,color: Colors.red,size: 50,)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initialize() async {
    // getDeviceInfo();
    await Future.delayed(const Duration(milliseconds: 2000));

    if(isLoggedIn){
      navigateToHomePage();
    }
    else {
      navigateToLoginPage();
    }
  }


  navigateToHomePage(){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => UserHomePage(),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }
  navigateToLoginPage(){
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => LoginScreen(),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }





  // getDeviceInfo() async {
  //   DeviceInfo deviceInfo = await FirebaseUtil.getDeviceInfo();
  //   print("FIREBASE TOKEN:::${deviceInfo.androidToken}");
  //
  // }



  _showOptionalUpdateDialog(context, String message) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        String title = "App Update Available";
        String btnLabel = "Update Now";
        String btnOptional = "Update Later";
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 22),
          ),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red),
              //color: MyColors.lm_primaryColor,
              child: Text(btnLabel,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              onPressed: (){},
            ),
            TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.red),
              //color: MyColors.lm_primaryColor,
              child: Text(btnOptional,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
              onPressed: (){

              },
            ),
          ],
        );
      },
    );
  }


}
