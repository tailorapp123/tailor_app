// CREATED BY CHANTI  26/01/2024

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:pinput/pinput.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';
import '../auth_controller/auth_bloc.dart';
import 'package:otp_autofill/src/otp_text_edit_controller.dart';
import 'package:otp_autofill/src/otp_interactor.dart';

class OTPScreen extends StatefulWidget {
  String? screenName;
  String? mobileNumber;
  String? id;
  num? otpText;
  bool? isReset;
  OTPScreen({Key? key,this.screenName,this.mobileNumber,this.otpText,this.isReset,this.id}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  _OTPScreenState();
  final AuthBloc _bloc = AuthBloc(initialState: Loading());
  bool isFirst = true;
  bool isLoading = false;
  TextEditingController numberController = TextEditingController();
  String otpErrorText = "";
  int secondsRemaining = 59;
  bool enableResend = false;
  bool isCompleted = true;
  Timer? timer;
  String otpCode = "";
  String otp = "";
  OTPTextEditController? _pinPutController = OTPTextEditController(codeLength: 4);
  late OTPInteractor _otpInteractor;
  String userId="",jewelleryId="";
  TextEditingController forgotController = TextEditingController();


  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle:  TextStyle(
      fontSize: 20,
      color: MyColors().white,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      // color: MyColors().black,
      border: Border.all(color: MyColors().white.withOpacity(0.6),width: 1.0),
      borderRadius: BorderRadius.circular(10),
    ),
  );
  final focusedPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle:  TextStyle(
      fontSize: 20,
      color: MyColors().white,
      fontWeight: FontWeight.w500,
    ),
    decoration: BoxDecoration(
      // color: MyColors().blackT50,
      border: Border.all(color: MyColors().white.withOpacity(0.6),width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  final otpFormKey = GlobalKey<FormState>();


  @override
  void initState() {
    _startTimer();
    // _initInteractor();
    if(widget.screenName =="LOGIN"){
      _pinPutController!.setText("${widget.otpText}");
      isCompleted = true;
    }else{
      _pinPutController!.setText("123456");
      isCompleted = true;
    }
    setState(() {

    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pinPutController!.dispose();
    _bloc.close();
    timer!.cancel();
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
              duration: Duration(milliseconds: 2000),
              content: textCustom(state.errorMessage,14,fontWeight: FontWeight.w600,color: Colors.white),
              backgroundColor: MyColors().buttonColor),
        );
      } else if (state is DataLoaded) {
        //ADD YOUR FUNCTIONALITY


        setState(() {
        });
      }
    }, child: BlocBuilder<AuthBloc, BaseState>(
      bloc: _bloc,
      builder: (context, state) {
        return Center(
          child: buildUI(state, context),
        );
      },
    ));
  }

  Widget buildUI(state, context) {
    return Container(
      color: MyColors().white,
      child: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              // color: MyColors().white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  //APP BAR

                  //BODY
                  Expanded(
                    child: Container(

                      child: SingleChildScrollView(
                        child: Container(
                          margin:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              VerticalSpace(
                                height: 16,
                              ),
                              Column(
                                children:  [
                                  //BODY WIDGETS
                                  Container(
                                      alignment:Alignment.topLeft,
                                      child: Icon(Icons.arrow_back_rounded,)
                                  ).onTap(() => Navigator.pop(context)),
                                  VerticalSpace(
                                    height: 50,
                                  ),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: textCustom("Forgot Password", 22,fontWeight:FontWeight.w500,)
                                  ),

                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: textCustom("Enter your Mobile Number and we’ll send you the OTP to reset your password", 16,fontWeight:FontWeight.w400,)
                                  ),
                                  VerticalSpace(height: 60,),
                                  otpWidget(),
                                  VerticalSpace(),
                                  Visibility(
                                      visible: otpErrorText!=null && otpErrorText.isNotEmpty,
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            textCustom(otpErrorText??"", 14,fontWeight: FontWeight.w500,color: MyColors().errorColor,textAlign: TextAlign.start),
                                            VerticalSpace(),
                                          ],
                                        ),
                                      )),
                                  VerticalSpace(height: 50,),

                                  Container(
                                    margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 16),
                                    child: CustomButton(onClick: () async {


                                    },
                                        buttonText: "Reset Password",
                                        height: 60,
                                        isDisabled:!isCompleted
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //BOTTOM WIDGETS


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  //UI WIDGETS   -> We have to use custom components whatever we have in project.

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: themeCustomText(
            message,
            14,
            textAlign: TextAlign.center,fontWeight: FontWeight.w600,color: Colors.white
        ),
        backgroundColor: Colors.white,
        // behavior: SnackBarBehavior.floating,
        // elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }

  Widget otpWidget(){
    return  Visibility(
      visible: true,
      child: Form(
        key: otpFormKey,
        child: Container(
          alignment: Alignment.center,
          child:  Container(
            margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 10),
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
                        style: const TextStyle(color: Colors.black),
                        onChanged: (value){
                          setState(() {
                            if(value.length == 10){
                              KeyBoardUtils().hideKeyboard(context);
                            }
                          });
                          // updated(state);
                        },
                        controller: forgotController,
                        keyboardType: TextInputType.number,
                        decoration:  InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                          hintText: 'Enter Your Number',
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
        ),
      ),
    );
  }

  //FUNCTIONALITY
  Future<void> onRefresh()async {
    bool data = false;
    // WRITE YOUR REFRESH LOGIC
  }
  _startTimer(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }


  Future<void> _initInteractor() async {
    _otpInteractor = OTPInteractor();
    // You can receive your app signature by using this method.
    final appSignature = await _otpInteractor.getAppSignature();

    _pinPutController = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: _otpInteractor,
    )..startListenRetriever(
          (code) {
        final exp = RegExp(r'(\d{4})');
        return exp.stringMatch(code ?? '') ?? '';
      },
      // additionalStrategies: [
      //   SampleStrategy(),
      // ],
    );

  }

  navigateToOtpScreen() async {
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



  pinPutWidget(){
    Form(
      key: otpFormKey,
      child: Container(
        alignment: Alignment.centerLeft,
        child: Pinput(
          autofocus:false,
          controller: _pinPutController,
          defaultPinTheme: defaultPinTheme,
          focusedPinTheme: focusedPinTheme,
          followingPinTheme: defaultPinTheme,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
          autofillHints: const [AutofillHints.oneTimeCode],
          length: 6,
          toolbarEnabled: true,
          onSubmitted:(String pin ){
            otp = pin;
          },
          onCompleted: (String pin ){
            otp = pin;
          },
          onChanged: (String pin){
            otp = pin;
          },
        ),
      ),
    );
  }



//API CALLS




}
