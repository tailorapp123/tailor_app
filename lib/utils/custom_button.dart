import 'package:flutter/material.dart';
import '../../utils/core/core.dart';
import 'core/style.dart';

class CustomButton extends StatefulWidget {
  final Function onClick;
  final String buttonText;
  double height= 46.0;
  bool isDisabled;
  Color buttonTextColor = MyColors().white;
  CustomButton({buttonTextColor,height,required this.isDisabled,required this.onClick, required this.buttonText}) : super();

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Set this to 0 for a rectangular shape
              ),
            primary: Colors.white,
            backgroundColor: widget.isDisabled?MyColors().buttonDisabledColor:MyColors().buttonColor.withOpacity(0.9)
          ),

          // elevation: 2.0,
          // color: Theme.of(context).buttonColor,
          // shape: RoundedRectangleBorder(
          //   borderRadius: new BorderRadius.circular(20.0),
          // ),
          child: Container(
              height: widget.height,
              // padding: EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child: Text(widget.buttonText,
                    style: TextStyle(
                      color: widget.buttonTextColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                    )),
              )),
          onPressed:(){
            if(!widget.isDisabled)
            widget.onClick();
          } ),
    );
  }
}

class CustomButtonWithBorder extends StatefulWidget {
  final Function onClick;
  final String buttonText;
  Color? buttonTextColor;
  CustomButtonWithBorder({buttonTextColor,required this.onClick, required this.buttonText}) : super();

  @override
  _CustomButtonWithBorderState createState() => _CustomButtonWithBorderState();
}

class _CustomButtonWithBorderState extends State<CustomButtonWithBorder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0),
      child: Container(
        decoration: boxDecoration(MyColors().buttonColor, 1.0, 4.0, false),
          height: 50,
          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
          child: Center(
            child: Text(widget.buttonText,
                style: TextStyle(
                  color: MyColors().buttonColor,
                  fontWeight: FontWeight.bold,
                )),
          )).onTap(((){
        widget.onClick();
      })),
    );
  }
}