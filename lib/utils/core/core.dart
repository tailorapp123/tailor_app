
import 'package:flutter/material.dart';
import 'package:taylor_app/utils/core/style.dart';

export './extend.dart';

class VerticalSpace extends SizedBox {
  VerticalSpace({double height = 8.0}) : super(height: height);
}

class HorizontalSpace extends SizedBox {
  HorizontalSpace({double width = 8.0}) : super(width: width);
}

BoxDecoration ShadowboxDecoration(
    ) {
  return BoxDecoration (
      color:  Color(0xfff6f8fb),
      borderRadius:  BorderRadius.circular(4*fem),
      boxShadow: [
        BoxShadow(color: Colors.grey,offset: Offset.fromDirection(2),blurRadius: 2)
      ]

  );
}
extension FirstWordExtension on String {
  String get firstWord {
    // Split the string into words
    List<String> words = this.split(" ");

    // Return the first word
    return words.isNotEmpty ? words[0] : '';
  }
}

BoxDecoration boxDecoration(
  color,
  borderWidth,
  borderRadius,
  isFill,
) {
  return BoxDecoration(
      border: Border.all(color: color, width: borderWidth),
      borderRadius: BorderRadius.circular(borderRadius),
      color: isFill ? color : null);
}

BoxDecoration boxDecorationTopLeft(
  color,
  borderRadius,
) {
  return BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(borderRadius),
        topRight: Radius.circular(borderRadius)),
    color: color,
  );
}

CustomDashedLine(){
  return LayoutBuilder(
    builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      const dashWidth = 4.0;
      final dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        children: List.generate(dashCount, (_) {
          return SizedBox(
            width: dashWidth,
            height: 1,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.grey),
            ),
          );
        }),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
      );
    },
  );
}

showError(context, errorMessage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        duration: Duration(milliseconds: 4000),
        content: Text(errorMessage,style: const TextStyle(fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),
        backgroundColor: MyColors().buttonColor),
  );
}

deviceWidth(context) => MediaQuery.of(context).size.width;
deviceHeight(context) => MediaQuery.of(context).size.height;
devicefemWidth(context) {
  femwidth = MediaQuery.of(context).size.width;
}
double femwidth=0;
double baseWidth = 359;
double fem = femwidth / baseWidth;
double ffem = fem * 0.97;
textTitle(text,
    {Color color = Colors.black,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    textAlign= TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Text textLarge(text,
    {Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    textAlign= TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: 18.0,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}




Text textMedium(text,
    {Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    textAlign= TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(fontSize: 16.0, color: color, fontWeight: fontWeight),
  );
}

Text textSmall(text,
    {Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    textAlign= TextAlign.start}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: 14.0,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Text textCustom(text,
    double fontSize,
    {Color color = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    textAlign= TextAlign.start,textStyle= TextStyle}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

// Text themeCustomText(text,
//     double fontSize,
//     {Color color = Colors.black,
//       FontWeight fontWeight = FontWeight.normal,
//       textAlign: TextAlign.start,textStyle: TextStyle}) {
//   return Text(
//     text,
//     textAlign: textAlign,
//     style: TextStyle (
//       decoration: TextDecoration.none,
//       fontWeight: fontWeight,
//       fontSize:fontSize,
//       fontFamily: 'Lato',
//       color: color,
//     ),
//   );
// }

Text themeCustomText(text,
    double fontSize,
    {Color color = Colors.black,
      int? maxLines,
      String fontFamily = "DM Sans",
      TextOverflow? overFlow ,
      FontWeight fontWeight = FontWeight.normal,
      FontStyle fontStyle = FontStyle.normal,
      TextDecoration underLine = TextDecoration.none,
      textAlign = TextAlign.start,textStyle = TextStyle}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle (
      decoration: TextDecoration.none,
      fontWeight: fontWeight,
      fontSize:fontSize,
      fontFamily: 'DM Sans',
      color: color,
      overflow: overFlow,
    ),
  );
}



Text themeCustomTextHeading(text,
    double fontSize,

    {Color color = Colors.black,
      int maxLines = 1,
      TextOverflow overFlow = TextOverflow.ellipsis,
      FontWeight fontWeight = FontWeight.normal,
      textAlign= TextAlign.start,textStyle= TextStyle}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    style: TextStyle (
      decoration: TextDecoration.none,
      fontWeight: fontWeight,
      fontSize:fontSize,
      fontFamily: 'Avenir',
      color: color,
      overflow: overFlow,
    ),
  );
}

Widget horizontalLine(context, color,{height = 1}) => Container(
      height: height,
      width: deviceWidth(context),
      color: color ?? Colors.grey,
    );
Widget verticalLine(context, double height) => Container(
      width: 1,
      height: height,
      color: Colors.grey,
    );

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

String allWordsCapitilize(String str) {
  // return str.toLowerCase().split(' ').map((word) {
  //   String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
  //   return word[0].toUpperCase() + leftText;
  // }).join(' ');
  return str.replaceAllMapped(RegExp(r'^([a-z])|[A-Z]'),
          (Match m) => m[1] == null ? "${m[0]}":m[1]!.toUpperCase());
}
String camelToSentence(String text) {
  return text.replaceAllMapped(RegExp(r'^([a-z])|[A-Z]'),
          (Match m) => m[1] == null ? "${m[0]}":m[1]!.toUpperCase());
}
String camelCapitalize(String str) {
  if (str.isNotEmpty) {
    List second = [];
    str.replaceAll("", "");
    final nameArray = str.toLowerCase().split(" ");
    for (var e in nameArray) {
      if (e.length > 1) second.add(e);
    }
    return second.map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  } else {
    return str;
  }
}