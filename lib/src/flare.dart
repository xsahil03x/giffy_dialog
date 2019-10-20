import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'base_dialog.dart';

class FlareGiffyDialog extends StatelessWidget {
  FlareGiffyDialog({
    Key key,
    @required this.flarePath,
    @required this.flareAnimation,
    @required this.title,
    @required this.onOkButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.cardBackgroundColor,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(flarePath != null),
        assert(title != null),
        assert(flareAnimation != null),
        super(key: key);

  final String flarePath;
  final String flareAnimation;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final Text buttonOkText;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Color buttonCancelColor;
  final Color cardBackgroundColor;
  final double buttonRadius;
  final double cornerRadius;
  final VoidCallback onOkButtonPressed;

  @override
  Widget build(BuildContext context) {
    final imageWidget = FlareActor(
      flarePath,
      alignment: Alignment.center,
      fit: BoxFit.cover,
      animation: flareAnimation,
    );
    return BaseGiffyDialog(
      imageWidget: imageWidget,
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
