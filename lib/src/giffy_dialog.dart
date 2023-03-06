import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

import 'entry_animation.dart';
import 'giffy_widget.dart';

const _defaultInsetPadding = EdgeInsets.symmetric(
  horizontal: 40.0,
  vertical: 24.0,
);

class GiffyDialog extends StatelessWidget {
  const GiffyDialog({
    super.key,
    required this.giffy,
    this.giffyBuilder = defaultGiffyBuilder,
    this.giffyPadding,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.actions,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowAlignment,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.antiAlias,
    this.shape,
    this.alignment,
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  });

  const GiffyDialog.image(
    Image image, {
    super.key,
    this.giffyBuilder = defaultGiffyBuilder,
    this.giffyPadding,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.actions,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowAlignment,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.antiAlias,
    this.shape,
    this.alignment,
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  }) : giffy = image;

  const GiffyDialog.rive(
    RiveAnimation rive, {
    super.key,
    this.giffyBuilder = defaultGiffyBuilder,
    this.giffyPadding,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.actions,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowAlignment,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.antiAlias,
    this.shape,
    this.alignment,
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  }) : giffy = rive;

  const GiffyDialog.lottie(
    LottieBuilder lottie, {
    super.key,
    this.giffyBuilder = defaultGiffyBuilder,
    this.giffyPadding,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding,
    this.contentTextStyle,
    this.actions,
    this.actionsPadding,
    this.actionsAlignment,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.actionsOverflowAlignment,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.antiAlias,
    this.shape,
    this.alignment,
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  }) : giffy = lottie;

  final Widget giffy;
  final GiffyBuilder giffyBuilder;
  final EdgeInsetsGeometry? giffyPadding;

  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final TextStyle? titleTextStyle;

  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? contentTextStyle;

  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final MainAxisAlignment? actionsAlignment;
  final VerticalDirection? actionsOverflowDirection;
  final double? actionsOverflowButtonSpacing;
  final OverflowBarAlignment? actionsOverflowAlignment;

  final EdgeInsetsGeometry? buttonPadding;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final EdgeInsets insetPadding;
  final Clip clipBehavior;
  final ShapeBorder? shape;
  final AlignmentGeometry? alignment;
  final String? semanticLabel;
  final bool scrollable;

  final EntryAnimation entryAnimation;

  @override
  Widget build(BuildContext context) {
    final dialogTheme = DialogTheme.of(context);

    final dialogChild = GiffyModal(
      giffy: giffy,
      giffyBuilder: giffyBuilder,
      giffyPadding: giffyPadding,
      title: title,
      titlePadding: titlePadding,
      titleTextStyle: titleTextStyle ?? dialogTheme.titleTextStyle,
      content: content,
      contentPadding: contentPadding,
      contentTextStyle: contentTextStyle ?? dialogTheme.contentTextStyle,
      actions: actions,
      actionsPadding: actionsPadding ?? dialogTheme.actionsPadding,
      actionsAlignment: actionsAlignment,
      actionsOverflowDirection: actionsOverflowDirection,
      actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
      actionsOverflowAlignment: actionsOverflowAlignment,
      buttonPadding: buttonPadding,
      semanticLabel: semanticLabel,
      scrollable: scrollable,
    );

    return EntryAnimatedContainer(
      animation: entryAnimation,
      child: Dialog(
        backgroundColor: backgroundColor,
        elevation: elevation,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        insetPadding: insetPadding,
        clipBehavior: clipBehavior,
        shape: shape,
        alignment: alignment,
        child: dialogChild,
      ),
    );
  }
}
