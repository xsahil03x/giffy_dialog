import 'package:flutter/material.dart';
import 'package:giffy_dialog/src/base_dialog.dart';

class AssetGiffyDialog extends StatelessWidget {
  AssetGiffyDialog({
    Key key,
    @required this.image,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(image != null),
        assert(title != null),
        super(key: key);

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
