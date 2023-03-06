import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart';

import 'entry_animation.dart';
import 'giffy_widget.dart';

class GiffyBottomSheet extends StatelessWidget {
  const GiffyBottomSheet({
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
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  });

  const GiffyBottomSheet.image(
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
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  }) : giffy = image;

  const GiffyBottomSheet.rive(
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
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  }) : giffy = rive;

  const GiffyBottomSheet.lottie(
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
  final String? semanticLabel;
  final bool scrollable;

  final EntryAnimation entryAnimation;

  @override
  Widget build(BuildContext context) {
    return EntryAnimatedContainer(
      animation: entryAnimation,
      child: GiffyModal(
        giffy: giffy,
        giffyBuilder: giffyBuilder,
        giffyPadding: giffyPadding,
        title: title,
        titlePadding: titlePadding,
        titleTextStyle: titleTextStyle,
        content: content,
        contentPadding: contentPadding,
        contentTextStyle: contentTextStyle,
        actions: actions,
        actionsPadding: actionsPadding,
        actionsAlignment: actionsAlignment,
        actionsOverflowDirection: actionsOverflowDirection,
        actionsOverflowButtonSpacing: actionsOverflowButtonSpacing,
        actionsOverflowAlignment: actionsOverflowAlignment,
        buttonPadding: buttonPadding,
        semanticLabel: semanticLabel,
        scrollable: scrollable,
      ),
    );
  }
}
