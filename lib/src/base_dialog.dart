import 'package:flutter/material.dart';

class BaseGiffyDialog extends StatelessWidget {
  BaseGiffyDialog({
    Key key,
    @required this.imageWidget,
    @required this.title,
    @required this.onOkButtonPressed,
    @required this.description,
    @required this.onlyOkButton,
    @required this.buttonOkText,
    @required this.buttonCancelText,
    @required this.buttonOkColor,
    @required this.buttonCancelColor,
    @required this.cornerRadius,
    @required this.buttonRadius,
  }) : super(key: key);

  final Widget imageWidget;
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

  Widget _buildPortraitWidget(BuildContext context, Widget imageWidget) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(cornerRadius),
                  topLeft: Radius.circular(cornerRadius)),
              child: imageWidget,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: title,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: description,
                ),
                _buildButtonsBar(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLandscapeWidget(BuildContext context, Widget imageWidget) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(cornerRadius),
                  bottomLeft: Radius.circular(cornerRadius)),
              child: imageWidget,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: title,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: description,
                ),
                _buildButtonsBar(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonsBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: !onlyOkButton
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: <Widget>[
          if (!onlyOkButton) ...[
            RaisedButton(
              color: buttonCancelColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius)),
              onPressed: () => Navigator.of(context).pop(),
              child: buttonCancelText ??
                  Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
            )
          ],
          RaisedButton(
            color: buttonOkColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(buttonRadius)),
            onPressed: onOkButtonPressed,
            child: buttonOkText ??
                Text(
                  'OK',
                  style: TextStyle(color: Colors.white),
                ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cornerRadius)),
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? _buildPortraitWidget(context, imageWidget)
            : _buildLandscapeWidget(context, imageWidget));
  }
}
