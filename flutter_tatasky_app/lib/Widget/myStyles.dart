import 'package:flutter/material.dart';
import 'package:fluttertataskyapp/Widget/appTheme.dart';


class MyStyles
{


///function for shape 
  static ShapeBorder buttonRouded(double radius){
    return RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(radius),
     ); 
  }

//function for roundedRectangeBorder radious with side border
  static RoundedRectangleBorder getRoundedRectangleBorder(double radius,{BorderSide borderSide}){
    return RoundedRectangleBorder(
     borderRadius: BorderRadius.circular(radius),
     side: borderSide
     ); 
  }

  static  boxDecorationwithRoudedCorner({Color color, double boxRadius = 15, Color colorshodow})
{
  return BoxDecoration(
                      boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 6.0,
                      offset: Offset(1.1, 1.1),
                      color:colorshodow?? Colors.grey.withOpacity(0.2),
                        )
                  ],
                      color: color ??  AppTheme.notWhite,
                      borderRadius: BorderRadius.circular(boxRadius));
}

//function for alertStyle
//   static final  alertStyle =  AlertStyle(
//     overlayColor: Colors.black87,
//     animationType: AnimationType.grow,
//     isCloseButton: false,
//     isOverlayTapDismiss: true,
//     descStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff8E0E00)),
//     animationDuration: Duration(milliseconds: 400),
//     alertBorder:getRoundedRectangleBorder(10.0,borderSide : BorderSide(color: Colors.grey)),
   
//     titleStyle: TextStyle(
//       color: Colors.lightBlue,
//     ),
//   );

// static AlertStyle alertStyles(AnimationType animationType, TextStyle descStyle,TextStyle titleStyle, ShapeBorder alertBorder,{bool iscloseButton}){
//   return AlertStyle(
//     animationType: animationType,
//     alertBorder: alertBorder,
//     titleStyle: titleStyle,
//     descStyle: descStyle,
//     isCloseButton: iscloseButton
//     );
// }

//   static final succssfullyalertStyle = AlertStyle(
   
//     animationType: AnimationType.grow,
//     isCloseButton: false,
//     isOverlayTapDismiss: true,
//     descStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
//     animationDuration: Duration(milliseconds: 400),
//     alertBorder: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10.0),
//       side: BorderSide(
//         color: Colors.grey,
//       ),
//     ),
//     titleStyle: TextStyle(
//       color: Colors.lightBlue,
//       //Color.fromRGBO(91, 55, 185, 1.0),
//     ),
//   );

static getOutLineDropDownStyles(){
 return InputDecoration(
                 border:  OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
          const Radius.circular(25.0),
        ),
                  borderSide: BorderSide(style: BorderStyle.none,width: 0, )
                ),
                 contentPadding: EdgeInsets.fromLTRB(20.0, -8.0, 0.0, 0.0),
                  labelStyle: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),
               );
}

}