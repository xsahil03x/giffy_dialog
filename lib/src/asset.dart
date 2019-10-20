import 'package:flutter/material.dart';
import 'package:giffy_dialog/src/base_dialog.dart';

class AssetGiffyDialog extends StatelessWidget {
  final Image image;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback onOkButtonPressed;

  AssetGiffyDialog({
    Key key,
    @required this.image,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(image != null),
        assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseGiffyDialog(
      imageWidget: image,
      cornerRadius: cornerRadius,
      title: title,
      description: description,
      onlyOkButton: onlyOkButton,
      buttonCancelColor: buttonCancelColor,
      buttonRadius: buttonRadius,
      buttonCancelText: buttonCancelText,
      buttonOkColor: buttonOkColor,
      onOkButtonPressed: onOkButtonPressed,
      buttonOkText: buttonOkText,
    );
  }
}
