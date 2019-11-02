import 'package:flutter/material.dart';

import 'base_dialog.dart';

/// Giffy Dialog using image obtained from the network.
///
/// Pass the network image URL to [NetworkGiffyDialog]'s [image] prop using Flutter's `Image.network(src)` widget.
/// ```
/// NetworkGiffyDialog(
///   title: Text('Example'),
///   description: Text('Dialog text'),
///   image: Image.network(
///     'https://example.com/link/to/image.gif',
///     fit: BoxFit.cover,
///   ),
///   ...,
/// );
class NetworkGiffyDialog extends StatelessWidget {
  NetworkGiffyDialog({
    Key key,
    @required this.image,
    @required this.title,
    @required this.onOkButtonPressed,
    this.onCancelButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
    this.entryAnimation = EntryAnimation.DEFAULT,
  })  : assert(image != null),
        assert(title != null),
        super(key: key);

  /// Image to display in dialog.
  ///
  /// Pass `Image.network(src)` widget here. Preferably with `fit: BoxFit.cover` property.
  /// All properties of Image widget are directly passed to Giffy Dialog so feel free to experiment.
  final Widget image;

  /// Title text.
  final Text title;

  /// Description text
  final Text description;

  /// Sets dialog to have only OK button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonCancelText], [buttonCancelColor] and [onCancelButtonPressed]
  final bool onlyOkButton;

  /// Text for OK button.
  ///
  /// Default is `OK`.
  final Text buttonOkText;

  /// Text for cancel button
  ///
  /// Default is `Cancel`.
  final Text buttonCancelText;

  /// Color of OK button.
  ///
  /// Default is `Colors.green`.
  final Color buttonOkColor;

  /// Color of Cancel button
  ///
  /// Default is `Colors.grey`.
  final Color buttonCancelColor;

  /// Radius applied to the button corners.
  ///
  /// Default is 8.
  final double buttonRadius;

  /// Radius applied to the dialog box corners.
  ///
  /// Default is 8.
  final double cornerRadius;

  /// Callback function to be called on when OK button is pressed.
  ///
  /// If set to null, then the button will be disabled and by
  /// default will resemble a flat button in the Theme's `disabledColor`.
  final VoidCallback onOkButtonPressed;

  /// Callback function to be called on when Cancel button is pressed.
  ///
  /// By default (or if set to null) closes the Giffy Dialog via `Navigator.of(context).pop()`.
  final VoidCallback onCancelButtonPressed;

  /// Defines how Giffy Dialog will enter the screen.
  ///
  /// Default is [EntryAnimation.DEFAULT] - standard Material dialog
  /// entrance animation, i.e. slow fade-in in the center of the screen.
  final EntryAnimation entryAnimation;

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
      onCancelButtonPressed: onCancelButtonPressed,
      buttonOkText: buttonOkText,
      entryAnimation: entryAnimation,
    );
  }
}
