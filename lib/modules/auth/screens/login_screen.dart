import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/auth/screens/signup_screen.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';
import '../auth_controller/auth_bloc.dart';
import 'otp_screens.dart';

class LoginScreen extends StatefulWidget {
  String? isFrom;
  LoginScreen({Key? key,this.isFrom}) : super(key: key);

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
        if(state.event == 'SignInEvent'){
          if(state.data!=null){
            if(state.data == "User doesn't exits, Please try again!"){
              // navigateToSignUpScreen();
            }else{
              navigateToHomeScreen();
            }
          }else{
            showError(context, 'Something went wrong');
          }
        }
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
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //APP BAR
                Column(
                  children: [
                    VerticalSpace(height: deviceHeight(context)*0.10,),
                    Container(margin: const EdgeInsets.symmetric(vertical: 10),
                        child: textCustom("Hello", 22,color: MyColors().black,fontWeight: FontWeight.w500)).onTap(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
                    }),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: textCustom("Login to your account", 15,color: Colors.black),
                    ),
                  ],
                ),


                //BODY
                Expanded(
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          VerticalSpace(height: deviceHeight(context)*0.20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children:  [
                              //BODY WIDGETS
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                                padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1, color: MyColors().black),
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: MyColors().white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
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
                                              hintText: 'Enter User Name',
                                              contentPadding: EdgeInsets.only(left: 10),
                                              hintStyle: TextStyle(color: MyColors().black.withOpacity(0.8),fontSize: 14),
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
                                  border: Border.all(width: 1, color: MyColors().black),
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: MyColors().white,
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
                                              hintText: 'Enter Password',
                                              contentPadding: EdgeInsets.only(left: 10),
                                              hintStyle: TextStyle(color: MyColors().black.withOpacity(0.8),fontSize: 14),
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
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                                alignment: Alignment.centerRight,
                                child: textCustom("Forgot Password?",14, color: MyColors().white,).onTap(() {

                                }),
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

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                  child: CustomButton(onClick: () async {

                  }, buttonText: "Login",height: 60,isDisabled: false,),
                ),
                VerticalSpace(height: 24,),
                Container(
                  color: MyColors().transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textCustom("Don’t have an account? ", 14,color: MyColors().black,textAlign: TextAlign.center),
                      textCustom(" Signup", 14,color: MyColors().black,fontWeight: FontWeight.w600)
                    ],
                  ),
                ).onTap(() async {
                  var res = await Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => SignupScreen(
                        isFrom: 'LOGIN',
                      ),
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
    var res = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => UserHomePage(),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }


  // navigateToSignUpScreen() async {
  //   var res = await Navigator.push(
  //     context,
  //     PageRouteBuilder(
  //       pageBuilder: (_, __, ___) => SignUpScreen(),
  //       transitionDuration: Duration(milliseconds: 500),
  //       transitionsBuilder: (_, a, __, c) =>
  //           FadeTransition(opacity: a, child: c),
  //     ),
  //   );
  // }

  //API CALLS


}
