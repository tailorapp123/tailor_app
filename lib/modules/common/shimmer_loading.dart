import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taylor_app/utils/core/style.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../utils/core/core.dart';


class ShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: MyColors().white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 20,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(
                  left: 22, right: 22, top: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 52.0,
                        height: 52.0,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(26))),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 13),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              height: 10.0,
                              color: Colors.white,
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.0),
                            ),
                            Container(
                              width: double.infinity,
                              height: 10.0,
                              color: Colors.white,
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 85.0),
                  ),
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerGridProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: .7,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(8, (index) {
        return Shimmer.fromColors(
          baseColor: MyColors().white,
          period: const Duration(milliseconds: 1000),
          highlightColor: Colors.grey[300]!,
          child: Container(
            height: 170,
            margin: const EdgeInsets.only(bottom: 10),
            decoration:  BoxDecoration(
              color: MyColors().white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
          ),
        );
      }),
    );
  }
}

class SchemesShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: MyColors().white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: Container(
                      width: double.infinity,
                      height: 180.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class SavingsShimmer extends StatelessWidget {
  const SavingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: MyColors().white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              // width: double.infinity,
              height: deviceWidth(context)/1.6,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),

                  )),
              child: Shimmer.fromColors(
                baseColor: MyColors().black300,
                highlightColor: MyColors().blackT75,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                      width: double.infinity,
                      height: deviceWidth(context)/2.2,
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),

                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
            ),
            SingleChildScrollView(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 30,top: 10),
                      child: Container(
                        width: double.infinity,
                        height: 16.0,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: 2,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: [


                              Padding(
                                padding: const EdgeInsets.only(left: 4,right: 4),
                                child: Container(
                                  width: double.infinity,
                                  height: 140.0,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(12))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 6.0),
            // ),

          ],
        ),
      ),
    );
  }
}

class WealthCardShimmer extends StatelessWidget {
  const WealthCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:  const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
    bottomRight: Radius.circular(16)
    )),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: MyColors().black300,
              highlightColor: MyColors().blackT75,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Container(
                  width: double.infinity,
                  height: deviceWidth(context)/2.2,
                  decoration:  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),

                      )),
              ),
              ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 6.0),
            // ),

          ],
        ),
      ),
    );
  }
}


class EnrollmentsShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.50;
    return Container(
      color: MyColors().white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class GoldCoinsListShimmer extends StatelessWidget {
  const GoldCoinsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.40;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: MyColors().white,
        height: screenHeight,
        child: SafeArea(
          bottom: false,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 12.0,
              childAspectRatio: (1.45),
              shrinkWrap: true,
              crossAxisCount: 2, // Number of columns in the grid
              children: List.generate(4, (index) {
                return  Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  width: deviceWidth(context) * 0.4,
                  height: 180,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class ContestTaskListShimmer extends StatelessWidget {
  const ContestTaskListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.45;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: MyColors().white,
        height: screenHeight,
        child: SafeArea(
          bottom: false,
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(4, (index) {
                return StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: index==0?1.95:index==1?0.55:index==2?0.6:0.8,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    // width: deviceWidth(context) * 0.4,
                    // height: 180,
                  ) ,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class JewellersShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: MyColors().white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 90.0,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class KYCBannerShimmer extends StatelessWidget {
  const KYCBannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors().black300,
      highlightColor: MyColors().blackT75,
      child:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        child: Column(
          children: [
            Container(
              // width: double.infinity,
              height: 1.0,
              width: deviceWidth(context)/1.8,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              // width: double.infinity,
              height: 60.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}

class TotalWealthShimmer extends StatelessWidget {
  const TotalWealthShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: MyColors().black300,
      highlightColor: MyColors().blackT75,
      child:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        child: Column(
          children: [
            Container(
              // width: double.infinity,
              height: 60.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
            ),
            Container(
              // width: double.infinity,
              height: 1.0,
              width: deviceWidth(context)/1.8,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}

class ADDKYCDetailsShimmer extends StatelessWidget {
  const ADDKYCDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child:  Container(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(26))),
                          ),
                          Container(
                            // width: double.infinity,
                            height: 1.0,
                            width: deviceWidth(context)/4,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(26))),
                          ),
                          Container(
                            // width: double.infinity,
                            height: 1.0,
                            width: deviceWidth(context)/4,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(26))),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 16.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: deviceWidth(context)/1.2,
                      height: 14.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 6.0),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: deviceWidth(context)/1.4,
                      height: 14.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30.0),
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: deviceWidth(context)/2,
                          height: 14.0,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                    ),
                    Container(
                      // width: double.infinity,
                      height: 50.0,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: deviceWidth(context),
              height: 14.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
            ),
            Container(
              // width: double.infinity,
              height: 50.0,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}



class RewardsShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.50;
    return Container(
      color: MyColors().white,
      height: 160,
      width: deviceWidth(context),
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            // padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                children: [
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Container(
                  //       height: 30,width: 30,
                  //       color: Colors.white,
                  //     ),
                  //     VerticalSpace(),
                  //     Container(
                  //       height: 10,width: 80,
                  //       color: Colors.white,
                  //     ),
                  //     VerticalSpace(),
                  //     Container(
                  //       height: 10,width: 180,
                  //       color: Colors.white,
                  //     ),
                  //   ],
                  // ),
                  Container(
                    width: 190,
                    height: 160.0,
                    padding: EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 38.0,
                          height: 38.0,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(26))),
                        ),
                        VerticalSpace(
                          height: 14,
                        ),
                        Container(
                          height: 10,width: 80,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                        ),
                        VerticalSpace(
                          height: 14,
                        ),
                        Container(
                          height: 18,width: 180,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.all(Radius.circular(4))),
                        ),
                      ],
                    ),
                  ),
                  HorizontalSpace(width: 14,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SchemeShimmerLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.50;
    return Container(
      color: MyColors().white,
      height: 160,
      width: deviceWidth(context),
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            padding: EdgeInsets.only(left: 30,right: 30,top: 10),
            child: Column(
              children: [
                Container(
                  height: 20,width: 240,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                VerticalSpace(
                  height: 14,
                ),
                Container(
                  height: 24,width: 320,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                VerticalSpace(
                  height: 14,
                ),
                Container(
                  height: 20,width: 200,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class HomeShimmerLoadingPage extends StatelessWidget {
  const HomeShimmerLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.50;
    return Container(
      color: MyColors().white,
      // height: 160,
      width: deviceWidth(context),
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.only(left: 16,right: 16,top: 10),
              child: Column(
                children: [
                  VerticalSpace(
                    height: 14,
                  ),
                  Container(
                    height: deviceWidth(context)/2,width: deviceWidth(context),
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  VerticalSpace(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: deviceWidth(context)/4,
                          decoration:  BoxDecoration(
                              color: MyColors().grey200,
                              borderRadius: const BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      HorizontalSpace(),
                      Expanded(
                        child: Container(
                          height: deviceWidth(context)/4,
                          decoration:  BoxDecoration(
                              color:  MyColors().grey200,
                              borderRadius: const BorderRadius.all(Radius.circular(8))),
                        ),
                      ),
                      HorizontalSpace(),
                      Expanded(
                        child: Container(
                          height: deviceWidth(context)/4,
                          decoration:  BoxDecoration(
                              color:  MyColors().grey200,
                              borderRadius: const BorderRadius.all(Radius.circular(8))),
                        ),
                      ),

                    ],
                  ),

                  VerticalSpace(
                    height: 14,
                  ),
                  Container(
                    height: deviceWidth(context)/6,
                    decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  VerticalSpace(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: deviceWidth(context)/2.4,
                          decoration:  BoxDecoration(
                              color: MyColors().grey200,
                              borderRadius: const BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                      HorizontalSpace(),
                      Expanded(
                        flex: 1,
                        child: Container(

                          height: deviceWidth(context)/2.4,
                          decoration:  BoxDecoration(
                              color: MyColors().grey200,
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(
                    height: 14,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: deviceWidth(context)/2.4,
                          decoration:  BoxDecoration(
                              color: MyColors().grey200,
                              borderRadius: const BorderRadius.all(Radius.circular(10))
                          ),
                        ),
                      ),
                      HorizontalSpace(),
                      Expanded(
                        flex: 1,
                        child: Container(

                          height: deviceWidth(context)/2.4,
                          decoration:  BoxDecoration(
                              color: MyColors().grey200,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                              )
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            )
        ),
      ),
    );
  }
}

class WithdrawShimmerListLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 16,right:16),
      color: MyColors().white,
      height: screenHeight,
      child: SafeArea(
        bottom: false,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            itemCount: 5,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            itemBuilder: (_, __) => Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 140.0,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
