import 'package:flutter/material.dart';

enum EntryAnimation {
  DEFAULT,
  LEFT_RIGHT,
  RIGHT_LEFT,
  TOP_BOTTOM,
  BOTTOM_TOP,
}

class BaseGiffyDialog extends StatefulWidget {
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
    @required this.entryAnimation,
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
  final EntryAnimation entryAnimation;

  @override
  _BaseGiffyDialogState createState() => _BaseGiffyDialogState();
}

class _BaseGiffyDialogState extends State<BaseGiffyDialog>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _entryAnimation;

  get _start {
    switch (widget.entryAnimation) {
      case EntryAnimation.DEFAULT:
        break;
      case EntryAnimation.LEFT_RIGHT:
      case EntryAnimation.TOP_BOTTOM:
        return -1.0;
      case EntryAnimation.RIGHT_LEFT:
      case EntryAnimation.BOTTOM_TOP:
        return 1.0;
    }
  }

  get _animationAxis {
    if (widget.entryAnimation == EntryAnimation.TOP_BOTTOM ||
        widget.entryAnimation == EntryAnimation.BOTTOM_TOP)
      return 1;
    else
      return 0;
  }

  get _isDefaultEntryAnimation =>
      widget.entryAnimation == EntryAnimation.DEFAULT;

  @override
  void initState() {
    super.initState();
    if (!_isDefaultEntryAnimation) {
      _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
      );
      _entryAnimation = Tween(begin: _start, end: 0.0).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeIn,
        ),
      )..addListener(() => setState(() {}));
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Widget _buildPortraitWidget(BuildContext context, Widget imageWidget) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(widget.cornerRadius),
                topLeft: Radius.circular(widget.cornerRadius)),
            child: imageWidget,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: widget.title,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.description,
              ),
              _buildButtonsBar(context)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeWidget(BuildContext context, Widget imageWidget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.cornerRadius),
                bottomLeft: Radius.circular(widget.cornerRadius)),
            child: imageWidget,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: widget.title,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.description,
              ),
              _buildButtonsBar(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildButtonsBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: !widget.onlyOkButton
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: <Widget>[
          if (!widget.onlyOkButton) ...[
            RaisedButton(
              color: widget.buttonCancelColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.buttonRadius)),
              onPressed: () => Navigator.of(context).pop(),
              child: widget.buttonCancelText ??
                  Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
            )
          ],
          RaisedButton(
            color: widget.buttonOkColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.buttonRadius)),
            onPressed: widget.onOkButtonPressed,
            child: widget.buttonOkText ??
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
    final animationAxis = _animationAxis;
    final width = MediaQuery.of(context).size.width;
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        transform: !_isDefaultEntryAnimation
            ? Matrix4.translationValues(
                animationAxis == 0 ? _entryAnimation.value * width : 0,
                animationAxis == 1 ? _entryAnimation.value * width : 0,
                0,
              )
            : null,
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * (isPortrait ? 0.8 : 0.6),
        child: Material(
          type: MaterialType.card,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.cornerRadius)),
          elevation: Theme.of(context).dialogTheme.elevation ?? 24.0,
          child: isPortrait
              ? _buildPortraitWidget(context, widget.imageWidget)
              : _buildLandscapeWidget(context, widget.imageWidget),
        ),
      ),
    );
  }
}
