import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/modules/auth/screens/signup_screen.dart';
import 'package:taylor_app/modules/common/tabs_model.dart';
import 'package:taylor_app/modules/home/home_controller/home_bloc.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../utils/KeyboardUtils.dart';
import '../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../../utils/custom_button.dart';
import '../../home/screens/user_home_page.dart';

class TaylorHomePage extends StatefulWidget {
  const TaylorHomePage({Key? key,}) : super(key: key);

  @override
  State<TaylorHomePage> createState() => _TaylorHomePageState();
}

class _TaylorHomePageState extends State<TaylorHomePage> {
  final HomeBloc _bloc = HomeBloc(initialState: Loading());
  _TaylorHomePageState();
  List<TabListModel> statusTabs = [];
  TabListModel selectedTab = TabListModel();




  @override
  void initState() {
    _updateData();
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
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            color: MyColors().backGroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //APP BAR
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            textCustom('Ajay', 20,fontWeight: FontWeight.bold),
                            textCustom('Total Orders: 10', 16,fontWeight: FontWeight.bold),
                          ],
                        )
                    ),
                    VerticalSpace(height: 16,),
                    tabsWidget(),
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
                          ordersWidget(),
                        ],
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

  Widget ordersWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // textCustom('Orders', 18,fontWeight: FontWeight.bold),
        VerticalSpace(),
        MediaQuery.removePadding(
          context: context,removeTop: true,
          child: ListView.builder(
              itemCount: 10,
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
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/sihrt_image.jpg',width: 80)
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            textCustom('T shirt', 16,fontWeight: FontWeight.bold),
                            VerticalSpace(),
                            textCustom('500', 14),
                            VerticalSpace(),
                            Container(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: MyColors().buttonColor,
                                    border: Border.all(color: Colors.deepOrange,width: 0.4)
                                ),
                                child: textCustom('Mark As Completed', 16,color: Colors.white))

                          ],
                        )
                      ],
                    )
                ).onTap(() async {

                });
              }),
        )
      ],
    );
  }

  Widget tabsWidget() {
    return Container(
      height: 40,
      width: deviceWidth(context),
      child: ListView.builder(
          itemCount:statusTabs.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: statusTabs[index].isSelected! ? MyColors().buttonColor : Colors.white.withOpacity(0.4),
                    border: Border.all(color:  Colors.deepOrange,width: 0.4)
                ),
                child: textCustom('${statusTabs[index].title}', 14,color:statusTabs[index].isSelected! ? Colors.white :  Colors.deepOrange)
            ).onTap(() {
              for(int i=0;i < statusTabs.length;i++){
                statusTabs[i].isSelected = false;
              }
              statusTabs[index].isSelected = true;
              setState(() {

              });
            });
          }),
    );
  }


  //FUNCTIONALITY
  Future<void> onRefresh()async {
    bool data = false;
    // WRITE YOUR REFRESH LOGIC
  }

  _updateData(){
    TabListModel tabListModel = TabListModel();
    tabListModel.title = "All";
    tabListModel.isSelected = true;
    statusTabs.add(tabListModel);
    TabListModel tabListModel1 = TabListModel();
    tabListModel1.title = "New";
    tabListModel1.isSelected = false;
    statusTabs.add(tabListModel1);
    TabListModel tabListModel2 = TabListModel();
    tabListModel2.title = "Completed";
    tabListModel2.isSelected = false;
    statusTabs.add(tabListModel2);
    selectedTab = statusTabs[0];
    setState(() {

    });
  }


}
