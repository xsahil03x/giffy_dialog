import 'dart:ui';

import 'package:flutter/material.dart';

typedef GiffyBuilder = Widget Function(BuildContext context, Widget giffy);
Widget defaultGiffyBuilder(BuildContext context, Widget giffy) => giffy;

class GiffyModal extends StatelessWidget {
  const GiffyModal({
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
  });

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTitleTextStyle = theme.useMaterial3
        ? theme.textTheme.headlineSmall
        : theme.textTheme.titleLarge;
    final defaultContentTextStyle = theme.useMaterial3
        ? theme.textTheme.bodyMedium
        : theme.textTheme.titleMedium;

    String? label = semanticLabel;
    switch (theme.platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        label ??= 'Giffy Modal';
    }

    // The paddingScaleFactor is used to adjust the padding of Dialog's
    // children.
    final paddingScaleFactor =
        _paddingScaleFactor(MediaQuery.of(context).textScaleFactor);
    final textDirection = Directionality.maybeOf(context);

    final bool belowIsTitle = title != null;
    final bool belowIsContent = !belowIsTitle && content != null;
    final defaultGiffyPadding = EdgeInsets.only(
      left: 24.0,
      top: 24.0,
      right: 24.0,
      bottom: belowIsTitle
          ? 16.0
          : belowIsContent
              ? 0.0
              : 24.0,
    );
    final EdgeInsets effectiveGiffyPadding =
        giffyPadding?.resolve(textDirection) ?? defaultGiffyPadding;
    final giffyWidget = Padding(
      padding: EdgeInsets.only(
        left: effectiveGiffyPadding.left * paddingScaleFactor,
        right: effectiveGiffyPadding.right * paddingScaleFactor,
        top: effectiveGiffyPadding.top * paddingScaleFactor,
        bottom: effectiveGiffyPadding.bottom,
      ),
      child: giffyBuilder.call(context, giffy),
    );

    Widget? titleWidget;
    Widget? contentWidget;
    Widget? actionsWidget;

    if (title != null) {
      final defaultTitlePadding = EdgeInsets.only(
        left: 24.0,
        top: 0.0,
        right: 24.0,
        bottom: content == null ? 20.0 : 0.0,
      );
      final effectiveTitlePadding =
          titlePadding?.resolve(textDirection) ?? defaultTitlePadding;
      titleWidget = Padding(
        padding: EdgeInsets.only(
          left: effectiveTitlePadding.left * paddingScaleFactor,
          right: effectiveTitlePadding.right * paddingScaleFactor,
          top: effectiveTitlePadding.top,
          bottom: effectiveTitlePadding.bottom,
        ),
        child: DefaultTextStyle(
          style: titleTextStyle ?? defaultTitleTextStyle!,
          textAlign: TextAlign.center,
          child: Semantics(
            // For iOS platform, the focus always lands on the title.
            // Set nameRoute to false to avoid title being announce twice.
            namesRoute: label == null && theme.platform != TargetPlatform.iOS,
            container: true,
            child: title,
          ),
        ),
      );
    }

    if (content != null) {
      final defaultContentPadding = EdgeInsets.only(
        left: 24.0,
        top: theme.useMaterial3 ? 16.0 : 20.0,
        right: 24.0,
        bottom: 24.0,
      );
      final effectiveContentPadding =
          contentPadding?.resolve(textDirection) ?? defaultContentPadding;
      contentWidget = Padding(
        padding: EdgeInsets.only(
          left: effectiveContentPadding.left * paddingScaleFactor,
          right: effectiveContentPadding.right * paddingScaleFactor,
          top: effectiveContentPadding.top,
          bottom: effectiveContentPadding.bottom,
        ),
        child: DefaultTextStyle(
          style: contentTextStyle ?? defaultContentTextStyle!,
          child: Semantics(
            container: true,
            child: content,
          ),
        ),
      );
    }

    if (actions != null) {
      final defaultActionsPadding = theme.useMaterial3
          ? const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0)
          : EdgeInsets.zero;
      final spacing = (buttonPadding?.horizontal ?? 16) / 2;
      actionsWidget = Padding(
        padding: actionsPadding ??
            (theme.useMaterial3
                ? defaultActionsPadding
                : defaultActionsPadding.add(EdgeInsets.all(spacing))),
        child: OverflowBar(
          alignment: actionsAlignment ?? MainAxisAlignment.end,
          spacing: spacing,
          overflowAlignment:
              actionsOverflowAlignment ?? OverflowBarAlignment.end,
          overflowDirection: actionsOverflowDirection ?? VerticalDirection.down,
          overflowSpacing: actionsOverflowButtonSpacing ?? 0,
          children: actions!,
        ),
      );
    }

    List<Widget> columnChildren;
    if (scrollable) {
      columnChildren = <Widget>[
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                giffyWidget,
                if (title != null) titleWidget!,
                if (content != null) contentWidget!,
              ],
            ),
          ),
        ),
        if (actions != null) actionsWidget!,
      ];
    } else {
      columnChildren = <Widget>[
        giffyWidget,
        if (title != null) titleWidget!,
        if (content != null) Flexible(child: contentWidget!),
        if (actions != null) actionsWidget!
      ];
    }

    Widget child = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      ),
    );

    if (label != null) {
      child = Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        namesRoute: true,
        label: label,
        child: child,
      );
    }

    return child;
  }
}

double _paddingScaleFactor(double textScaleFactor) {
  final double clampedTextScaleFactor = clampDouble(textScaleFactor, 1.0, 2.0);
  // The final padding scale factor is clamped between 1/3 and 1. For example,
  // a non-scaled padding of 24 will produce a padding between 24 and 8.
  return lerpDouble(1.0, 1.0 / 3.0, clampedTextScaleFactor - 1.0)!;
}
