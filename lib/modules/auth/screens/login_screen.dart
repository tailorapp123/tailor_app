import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/auth/screens/gender_selection.dart';
import 'package:taylor_app/modules/auth/screens/signup_screen.dart';
import 'package:taylor_app/modules/home/screens/admin_home_page.dart';
import 'package:taylor_app/modules/home/screens/taylor_home_page.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';
import '../auth_controller/auth_bloc.dart';
import 'otp_screens.dart';

class LoginScreen extends StatefulWidget {
  final String? screen;
  LoginScreen({Key? key,this.screen}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreeState();
}

class _LoginScreeState extends State<LoginScreen> {
  final AuthBloc _bloc = AuthBloc(initialState: Loading());
  _LoginScreeState();
  bool isShowPasswrod = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController PasswrodController = TextEditingController();



  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.close();
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
    return BlocListener<AuthBloc, BaseState>(listener: (context, state) async {
      if (state is BaseError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              duration: const Duration(milliseconds: 3000),
              content: textCustom(state.errorMessage,14,fontWeight: FontWeight.w600,color: Colors.white),
              backgroundColor: Colors.greenAccent),
        );
      } else if (state is DataLoaded) {
        //ADD YOUR FUNCTIONALITY

      }
    }, child: BlocBuilder<AuthBloc, BaseState>(
      bloc: _bloc,
      builder: (context, state) {
        return Center(
          child: buildUI(state,context),
        );
      },
    ));
  }

  Widget buildUI(state, context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            color: MyColors().backGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //APP BAR
                VerticalSpace(height: deviceHeight(context)*0.05,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          // padding: EdgeInsets.only(left: 14),
                          child: textCustom('Sign In', 20,fontWeight: FontWeight.bold)),
                      VerticalSpace(height: 14,),
                      Container(height:1.6,width: deviceWidth(context),color: Colors.black,),
                      VerticalSpace(),
                    ],
                  ),
                ),
                VerticalSpace(height: 12,),
                Container(
                  child: Image.asset('assets/new_logo.jpeg',height: 120,),
                ),

                //BODY
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          VerticalSpace(height: deviceHeight(context)*0.10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                              //BODY WIDGETS
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1, color: MyColors().buttonColor),
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: MyColors().buttonColor.withOpacity(0.3),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          color:Colors.transparent,
                                          width: deviceWidth(context) * 0.54,
                                          child: TextField(
                                            style: TextStyle(color: Colors.black),
                                            onChanged: (value){
                                              setState(() {
                                                if(value.length == 10){
                                                  KeyBoardUtils().hideKeyboard(context);
                                                }
                                              });
                                              // updated(state);
                                            },
                                            controller: userNameController,
                                            keyboardType: TextInputType.text,
                                            decoration:  InputDecoration(
                                              counterText: '',
                                              border: InputBorder.none,
                                              hintText: 'Username',
                                              contentPadding: EdgeInsets.only(left: 10),
                                              hintStyle: TextStyle(color: MyColors().grey.withOpacity(0.8),fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              VerticalSpace(height: 24,),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),

                                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                decoration: BoxDecoration(
                                  // border: Border.all(width: 1, color: MyColors().buttonColor),
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: MyColors().buttonColor.withOpacity(0.3),
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: deviceWidth(context) *0.74,
                                          child: TextField(
                                            style: TextStyle(color: Colors.black),
                                            obscureText: isShowPasswrod,
                                            onChanged: (value){
                                              setState(() {
                                                if(value.length == 10){
                                                  KeyBoardUtils().hideKeyboard(context);
                                                }
                                              });
                                              // updated(state);
                                            },
                                            controller: PasswrodController,
                                            keyboardType: TextInputType.text,
                                            decoration:  InputDecoration(
                                              counterText: '',
                                              border: InputBorder.none,
                                              hintText: 'Password',
                                              contentPadding: EdgeInsets.only(left: 10),
                                              hintStyle: TextStyle(color: MyColors().grey.withOpacity(0.8),fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        Icon( isShowPasswrod ? Icons.visibility_off :Icons.visibility,color: MyColors().black,).onTap(() {
                                          isShowPasswrod = !isShowPasswrod;
                                          setState(() {

                                          });

                                        })
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                              //   alignment: Alignment.centerRight,
                              //   child: textCustom("Forgot Password?",14, color: MyColors().black,fontWeight: FontWeight.bold).onTap(() {
                              //
                              //   }),
                              // ),
                              VerticalSpace(height: 36,),
                              Container(
                                width: deviceWidth(context)/1.8,
                                margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                                child: CustomButton(
                                  onClick: () async {
                                    navigateToHomeScreen();
                                  },
                                  buttonText: "Login",
                                  height: 60,
                                  isDisabled: false,),
                              ),
                              VerticalSpace(height: 20,),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

                //BOTTOM WIDGETS


                VerticalSpace(height: 24,),
                Container(
                  color: MyColors().transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      textCustom("Signup", 18,color: MyColors().black,textAlign: TextAlign.center,fontWeight: FontWeight.w500),
                      textCustom(" Forget Password", 18,color: MyColors().black,fontWeight: FontWeight.w500)
                    ],
                  ),
                ).onTap(() async {
                  var res = await Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => SignupScreen(),
                      transitionDuration: Duration(milliseconds: 500),
                      transitionsBuilder: (_, a, __, c) =>
                          FadeTransition(opacity: a, child: c),
                    ),
                  );
                }),
                VerticalSpace(height: 20,),

              ],
            ),
          ),
        ],
      ),
    );
  }


  //UI WIDGETS   -> We have to use custom components whatever we have in project.


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 5000),
        content: themeCustomText(
            message,
            14,
            textAlign: TextAlign.center,fontWeight: FontWeight.w600,color: Colors.white
        ),
        backgroundColor: MyColors().buttonColor,
        // behavior: SnackBarBehavior.floating,
        // elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }


  //FUNCTIONALITY
  Future<void> onRefresh()async {
    bool data = false;
    // WRITE YOUR REFRESH LOGIC
  }



  navigateToHomeScreen() async {
    if(widget.screen == 'CUSTOMER'){
      var res = await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => GenderSelectionPage(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
    }else if(widget.screen == 'TAILOR'){
      var res = await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => TaylorHomePage(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
    }else{
      var res = await Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => AdminHomePage(),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );
    }

  }




}
