import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/auth/screens/login_screen.dart';
import 'package:taylor_app/modules/auth/screens/signup_screen.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';
import '../auth_controller/auth_bloc.dart';
import 'otp_screens.dart';

class GenderSelectionPage extends StatefulWidget {
  const GenderSelectionPage({Key? key,}) : super(key: key);

  @override
  State<GenderSelectionPage> createState() => _GenderSelectionPageState();
}

class _GenderSelectionPageState extends State<GenderSelectionPage> {
  final AuthBloc _bloc = AuthBloc(initialState: Loading());
  _GenderSelectionPageState();
  String selectedGender = '';




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
            color: MyColors().backGroundColor,
            // decoration: BoxDecoration(
            //     image: DecorationImage(image: AssetImage('assets/background_image.png'),fit: BoxFit.fill)
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //APP BAR
                Column(
                  children: [
                    VerticalSpace(height: deviceHeight(context)*0.10,),
                    Container(margin: const EdgeInsets.symmetric(vertical: 10),
                        child: textCustom("Hello", 22,color: MyColors().black,fontWeight: FontWeight.bold)).onTap(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen()));
                    }),
                    Container(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: textCustom("Choose Your Gender", 15,color: Colors.black),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset('assets/men_icon.png',width: 100,),
                                      textCustom('Men', 26,fontWeight: FontWeight.bold)
                                    ],
                                  ).onTap(() {
                                    selectedGender = 'MEN';
                                    setState(() {

                                    });
                                    print(selectedGender);
                                  }),
                                  Column(
                                    children: [
                                      Image.asset('assets/women_icon.png',width: 90,),
                                      textCustom('Women', 26,fontWeight: FontWeight.bold)
                                    ],
                                  ).onTap(() {
                                    selectedGender = 'WOMEN';
                                    setState(() {

                                    });
                                    print(selectedGender);
                                  }),
                                ],
                              )

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
                  child: CustomButton(
                    onClick: () async {
                      var res = await Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => UserHomePage(),
                          transitionDuration: Duration(milliseconds: 500),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      );
                  },
                    buttonText: "Save",
                    height: 60,
                    isDisabled: selectedGender.isEmpty,),
                ),
                VerticalSpace(height: 24,),

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
  


}
