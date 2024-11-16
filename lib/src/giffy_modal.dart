import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rive/rive.dart' as rive;

import 'entry_animation.dart';

part 'giffy_dialog.dart';
part 'giffy_bottom_sheet.dart';

/// {@template giffyDialog.giffyModal.giffyBuilder}
/// Builder that is called to build the [giffy].
///
/// Typically, used to provide extra decoration around the [giffy].
/// {@endtemplate}
typedef GiffyBuilder = Widget Function(BuildContext context, Widget giffy);

/// The default [GiffyBuilder] used by [GiffyModal].
Widget defaultGiffyBuilder(BuildContext context, Widget giffy) {
  final useMaterial3 = Theme.of(context).useMaterial3;
  return ClipRRect(
    borderRadius: useMaterial3
        ? const BorderRadius.all(Radius.circular(16))
        : const BorderRadius.all(Radius.circular(4)),
    child: giffy,
  );
}

/// A giffy modal based on Material Design modal.
///
/// Rather than using this widget directly, consider using [GiffyDialog]
/// or [GiffyBottomSheet], which implement specific kinds of Material Design
/// modals.
///
/// See also:
///
///  * [GiffyDialog], for dialog variant of this modal.
///  * [GiffyBottomSheet], for bottom sheet variant of this modal.
class GiffyModal extends StatelessWidget {
  /// Creates an giffy modal.
  ///
  /// Typically used in conjunction with Dialogs and Bottom Sheets.
  ///
  /// The [titlePadding] and [contentPadding] default to null, which implies a
  /// default that depends on the values of the other properties. See the
  /// documentation of [titlePadding] and [contentPadding] for details.
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

  /// {@template giffyDialog.giffyModal.giffy}
  /// The widget or the gif to be displayed at the top of the modal.
  ///
  /// Typically, an [Image], [RiveAnimation] or [Lottie] widget.
  /// {@endtemplate}
  final Widget giffy;

  /// {@macro giffyDialog.giffyModal.giffyBuilder}
  final GiffyBuilder giffyBuilder;

  /// {@template giffyDialog.giffyModal.giffyPadding}
  /// Padding around the [giffy].
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the [giffy]. If [title] is _not_ null, 16 pixels of bottom padding is
  /// added to separate the [giffy] from the [title]. If the [title] is null and
  /// [content] is _not_ null, then no bottom padding is provided (but see
  /// [contentPadding]). In any other case 24 pixels of bottom padding is
  /// added.
  /// {@endtemplate}
  final EdgeInsetsGeometry? giffyPadding;

  /// {@template giffyDialog.giffyModal.title}
  /// The (optional) title of the modal is displayed in a large font at the top
  /// of the modal, below the [giffy].
  ///
  /// Typically a [Text] widget.
  /// {@endtemplate}
  final Widget? title;

  /// {@template giffyDialog.giffyModal.titlePadding}
  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  /// {@endtemplate}
  final EdgeInsetsGeometry? titlePadding;

  /// {@template giffyDialog.giffyModal.titleTextStyle}
  /// Style for the text in the [title] of this [GiffyModal].
  ///
  /// If null, defaults to [TextTheme.titleLarge] of [ThemeData.textTheme].
  /// {@endtemplate}
  final TextStyle? titleTextStyle;

  /// {@template giffyDialog.giffyModal.content}
  /// The (optional) content of the modal is displayed in the center of the
  /// modal in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the modal's
  /// message. As noted in the [GiffyModal] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit.
  /// {@endtemplate}
  final Widget? content;

  /// {@template giffyDialog.giffyModal.contentPadding}
  /// Padding around the content.
  ///
  /// If there is no [content], no padding will be provided. Otherwise, this
  /// padding is used.
  ///
  /// This property defaults to providing a padding of 20 pixels above the
  /// [content] to separate the [content] from the [title], and 24 pixels on the
  /// left, right, and bottom to separate the [content] from the other edges of
  /// the modal.
  ///
  /// If [ThemeData.useMaterial3] is true, the top padding separating the
  /// content from the title defaults to 16 pixels instead of 20 pixels.
  /// {@endtemplate}
  final EdgeInsetsGeometry? contentPadding;

  /// {@template giffyDialog.giffyModal.contentTextStyle}
  /// Style for the text in the [content] of this [Alertmodal].
  ///
  /// If null, defaults to [TextTheme.titleMedium] of [ThemeData.textTheme].
  /// {@endtemplate}
  final TextStyle? contentTextStyle;

  /// {@template giffyDialog.giffyModal.actions}
  /// The (optional) set of actions that are displayed at the bottom of the
  /// modal with an [OverflowBar].
  ///
  /// Typically this is a list of [TextButton] widgets. It is recommended to
  /// set the [Text.textAlign] to [TextAlign.end] for the [Text] within the
  /// [TextButton], so that buttons whose labels wrap to an extra line align
  /// with the overall [OverflowBar]'s alignment within the modal.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [OverflowBar] to separate the [title]
  /// from the [actions].
  /// {@endtemplate}
  final List<Widget>? actions;

  /// {@template giffyDialog.giffyModal.actionsPadding}
  /// Padding around the set of [actions] at the bottom of the modal.
  ///
  /// Typically used to provide padding to the button bar between the button bar
  /// and the edges of the modal.
  ///
  /// If there are no [actions], then no padding will be included. It is also
  /// important to note that [buttonPadding] may contribute to the padding on
  /// the edges of [actions] as well.
  ///
  /// {@tool snippet}
  /// This is an example of a set of actions aligned with the content widget.
  /// ```dart
  /// GiffyModal(
  ///   giffy: Image.asset('assets/giffy_modal.gif'),
  ///   title: const Text('Title'),
  ///   content: Container(width: 200, height: 200, color: Colors.green),
  ///   actions: <Widget>[
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
  ///     ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
  ///   ],
  ///   actionsPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  /// {@endtemplate}
  final EdgeInsetsGeometry? actionsPadding;

  /// {@template giffyDialog.giffyModal.actionsOverflowDirection}
  /// Defines the horizontal layout of the [actions] according to the same
  /// rules as for [Row.mainAxisAlignment].
  ///
  /// This parameter is passed along to the modal's [OverflowBar].
  ///
  /// If this parameter is null (the default) then [MainAxisAlignment.end]
  /// is used.
  /// {@endtemplate}
  final MainAxisAlignment? actionsAlignment;

  /// {@template giffyDialog.giffyModal.actionsOverflowDirection}
  /// The horizontal alignment of [actions] within the vertical
  /// "overflow" layout.
  ///
  /// If the modal's [actions] do not fit into a single row, then they
  /// are arranged in a column. This parameter controls the horizontal
  /// alignment of widgets in the case of an overflow.
  ///
  /// If this parameter is null (the default) then [OverflowBarAlignment.end]
  /// is used.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  /// {@endtemplate}
  final OverflowBarAlignment? actionsOverflowAlignment;

  /// {@template giffyDialog.giffyModal.actionsOverflowDirection}
  /// The vertical direction of [actions] if the children overflow
  /// horizontally.
  ///
  /// If the modal's [actions] do not fit into a single row, then they
  /// are arranged in a column. The first action is at the top of the
  /// column if this property is set to [VerticalDirection.down], since it
  /// "starts" at the top and "ends" at the bottom. On the other hand,
  /// the first action will be at the bottom of the column if this
  /// property is set to [VerticalDirection.up], since it "starts" at the
  /// bottom and "ends" at the top.
  ///
  /// See also:
  ///
  /// * [OverflowBar], which [actions] configures to lay itself out.
  /// {@endtemplate}
  final VerticalDirection? actionsOverflowDirection;

  /// {@template giffyDialog.giffyModal.actionsOverflowButtonSpacing}
  /// The spacing between [actions] when the [OverflowBar] switches
  /// to a column layout because the actions don't fit horizontally.
  ///
  /// If the widgets in [actions] do not fit into a single row, they are
  /// arranged into a column. This parameter provides additional
  /// vertical space in between buttons when it does overflow.
  ///
  /// Note that the button spacing may appear to be more than
  /// the value provided. This is because most buttons adhere to the
  /// [MaterialTapTargetSize] of 48px. So, even though a button
  /// might visually be 36px in height, it might still take up to
  /// 48px vertically.
  ///
  /// If null then no spacing will be added in between buttons in
  /// an overflow state.
  /// {@endtemplate}
  final double? actionsOverflowButtonSpacing;

  /// {@template giffyDialog.giffyModal.actionsOverflowSpacing}
  /// The padding that surrounds each button in [actions].
  ///
  /// This is different from [actionsPadding], which defines the padding
  /// between the entire button bar and the edges of the modal.
  ///
  /// If this property is null, then it will default to
  /// 8.0 logical pixels on the left and right.
  /// {@endtemplate}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@template giffyDialog.giffyModal.semanticLabel}
  /// The semantic label of the modal used by accessibility frameworks to
  /// announce screen transitions when the modal is opened and closed.
  ///
  /// In iOS, if this label is not provided, a semantic label will be inferred
  /// from the [title] if it is not null.
  ///
  /// In Android, if this label is not provided, the modal will use the
  /// 'Giffy Modal' as its label.
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.namesRoute], for a description of how this
  ///    value is used.
  /// {@endtemplate}
  final String? semanticLabel;

  /// {@template giffyDialog.giffyModal.scrollable}
  /// Determines whether the [title] and [content] widgets are wrapped in a
  /// scrollable.
  ///
  /// This configuration is used when the [title] and [content] are expected
  /// to overflow. Both [title] and [content] are wrapped in a scroll view,
  /// allowing all overflowed content to be visible while still showing the
  /// button bar.
  /// {@endtemplate}
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

    // The paddingScaleFactor is used to adjust the padding of modal's
    // children.
    const double fontSizeToScale = 14.0;
    final double effectiveTextScale =
        MediaQuery.textScalerOf(context).scale(fontSizeToScale) /
            fontSizeToScale;
    final double paddingScaleFactor = _scalePadding(effectiveTextScale);
    final TextDirection? textDirection = Directionality.maybeOf(context);

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

double _scalePadding(double textScaleFactor) {
  final double clampedTextScaleFactor = clampDouble(textScaleFactor, 1.0, 2.0);
  // The final padding scale factor is clamped between 1/3 and 1. For example,
  // a non-scaled padding of 24 will produce a padding between 24 and 8.
  return lerpDouble(1.0, 1.0 / 3.0, clampedTextScaleFactor - 1.0)!;
}
