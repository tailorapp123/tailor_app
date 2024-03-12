import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../common/tabs_model.dart';
import '../home_controller/home_bloc.dart';
import 'cart_page.dart';

class UserHomePage extends StatefulWidget {
  UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final HomeBloc _bloc = HomeBloc(initialState: Loading());
  _UserHomePageState();
  List<TabListModel> tabsList = [];
  List<TabListModel> statusTabs = [];
  TabListModel selectedTab = TabListModel();
  TabListModel selectedTab2 = TabListModel();
  int isSelectedTab = 0;

  bool isLoading = false;
  int PAGES = 0;
  int PAGE_SIZE = 10;
  bool isLastPage = false;
  bool isFirst = false;
  bool shimmer = true;
  bool isShowEmpty = false;



  @override
  void initState() {

    _updateData2();

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
              duration: Duration(milliseconds: 2000),
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
          child: buildUI(state,context)
        );
      },
    ));
  }

  Widget buildUI(state, context) {
    return Container(
      color: MyColors().backGroundColor,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //APP BAR
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      backButtonWidget(),
                      // statusTabWidget(),
                    ],
                  ),
                ),
                //BODY
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            // VerticalSpace(height: deviceHeight(context)*0.02,),
                            Column(
                              children:  [
                                //BODY WIDGETS
                                productListWidget(),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //BOTTOM WIDGETS
                costBarWidget()

              ],
            ),
          ),
        ],
      ),
    );
  }


  //UI WIDGETS   -> We have to use custom components whatever we have in project.

  Widget backButtonWidget(){
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          textCustom('Products', 16,color: Colors.black,fontWeight: FontWeight.bold).onTap((){
            Navigator.pop(context);
          }),
          Column(
            children: [
              Icon(Icons.person_sharp,size: 30,),
              VerticalSpace(),
              textCustom('Shiva', 14,fontWeight: FontWeight.bold)
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
              textCustom('Cart Value', 14,color: Colors.white),
              textCustom('800', 18,fontWeight: FontWeight.bold,color: Colors.white)
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
            var res = await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (_, __, ___) => CartPage(),
                transitionDuration: Duration(milliseconds: 500),
                transitionsBuilder: (_, a, __, c) =>
                    FadeTransition(opacity: a, child: c),
              ),
            );
          })
        ],
      ),
    );
  }




  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: themeCustomText(
            message,
            14,
            textAlign: TextAlign.center,fontWeight: FontWeight.w600,color: Colors.white
        ),
        backgroundColor: Colors.greenAccent,
        // behavior: SnackBarBehavior.floating,
        // elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
    );
  }

  Widget tabsWidget() {
    return Container(
      height: 40,
      width: deviceWidth(context),
      child: ListView.builder(
          itemCount:tabsList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey.withOpacity(0.4),
                    border: Border.all(color: MyColors().white50,width: 0.2)
                ),
                child: textCustom('${tabsList[index].title}', 14,color: Colors.white)
            ).onTap(() {

            });
          }),
    );
  }

  Widget statusTabWidget() {
    return Container(
      alignment: Alignment.center,
      // padding: EdgeInsets.symmetric(horizontal: 14),
      height: 40,
      width: deviceWidth(context),
      child: ListView.builder(
          itemCount:statusTabs.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
                width: 140,
                margin: EdgeInsets.only(right: 30),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 3.0,
                      ),
                    )
                ),
                child: textCustom('${statusTabs[index].title}', 14,color: Colors.black)
            ).onTap(() {

            });
          }),
    );
  }

  Widget productListWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                            child: Image.asset('assets/sihrt_image.jpg',width: 80,)
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            textCustom('T shirt', 16,fontWeight: FontWeight.bold),
                            VerticalSpace(),
                            textCustom('500', 14),
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
    );
  }





  //FUNCTIONALITY
  Future<void> onRefresh()async {
    bool data = false;
    // WRITE YOUR REFRESH LOGIC
  }

  Future<Null> updated(StateSetter updateState) async {
    updateState(() {});
  }



  _updateData2() {
    TabListModel tabListModel = TabListModel();
    tabListModel.title = "Men";
    tabListModel.isSelected = true;
    statusTabs.add(tabListModel);
    TabListModel tabListModel1 = TabListModel();
    tabListModel1.title = "Women";
    tabListModel1.isSelected = false;
    statusTabs.add(tabListModel1);
    TabListModel tabListModel2 = TabListModel();
    tabListModel2.title = "Kids";
    tabListModel2.isSelected = false;
    statusTabs.add(tabListModel2);
    selectedTab2 = statusTabs[0];
    setState(() {

    });
  }

//API CALLS




}
