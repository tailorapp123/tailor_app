import 'package:flutter/material.dart';

class BaseTheme {
  Color primaryColor = HexColor('#FFAB00');
  Color backGroundColour = HexColor("#F5F5F5");
  Color secondaryColor = HexColor('#FFAB00');
  Color buttonBorderColor = HexColor('#5146E2');
  Color darkhighlight = HexColor("#0267C1");
  Color highlight=Color(0xffffffff);
  Color dividerColor = HexColor("#646465");
  Color greenColor = HexColor("#36B37E");

  Color textColor = Colors.black;
  Color textDisableColor = Colors.grey;
  Color textHintColor = Colors.grey;
  Color errorTextColor = Colors.red;
  Color color1 = HexColor('#FAFAFB',);
  Color textLightColor = HexColor('#E6F0F9',);
  Color orangeColor = HexColor('#FF5630',);
  Color textHeadingColor = HexColor('#626262',);
  Color textGreenColor = HexColor('#22C55E',);
  Color ecommerce_orange_color = HexColor("#F79824");
  Color ecommerce_orange_color_opacity = HexColor("#F79824");
  Color textSecondary = HexColor("#ffffff");
  Color appBarColor = HexColor("#F6F8FB");
  Color buttonColor = HexColor('#F2994A');
  Color secondaryTextColor = HexColor('#FFAB00');
  Color buttonTextColor = Colors.white;

}

class Theme1 extends BaseTheme {
  Color primaryColor = HexColor('#FFAB00');
  Color backGroundColour = HexColor("#F5F5F5");
  Color secondaryColor = HexColor('#E6F0F9');
  Color buttonBorderColor = HexColor('#5146E2');
  Color darkhighlight = HexColor("#0267C1");
  Color dividerColor = HexColor("#646465");
  Color textColor = Colors.black;
  Color textDisableColor = Colors.grey;
  Color textHintColor = Colors.grey;
  Color errorTextColor = Colors.red;
  Color color1 = HexColor('#56CCF2',);
  Color buttonColor = HexColor('#F2994A');

}

class Theme2 extends BaseTheme {
  Color primaryColor = HexColor('#FFAB00');
  Color backGroundColour = HexColor("#A5A5A5");
  Color secondaryColor = HexColor('#E6F0F9');
  Color buttonBorderColor = HexColor('#5146E2');
  Color darkhighlight = HexColor("#0267C1");
  Color dividerColor = HexColor("#646465");
  Color textColor = Colors.red;
  Color textDisableColor = Colors.grey;
  Color textHintColor = Colors.grey;
  Color errorTextColor = Colors.red;
  Color color1 = HexColor('#56CCF2',);
  Color buttonColor = HexColor('#F2994A');

}


class CustomTextStyle {
   TextStyle whiteBold16(BuildContext context) {
    return const TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
class MyColors {
   Color color1 = HexColor('#56CCF2',);
   Color color2 = HexColor('#BB6BD9',);
   Color orange_state= HexColor('#F2994A');
   Color cancel_red= HexColor('#EB5757');
   Color yellow =HexColor('#F2C94C');
   Color gray4 =HexColor('#BDBDBD');
   Color gray5 =HexColor('#E0E0E0');
   Color green200 = HexColor("#58C094");
   Color grey200 = HexColor("#D9D9D9");


   Color primaryColor = HexColor('#FFAB00',);
   Color buttonColor = HexColor('#DB7B31',);
   Color buttonDisabledColor = HexColor('#DCB89D',);
   Color primaryColorWithOpacity = Color(int.parse("0x001B42")).withOpacity(0.6);
   Color primaryColorWithLessOpacity = Color(int.parse("0x001B42"))
      .withOpacity(0.2);
   Color textPrimary = HexColor("#333333");
   Color textSecondary = HexColor("#ffffff");
   Color backGroundColor = HexColor("#121020");
   Color orangeColor = HexColor("#FF6B00");
   Color secondaryColor = HexColor("#04CE5E");
   Color white = Colors.white;
   Color black = Colors.black;
   Color black_bg = HexColor("#121208");
   Color grey = Colors.grey;
   Color grey1 = HexColor("#828282");
   Color bg_hospital = HexColor("#E8D9C2");
   Color errorLight = HexColor('#FFF4F4',);
   Color greenWhite = HexColor('#ADE0CA',);
   Color blue100 = HexColor('#FCFCFD');
   // yellow
   Color yellowBg = HexColor("#E0E0E04D").withOpacity(.4);
   Color yellow700 = HexColor("#FFD22B");
   Color yellowShade = HexColor("#FFD233");

   // orange
   Color orange800 = HexColor("#FFC022");
   Color orange900 = HexColor("#ECA311");
   Color orangeStar = HexColor("#D7A408");

   // Brown
   Color brown = HexColor('#897051');

   // White
   Color white50 = HexColor('#E6E7E7');

   // grey
   Color grey900 = HexColor('#101828');
   Color grey500 = HexColor('#667085');
   Color grey400 = HexColor('#B4B3B3');
   Color gray2text= HexColor('#4F4F4F');
   Color bgGrey = HexColor("#F8F8F8");
   Color greyText = HexColor("#001B4282");
   Color greyText999 = HexColor("#999999");
   Color textLightGrey = HexColor("#707070");
   Color bgLightGrey = HexColor("#DEDEDE");
   Color bgGrey100 = HexColor("#ECEEF1");

   Color transparent = Colors.transparent;
   Color SecondaryColor = HexColor('#E0E0E0');
   Color titleColor = HexColor("#C1C1CA");
   Color textColor82 = HexColor("#828282");
   Color boxColor = HexColor("#EEF7FF");

   Color chatHighlight= HexColor('#ccffff');
   Color skyBlue= HexColor('#DDFCFF');
   Color orangeLight= HexColor('#FCEBD7');
   Color orangeLight1= HexColor('#FFAB00').withOpacity(.1);
   Color orangeLight2= HexColor('#FFCE6B');
   Color orangeLight3= Color(int.parse('0x80FFF7E6'));

   Color errorColor = HexColor("#FB1818");
   Color dividerColor = HexColor("#646465");
   Color divColor = HexColor("#BDBDBD");
   Color signUpColor = HexColor("#1565D8");
   Color textColor = HexColor("#5E5D5D");
   Color appBarColor = HexColor("#F4F5F9");
   Color appBarColor1 = HexColor("#F2F2F2");
   Color darkBlue= HexColor('#152850');
   Color textSecondary_50 = HexColor("#804A4848");
   Color text_header = HexColor("#4A4848");

   Color emptySCreenText = HexColor("#1089FF");

   Color bgDashed = HexColor("#FFD2D2");
   Color buttonColor1 = HexColor("#060708");
   Color buttonColor_light = HexColor("#FFF7E6");
   Color buttonColor_light1 = HexColor("#FFF7E6").withOpacity(.5);
   Color buttonColor_light2 = HexColor("#FFDD96");
   Color skyBlueLight = HexColor("#EDFFFE");
   Color newTextColor = HexColor("#9D002B");

   // home colors

   // black
   Color black200 = HexColor("#333434");
   Color black300 = HexColor("#090A0B");
   Color blackRandom = HexColor("#494848");
   Color pinkLight = HexColor("#F49587").withOpacity(.05);
   Color blackT75 = HexColor("#9A9B9B");
   Color blackT50 = HexColor("#E6E7E7");
   Color blackT100 = HexColor("#707171");
   Color blackT400 = HexColor("#060708");
   Color blackT500 = HexColor("#050607");
   Color blackT700 = HexColor("#3F3B3B");
   Color blackText = HexColor("##0B1625");
   Color blackBorder = const Color(0x330B1625);
   Color blackText10 = HexColor("#242424");
   Color blackText20 = HexColor("#6D6D6D");
   Color blackText30 = HexColor("#0E233C");
   Color blackText40 = HexColor("#ADADAD");
   Color blackText50 = HexColor("#CACACA");

   Color lightOrange = const Color(0x99FFF7E6);
   Color greenLight = HexColor("#EBF7F2");
   Color greenDark = HexColor("#36B37E");
   Color blackDark = HexColor("#323232");
   Color blackShade = HexColor("#1E1E1E");
   Color blackShade10 = HexColor("#838282");
   Color blueLight = HexColor("#F2F9FB");
   Color greyLight = HexColor("#F2F3F5");
   Color blackRandom1 = HexColor("#282828");
   Color lightOrange1 = HexColor("#FFF0D0");
   Color yellowColor = HexColor("#F6C221");
   Color yellowColor_fd = HexColor("#D3766A");
   Color savings_chart = HexColor("#009FBB");


   Color dividerColor_70 = HexColor("#7070A3");
   Color light_divider = HexColor("#C6C6C6");
   Color blue = HexColor("#1089FF");
   Color bgOtpBox = HexColor("#1A19BCD2");
   Color box_bg_color = HexColor("#F8FFFE");
   Color green = Colors.greenAccent;

  //ECOMMERCE COLORS
   Color ecommerce_orange_color = HexColor("#F79824");


   //FITNESS COLORS
   Color fit_onboard_text_color = HexColor("#FFD8BA");

  var scrheight = 813.0;
  var scrwidth = 375.0;

  double eight = 0.0213;
  double ten = 0.0267;
  double twelve = 0.032;
  double thirty = 0.08;
  double fourteen = 0.0373;
  double fifteen = 0.04;
  double sixteen = 0.042666;
  double eighteen = 0.048;
  double twenty = 0.053;
  double twentysix = 0.0693;
  double twentyeight = 0.07466;
  double twentyfour = 0.064;
  double thirtysix = 0.096;
  double fourty = 0.10667;
}
