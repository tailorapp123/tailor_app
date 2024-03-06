
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/core/core.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/base_state.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';
import '../auth_controller/auth_bloc.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  String ? isFrom;
  SignupScreen({Key? key,this.isFrom}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignupScreen> {
  final AuthBloc _bloc = AuthBloc(initialState: Loading());
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  int gender = 0;
  String nameError = '';
  String mobileError = '';
  final _controller = TextEditingController();

  _SignUpScreenState();
  bool isShowPasswrod = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
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
    return BlocListener<AuthBloc, BaseState>(
        listener: (context, state) async {
          if (state is BaseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  duration: const Duration(milliseconds: 2000),
                  content: textCustom(state.errorMessage, 14,
                      fontWeight: FontWeight.w600, color: Colors.white),
                  backgroundColor: Colors.greenAccent),
            );
          } else if (state is DataLoaded) {
            //ADD YOUR FUNCTIONALITY

          }
        },
        child: BlocBuilder<AuthBloc, BaseState>(
          bloc: _bloc,
          builder: (context, state) {
            return Center(
              child: buildUI(state, context),
            );
          },
        ));
  }

  Widget buildUI(state, context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //APP BAR
              VerticalSpace(
                height: 10,
              ),

              //BODY
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        // VerticalSpace(height: deviceHeight(context)*0.10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //BODY WIDGETS
                            VerticalSpace(
                              height: 40,
                            ),
                            Container(
                                child: textCustom(
                                    "Create your account", 22,
                                    color: MyColors().black,
                                    fontWeight: FontWeight.w500)),

                            Container(
                              child: textCustom(
                                  "Enter your details to continue", 15,
                                  color: MyColors().black),
                            ),
                            VerticalSpace(
                              height: 26,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                nameWidget(),
                                VerticalSpace(
                                  height: 16,
                                ),
                                mobileWidget(),
                                VerticalSpace(
                                  height: 16,
                                ),
                                emailWidget(),
                                VerticalSpace(
                                  height: 16,
                                ),
                                userNameWidget(),
                                VerticalSpace(
                                  height: 16,
                                ),
                                passwordWidget(),
                                VerticalSpace(
                                  height: 16,
                                ),
                                // genderWidget(),
                                // VerticalSpace(
                                //   height: 16,
                                // ),

                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //BOTTOM WIDGETS
              createAccountButtonWidget(),
              VerticalSpace(height: 16,),
              Container(
                alignment: Alignment.center,
                color: MyColors().transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textCustom(
                        "Already have an account? ", 14,
                        color: MyColors().textLightGrey,
                        textAlign: TextAlign.center),
                    textCustom(" Login", 14,
                        color: MyColors().black,
                        fontWeight: FontWeight.w600)
                  ],
                ),
              ).onTap(() async {
                var res = await Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) =>
                        UserHomePage(),
                        // LoginScreen(isFrom: 'SIGNUP',),
                    transitionDuration:
                    Duration(milliseconds: 500),
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c),
                  ),
                );
              }),
              VerticalSpace(
                height: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget createAccountButtonWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
      child: CustomButton(
        onClick: () async {
          //   print(   "CheckEmail:::${emailController.text}");
          //   if (emailController.text.isEmpty){
          //     Validations.validateEmail(emailController.text);
          //
          //   }else(
          //       showError(context, "Please Enter Valid Mail Id")
          //   );


        },
        buttonText: "Create Account",
        isDisabled: nameController.text.isNotEmpty && mobileController.text.length==10 && gender>0 && emailController.text.isNotEmpty && userNameController.text.isNotEmpty && passwordController.text.isNotEmpty ? false : true,
      ),
    );
  }

  Widget nameWidget() {
    return Container(
      width: deviceWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyColors().black),
        borderRadius: BorderRadius.circular(12.0),
        color: MyColors().white,
      ),
      child: Container(
        //  width: deviceWidth(context) * 0.54,
        child: TextField(
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          onChanged: (value) {},
          controller: nameController,
          // maxLength: 10,
          // keyboardType: TextInputType.number,

          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: 'Enter Name',
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(
                color: MyColors().black.withOpacity(0.4), fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget userNameWidget() {
    return Container(
      width: deviceWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyColors().black),
        borderRadius: BorderRadius.circular(12.0),
        color: MyColors().white,
      ),
      child: Container(
        //  width: deviceWidth(context) * 0.54,
        child: TextField(
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
          onChanged: (value) {},
          controller: userNameController,
          // maxLength: 10,
          // keyboardType: TextInputType.number,

          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: 'Enter Uesr Name',
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(
                color: MyColors().black.withOpacity(0.4), fontSize: 14),
          ),
        ),
      ),
    );
  }

  Widget mobileWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyColors().black),
        borderRadius: BorderRadius.circular(12.0),
        color: MyColors().white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                  child: textCustom("+91", 16,
                      fontWeight: FontWeight.w800, color: MyColors().black))
                  .onTap(() {}),
              Container(
                width: deviceWidth(context) * 0.54,
                child: TextField(
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  onChanged: (value) {

                  },
                  controller: mobileController,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    counterText: '',
                    border: InputBorder.none,
                    hintText: 'Enter Mobile Number',
                    contentPadding: EdgeInsets.only(left: 10),
                    hintStyle: TextStyle(
                        color: MyColors().black.withOpacity(0.4), fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget emailWidget() {
    return Container(
      width: deviceWidth(context),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: MyColors().black),
        borderRadius: BorderRadius.circular(12.0),
        color: MyColors().white,
      ),
      child: Container(
        width: deviceWidth(context) * 0.54,
        child: TextField(
          cursorColor: Colors.black,
          style: TextStyle(color: Colors.black),
          onChanged: (value) {},
          controller: emailController,
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: 'Enter Email Address',
            contentPadding: EdgeInsets.only(left: 10),
            hintStyle: TextStyle(
                color: MyColors().black.withOpacity(0.4), fontSize: 14),
          ),
        ),
      ),

    );

  }
  Widget passwordWidget(){
    return Container(
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
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  width: deviceWidth(context) *0.74,
                  child: TextField(
                    cursorColor: Colors.black,
                    obscureText: isShowPasswrod,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value){
                      setState(() {
                        if(value.length == 10){
                          KeyBoardUtils().hideKeyboard(context);
                        }
                      });
                    },
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    decoration:  InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      contentPadding: EdgeInsets.only(left: 10),
                      hintStyle: TextStyle(color: MyColors().black.withOpacity(0.4),fontSize: 14),
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
          ),

        ],
      ),
    );
  }

  Widget genderWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      width: deviceWidth(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textCustom("Select Gender", 16,
              color: MyColors().white.withOpacity(0.9)),
          VerticalSpace(),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        gender == 1
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: gender == 1
                            ? MyColors().white
                            : MyColors().grey.withOpacity(0.8),
                      ),
                      HorizontalSpace(
                        width: 4,
                      ),
                      themeCustomText("Male", 12,
                          color: MyColors().white.withOpacity(0.8)),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    gender = 1;
                    // AppDataHelper.gender = 1;
                  });
                }),
              ),
              HorizontalSpace(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        gender == 2
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: gender == 2
                            ? MyColors().white
                            : MyColors().grey.withOpacity(0.8),
                      ),
                      HorizontalSpace(
                        width: 4,
                      ),
                      themeCustomText("Female", 12,
                          color: MyColors().white.withOpacity(0.8)),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    gender = 2;
                    // AppDataHelper.gender = 2;
                  });
                }),
              ),
              HorizontalSpace(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        gender == 3
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: gender == 3
                            ? MyColors().white
                            : MyColors().grey.withOpacity(0.8),
                      ),
                      HorizontalSpace(
                        width: 4,
                      ),
                      themeCustomText("Others", 12,
                          color: MyColors().white.withOpacity(0.8)),
                    ],
                  ),
                ).onTap(() {
                  setState(() {
                    gender = 3;
                    // AppDataHelper.gender = 3;
                  });
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  //UI WIDGETS   -> We have to use custom components whatever we have in project.
  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: themeCustomText(message, 14,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            color: Colors.white),
        backgroundColor: Colors.white,
        // behavior: SnackBarBehavior.floating,
        // elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }

  //FUNCTIONALITY
  Future<void> onRefresh() async {
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

  navigateToLoginScreen() async {
    var res = await Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => LoginScreen(
          isFrom: 'SIGNUP',
        ),
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (_, a, __, c) =>
            FadeTransition(opacity: a, child: c),
      ),
    );
  }





//API CALLS

}
