import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import 'base_dialog.dart';

/// Widget that displays Giffy Dialog with flare asset.
///
/// You need local [Flare](https://github.com/2d-inc/Flare-Flutter) `.flr` asset for this type of Giffy Dialog.
/// Place the asset under `/assets` directory in the project root.
/// Add the asset to `pubspec.yaml` like so
/// ```
/// assets:
/// - assets/my_awesome_flare.flr
/// ```
/// Set [FlareGiffyDialog]'s [flarePath] prop to the asset path.
/// You also must specify the name of animation sequence to apply via `flareAnimation` prop.
/// ```
/// FlareGiffyDialog(
///   title: Text('Example'),
///   description: Text('Dialog text'),
///   flarePath: 'assets/my_awesome_flare.flr',
///   flareAnimation: 'dancing',
///   ...,
/// );
class FlareGiffyDialog extends StatelessWidget {
  FlareGiffyDialog({
    Key key,
    @required this.flarePath,
    @required this.flareAnimation,
    @required this.title,
    this.onOkButtonPressed,
    this.flareFit = BoxFit.cover,
    this.onCancelButtonPressed,
    this.description,
    this.onlyOkButton = false,
    this.onlyCancelButton = false,
    this.buttonOkText,
    this.buttonCancelText,
    this.cardBackgroundColor,
    this.buttonOkColor = Colors.green,
    this.buttonCancelColor = Colors.grey,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
    this.entryAnimation = EntryAnimation.DEFAULT,
  })  : assert(flarePath != null),
        assert(title != null),
        assert(flareAnimation != null),
        super(key: key);

  /// Path to the Flare asset.
  final String flarePath;

  /// Name of Flare animation to apply.
  final String flareAnimation;

  /// BoxFit sizing of the Flare asset.
  final BoxFit flareFit;

  /// Title text.
  final Text title;

  /// Description text.
  final Text description;

  /// Sets dialog to have only OK button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonCancelText], [buttonCancelColor] and [onCancelButtonPressed]
  final bool onlyOkButton;

  /// Sets dialog to have only Cancel button.
  ///
  /// Default is false.
  /// If set to true there is no need to set [buttonOkText], [buttonOkColor] and [onOkButtonPressed]
  final bool onlyCancelButton;

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

  /// TODO: this props is not used at the moment.
  final Color cardBackgroundColor;

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
    final imageWidget = FlareActor(
      flarePath,
      alignment: Alignment.center,
      fit: flareFit,
      animation: flareAnimation,
    );
    return BaseGiffyDialog(
      imageWidget: imageWidget,
      cornerRadius: cornerRadius,
      title: title,
      description: description,
      onlyOkButton: onlyOkButton,
      onlyCancelButton: onlyCancelButton,
      buttonCancelColor: buttonCancelColor,
      buttonRadius: buttonRadius,
      buttonCancelText: buttonCancelText,
      buttonOkColor: buttonOkColor,
      onOkButtonPressed: onOkButtonPressed,
      buttonOkText: buttonOkText,
      onCancelButtonPressed: onCancelButtonPressed,
      entryAnimation: entryAnimation,
    );
  }
}
