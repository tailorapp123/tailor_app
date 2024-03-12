import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/auth/screens/signup_screen.dart';
import 'package:taylor_app/modules/home/home_controller/home_bloc.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key,}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final HomeBloc _bloc = HomeBloc(initialState: Loading());
  _CartPageState();




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
      child: Stack(
        children: <Widget>[
          Container(
            color: MyColors().backGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //APP BAR
                Column(
                  children: [
                    VerticalSpace(),
                    appBarWidget(),
                    VerticalSpace(),

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
                          VerticalSpace(),
                          carDetailsWidget(),
                          paymentDetailsWidget(),


                        ],
                      ),
                    ),
                  ),
                ),

                //BOTTOM WIDGETS
                costBarWidget(),



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

  Widget appBarWidget(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.transparent,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios,),
                textCustom('Cart', 16,fontWeight: FontWeight.bold)
              ],
            ),
          ).onTap(() {
            Navigator.pop(context);
          }),
          textCustom('Total: 800', 16,fontWeight: FontWeight.bold)
        ],
      ),
    );
  }

  Widget carDetailsWidget(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textCustom('Products', 20,fontWeight: FontWeight.bold),
          VerticalSpace(),
          MediaQuery.removePadding(
            context: context,removeTop: true,
            child: ListView.builder(
                itemCount: 4,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white.withOpacity(0.4),
                          border: Border.all(color: Colors.deepOrange,width: 0.4)
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              textCustom('T shirt', 16,fontWeight: FontWeight.bold),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              textCustom('500', 18,fontWeight: FontWeight.bold),
                              VerticalSpace(),
                              Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color:MyColors().buttonDisabledColor,
                                        border: Border.all(width: 1, color: MyColors().buttonColor),
                                      ),
                                      padding:const EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                                      child: Icon(Icons.remove,size: 18,)),
                                  HorizontalSpace(),
                                  textCustom('2', 18,fontWeight: FontWeight.bold),
                                  HorizontalSpace(),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color:MyColors().buttonDisabledColor,
                                        border: Border.all(width: 1, color: MyColors().buttonColor),
                                      ),
                                      padding:const EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                                      child: Icon(Icons.add,size: 18,))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                  ).onTap(() async {

                  });
                }),
          )
        ],
      ),
    );
  }

  Widget paymentDetailsWidget(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
        color: MyColors().buttonDisabledColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textCustom('Payment Summary', 18,fontWeight: FontWeight.bold),
          VerticalSpace(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCustom('Products Total', 14),
              textCustom('800', 16,fontWeight: FontWeight.bold)
            ],
          ),
          VerticalSpace(),
          Container(
            height: 1,
            width: deviceWidth(context),
            color: Colors.white38,
          ),
          VerticalSpace(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textCustom('Minimum Payable Amount', 14),
              textCustom('200', 16,fontWeight: FontWeight.bold)
            ],
          ),
        ],
      ),
    );
  }

  Widget costBarWidget(){
    return  Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
      color: MyColors().buttonColor,
      width: deviceHeight(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textCustom('Payable Amount', 14,color: Colors.white),
              textCustom('200', 18,fontWeight: FontWeight.bold,color: Colors.white)
            ],
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Icon(Icons.arrow_forward_ios,color: Colors.deepOrange,),
          ).onTap(() async {
            _showSnackBar('Payment Screen Will come soon');
          })
        ],
      ),
    );
  }


  //FUNCTIONALITY
  Future<void> onRefresh()async {
    bool data = false;
    // WRITE YOUR REFRESH LOGIC
  }


}
