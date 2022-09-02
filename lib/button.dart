import 'package:flutter/material.dart';
import 'package:../button_widget_services.dart' as btn;
import 'package:../consts.dart' as consts;

class Button extends StatefulWidget {
  /// Button type
  final btn.ButtonType? type;

  /// is solid button
  final bool solidButton;

  /// Button text
  final String? text;

  /// Button icon
  final IconData? icon;

  /// Button size
  final btn.ButtonSize? size;

  /// Button background
  final btn.ButtonColorType? backgroundColor;

  /// text color
  final Color? textColor;

  /// border color
  final Color borderColor;

  /// border radius
  ///final BorderRadius buttonBorderRadius;

  /// button icon position left/right/center
  final btn.IconPositionEnum iconPosition;

  /// is disabled button
  final bool disabled;

  Button(
      {Key? key,
      this.type,
      this.solidButton = false,
      this.text,
      this.icon,
      this.size = btn.ButtonSize.normal,
      this.backgroundColor,
      this.textColor,
      this.borderColor = consts.primaryColor,
      ///this.buttonBorderRadius: consts.buttonBorderRadius,
      this.iconPosition = btn.IconPositionEnum.right,
      this.disabled = false})
      : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {

    double iconFontSize = btn.fontSizes[widget.size]! + 6;

    // Color? bgButtonColor;
    // if (widget.solidButton) {
    //   bgButtonColor = btn.navyPrimary;
    // } else {
    //   if (widget.backgroundColor != null) {
    //     bgButtonColor = btn.buttonTypeColors[widget.type]
    //         [btn.ButtonColorType.backgroundColor];
    //   }
    // }

                // backgroundColor: btn.buttonTypeColors.containsKey(widget.type)
                // ? btn.buttonTypeColors[widget.type][btn.ButtonColorType.backgroundColor]
                // : btn.navyPrimary
      // Color? buttonTextColor;
      //   buttonTextColor = btn.buttonTypeColors[widget.type][btn.ButtonColorType.textColor];
      

      // Color? borderColor;
      // if (widget.solidButton) {
      //   borderColor = btn.navyPrimary;
      // } else {
      //   if (buttonTextColor != null) {
      //     borderColor = widget.textColor;
      //   } else {
      //     borderColor =
      //         btn.buttonTypeColors[widget.type][btn.ButtonColorType.borderColor];
      //   }
      // }

      Widget iconWidget() {
        return widget.icon != null
            ? Container(
                // padding: EdgeInsets.only(
                //     left: widget.text == 0
                //         ? 0
                //         : widget.iconPosition == btn.IconPositionEnum.right
                //             ? 2
                //             : 0,
                //     right: widget.text == 0
                //         ? 0
                //         : widget.iconPosition == btn.IconPositionEnum.left
                //             ? 2
                //             : 0,
                //     bottom:  widget.text == 0
                //         ? 0      
                //         : widget.iconPosition == btn.IconPositionEnum.center
                //             ? 2
                //             : 0
                            
                //             ),
                    
                child: Icon(
                  widget.icon,
                  size: iconFontSize,
                  color: btn.buttonTypeColors.containsKey(widget.type)
              ? btn.buttonTypeColors[widget.type][btn.ButtonColorType.textColor]
              : consts.primaryColor,
                ),
              )
            : Container();
      }



      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
          onPressed: (){},
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: consts.defaultButtonColor,      
              border: Border.all(
                color: consts.defaultButtonColor,
              ),
              borderRadius: btn.buttonBorderRadius,
            ),
              child: SizedBox(
                height: btn.sizes[widget.size],
                //padding: btn.paddings[widget.size],
                child: (widget.iconPosition == btn.IconPositionEnum.center)
                ? Column(
                  children: [
                    iconWidget(),
                     Text(
                      (widget.text ?? ''),
                      textAlign: TextAlign.center,
                      style: btn.buttonTextStyles.containsKey(widget.type)
              ? btn.buttonTextStyles[widget.type]
              : btn.defaultButtonTextStyle,
                  ),
                    
                  ],
                )
                : Row(children: [
                  widget.iconPosition == btn.IconPositionEnum.left
                      ? iconWidget()
                      : Container(),
                  
                    Text(
                      (widget.text ?? ''),
                      textAlign: TextAlign.start,
                      style: btn.buttonTextStyles.containsKey(widget.type)
              ? btn.buttonTextStyles[widget.type]
              : btn.defaultButtonTextStyle,
                    ),
                  
                  widget.iconPosition == btn.IconPositionEnum.right
                      ? iconWidget()
                      : Container(),
                ])
              ),
        
           ),
     ),
      );
    }
}
