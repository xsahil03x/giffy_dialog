import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class FlareGiffyDialog extends StatelessWidget {
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
    this.buttonOkColor,
    this.buttonCancelColor,
    this.cornerRadius = 8.0,
    this.buttonRadius = 8.0,
  })  : assert(flarePath != null),
        assert(title != null),
        assert(flareAnimation != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius)),
      child: (MediaQuery.of(context).orientation == Orientation.portrait)
          ? FlarePortraitMode(
              cardBackgroundColor: cardBackgroundColor,
              cornerRadius: cornerRadius,
              flarePath: flarePath,
              flareAnimation: flareAnimation,
              title: title,
              description: description,
              onlyOkButton: onlyOkButton,
              buttonCancelColor: buttonCancelColor,
              buttonRadius: buttonRadius,
              buttonCancelText: buttonCancelText,
              buttonOkColor: buttonOkColor,
              onOkButtonPressed: onOkButtonPressed,
              buttonOkText: buttonOkText)
          : FlareLandscapeMode(
              cardBackgroundColor: cardBackgroundColor,
              cornerRadius: cornerRadius,
              flarePath: flarePath,
              flareAnimation: flareAnimation,
              title: title,
              description: description,
              onlyOkButton: onlyOkButton,
              buttonCancelColor: buttonCancelColor,
              buttonRadius: buttonRadius,
              buttonCancelText: buttonCancelText,
              buttonOkColor: buttonOkColor,
              onOkButtonPressed: onOkButtonPressed,
              buttonOkText: buttonOkText),
    );
  }
}

class FlarePortraitMode extends StatelessWidget {
  const FlarePortraitMode({
    Key key,
    @required this.cardBackgroundColor,
    @required this.cornerRadius,
    @required this.flarePath,
    @required this.flareAnimation,
    @required this.title,
    @required this.description,
    @required this.onlyOkButton,
    @required this.buttonCancelColor,
    @required this.buttonRadius,
    @required this.buttonCancelText,
    @required this.buttonOkColor,
    @required this.onOkButtonPressed,
    @required this.buttonOkText,
  }) : super(key: key);

  final Color cardBackgroundColor;
  final double cornerRadius;
  final String flarePath;
  final String flareAnimation;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final Color buttonCancelColor;
  final double buttonRadius;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Function onOkButtonPressed;
  final Text buttonOkText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: (MediaQuery.of(context).size.height / 2) * 0.6,
                child: Card(
                  color: cardBackgroundColor,
                  elevation: 0.0,
                  margin: EdgeInsets.all(0.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(cornerRadius),
                          topLeft: Radius.circular(cornerRadius))),
                  clipBehavior: Clip.antiAlias,
                  child: FlareActor(
                    flarePath,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                    animation: flareAnimation,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: title,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: description,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: !onlyOkButton
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.center,
              children: <Widget>[
                !onlyOkButton
                    ? RaisedButton(
                        color: buttonCancelColor ?? Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius)),
                        onPressed: () => Navigator.of(context).pop(),
                        child: buttonCancelText ??
                            Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                      )
                    : Container(),
                RaisedButton(
                  color: buttonOkColor ?? Colors.green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(buttonRadius)),
                  onPressed: onOkButtonPressed ?? () {},
                  child: buttonOkText ??
                      Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlareLandscapeMode extends StatelessWidget {
  const FlareLandscapeMode({
    Key key,
    @required this.cardBackgroundColor,
    @required this.cornerRadius,
    @required this.flarePath,
    @required this.flareAnimation,
    @required this.title,
    @required this.description,
    @required this.onlyOkButton,
    @required this.buttonCancelColor,
    @required this.buttonRadius,
    @required this.buttonCancelText,
    @required this.buttonOkColor,
    @required this.onOkButtonPressed,
    @required this.buttonOkText,
  }) : super(key: key);

  final Color cardBackgroundColor;
  final double cornerRadius;
  final String flarePath;
  final String flareAnimation;
  final Text title;
  final Text description;
  final bool onlyOkButton;
  final Color buttonCancelColor;
  final double buttonRadius;
  final Text buttonCancelText;
  final Color buttonOkColor;
  final Function onOkButtonPressed;
  final Text buttonOkText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: (MediaQuery.of(context).size.width / 2) * 0.6,
            height: MediaQuery.of(context).size.height * 0.8,
            child: Card(
              color: cardBackgroundColor,
              elevation: 0.0,
              margin: EdgeInsets.all(0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cornerRadius),
                      bottomLeft: Radius.circular(cornerRadius))),
              clipBehavior: Clip.antiAlias,
              child: FlareActor(
                flarePath,
                alignment: Alignment.center,
                fit: BoxFit.cover,
                animation: flareAnimation,
              ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: !onlyOkButton
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.center,
                    children: <Widget>[
                      !onlyOkButton
                          ? RaisedButton(
                              color: buttonCancelColor ?? Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(buttonRadius)),
                              onPressed: () => Navigator.of(context).pop(),
                              child: buttonCancelText ??
                                  Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                            )
                          : Container(),
                      RaisedButton(
                        color: buttonOkColor ?? Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(buttonRadius)),
                        onPressed: onOkButtonPressed ?? () {},
                        child: buttonOkText ??
                            Text(
                              'OK',
                              style: TextStyle(color: Colors.white),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
