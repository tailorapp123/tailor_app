import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/auth/screens/gender_selection.dart';
import 'package:taylor_app/modules/auth/screens/login_screen.dart';
import 'package:taylor_app/modules/auth/screens/signup_screen.dart';
import 'package:taylor_app/modules/home/home_controller/home_bloc.dart';
import 'package:taylor_app/modules/home/screens/admin_home_page.dart';
import 'package:taylor_app/modules/home/screens/taylor_home_page.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';

class LoginTypePage extends StatefulWidget {
  const LoginTypePage({Key? key,}) : super(key: key);

  @override
  State<LoginTypePage> createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  final HomeBloc _bloc = HomeBloc(initialState: Loading());
  _LoginTypePageState();




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
    return BlocListener<HomeBloc, BaseState>(listener: (context, state) async {
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
    }, child: BlocBuilder<HomeBloc, BaseState>(
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
      child: Container(
        color: MyColors().backGroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textCustom('Please Select Login', 18,fontWeight: FontWeight.bold),
              VerticalSpace(height: deviceHeight(context)*0.1,),
              CustomButton(
                  isDisabled: false,
                  onClick: (){
                    navigateToScreen('CUSTOMER');
                  },
                  buttonText: 'Customer'
              ),
              VerticalSpace(height: deviceHeight(context)*0.06,),
              CustomButton(
                  isDisabled: false,
                  onClick: (){
                    navigateToScreen('TAILOR');
                  },
                  buttonText: 'Tailor'
              ),
              VerticalSpace(height: deviceHeight(context)*0.06,),
              CustomButton(
                  isDisabled: false,
                  onClick: (){
                    navigateToScreen('ADMIN');
                  },
                  buttonText: 'Admin'
              ),
            ],
          ),
        ),
      ),
    );
  }


  //UI WIDGETS   -> We have to use custom components whatever we have in project.


  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 2000),
        content: themeCustomText(
            message,
            14,
            textAlign: TextAlign.center,fontWeight: FontWeight.w600,color:MyColors().buttonColor
        ),
        backgroundColor: MyColors().white,
        // behavior: SnackBarBehavior.floating,
        // elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
        ),
      ),
    );
  }

  navigateToScreen(String screen) async {
      var res = await Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginScreen(screen: screen,),
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
        ),
      );

  }


  //FUNCTIONALITY
  Future<void> onRefresh()async {
    bool data = false;
    // WRITE YOUR REFRESH LOGIC
  }


}
