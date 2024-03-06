import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taylor_app/utils/base_state.dart';
import '../../../../utils/core/core.dart';
import '../../../utils/core/style.dart';
import '../../common/tabs_model.dart';
import '../home_controller/home_bloc.dart';

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
      color: MyColors().white,
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
                      VerticalSpace(),
                      statusTabWidget(),
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
                            VerticalSpace(height: deviceHeight(context)*0.03,),
                            Column(
                              children:  [
                                //BODY WIDGETS
                                memberShipsWidget(),
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
    );
  }


  //UI WIDGETS   -> We have to use custom components whatever we have in project.

  Widget backButtonWidget(){
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const  Icon(Icons.arrow_back_ios,color: Colors.black,),
              textCustom('Items', 14,color: Colors.black),
            ],
          ).onTap((){
            Navigator.pop(context);
          }),

          Row(
            children: [
              Icon(Icons.shopping_cart),
              HorizontalSpace(),
              Icon(Icons.person_sharp),

            ],
          ),
        ],
      ),
    ).onTap((){

      // Navigator.pop(context);
    });
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

  Widget memberShipsWidget(){
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
                        border: Border.all(color: MyColors().black,width: 0.2)
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                            child: Image.asset('assets/sihrt_image.jpg')
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            textCustom('T shirt', 14),
                            VerticalSpace(),
                            textCustom('500', 14),
                            VerticalSpace(),
                            Row(
                              children: [
                                Icon(Icons.remove),
                                HorizontalSpace(),
                                textCustom('2', 16),
                                HorizontalSpace(),
                                Icon(Icons.add)
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
