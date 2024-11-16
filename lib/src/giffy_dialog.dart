part of 'giffy_modal.dart';

const _defaultInsetPadding = EdgeInsets.symmetric(
  horizontal: 40.0,
  vertical: 24.0,
);

/// A Giffy Dialog based on Material Design alert dialog.
///
/// An giffy dialog informs the user about situations that require acknowledgment.
/// An giffy dialog has an optional title and an optional list of actions.
/// The title is displayed above the content and the actions are displayed below the content.
///
/// If the content is too large to fit on the screen vertically, the dialog will
/// display the title and the actions and let the content overflow, which is
/// rarely desired. Consider using a scrolling widget for [content], such as
/// [SingleChildScrollView], to avoid overflow. (However, be aware that since
/// [GiffyDialog] tries to size itself using the intrinsic dimensions of its
/// children, widgets such as [ListView], [GridView], and [CustomScrollView],
/// which use lazy viewports, will not work.)
///
/// Typically passed as the child widget to [showDialog], which displays the
/// dialog.
///
/// {@tool snippet}
///
/// This snippet shows a method in a [State] which, when called, displays a giffy dialog
/// and returns a [Future] that completes when the dialog is dismissed.
///
/// ```dart
/// Future<void> _showMyDialog() async {
///   return showDialog<void>(
///     context: context,
///     barrierDismissible: false, // user must tap button!
///     builder: (BuildContext context) {
///       return GiffyDialog(
///         giffy: Image.asset('assets/giffy_dialog.gif'),
///         title: const Text('GiffyDialog Title'),
///         content: SingleChildScrollView(
///           child: ListBody(
///             children: const <Widget>[
///               Text('This is a demo giffy dialog.'),
///               Text('Would you like to approve of this message?'),
///             ],
///           ),
///         ),
///         actions: <Widget>[
///           TextButton(
///             child: const Text('Approve'),
///             onPressed: () {
///               Navigator.of(context).pop();
///             },
///           ),
///         ],
///       );
///     },
///   );
/// }
/// ```
/// {@end-tool}
///
/// See also:
///
///  * [showDialog], which actually displays the dialog and returns its result.
///  * <https://material.io/design/components/dialogs.html#alert-dialog>
///  * <https://m3.material.io/components/dialogs>
class GiffyDialog extends StatelessWidget {
  /// Creates an giffy dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  ///
  /// The [titlePadding] and [contentPadding] default to null, which implies a
  /// default that depends on the values of the other properties. See the
  /// documentation of [titlePadding] and [contentPadding] for details.
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

  /// Creates a giffy dialog which uses a [Image] as the [giffy].
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

  /// Creates a giffy dialog which uses a [RiveAnimation] as the [giffy].
  const GiffyDialog.rive(
    rive.RiveAnimation rive, {
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

  /// Creates a giffy dialog which uses a [LottieBuilder] as the [giffy].
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

  /// {@macro giffyDialog.giffyModal.giffy}
  final Widget giffy;

  /// {@macro giffyDialog.giffyModal.giffyBuilder}
  final GiffyBuilder giffyBuilder;

  /// {@macro giffyDialog.giffyModal.giffyPadding}
  final EdgeInsetsGeometry? giffyPadding;

  /// {@macro giffyDialog.giffyModal.title}
  final Widget? title;

  /// {@macro giffyDialog.giffyModal.titlePadding}
  final EdgeInsetsGeometry? titlePadding;

  /// {@macro giffyDialog.giffyModal.titleTextStyle}
  final TextStyle? titleTextStyle;

  /// {@macro giffyDialog.giffyModal.content}
  final Widget? content;

  /// {@macro giffyDialog.giffyModal.contentPadding}
  final EdgeInsetsGeometry? contentPadding;

  /// {@macro giffyDialog.giffyModal.contentTextStyle}
  final TextStyle? contentTextStyle;

  /// {@macro giffyDialog.giffyModal.actions}
  final List<Widget>? actions;

  /// {@macro giffyDialog.giffyModal.actionsPadding}
  final EdgeInsetsGeometry? actionsPadding;

  /// {@macro giffyDialog.giffyModal.actionsAlignment}
  final MainAxisAlignment? actionsAlignment;

  /// {@macro giffyDialog.giffyModal.actionsOverflowDirection}
  final VerticalDirection? actionsOverflowDirection;

  /// {@macro giffyDialog.giffyModal.actionsOverflowButtonSpacing}
  final double? actionsOverflowButtonSpacing;

  /// {@macro giffyDialog.giffyModal.actionsOverflowAlignment}
  final OverflowBarAlignment? actionsOverflowAlignment;

  /// {@macro giffyDialog.giffyModal.buttonPadding}
  final EdgeInsetsGeometry? buttonPadding;

  /// {@macro giffyDialog.giffyModal.semanticLabel}
  final String? semanticLabel;

  /// {@macro giffyDialog.giffyModal.scrollable}
  final bool scrollable;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color? backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  final double? elevation;

  /// {@macro flutter.material.dialog.shadowColor}
  final Color? shadowColor;

  /// {@macro flutter.material.dialog.surfaceTintColor}
  final Color? surfaceTintColor;

  /// {@macro flutter.material.dialog.insetPadding}
  final EdgeInsets insetPadding;

  /// {@macro flutter.material.dialog.clipBehavior}
  final Clip clipBehavior;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder? shape;

  /// {@macro flutter.material.dialog.alignment}
  final AlignmentGeometry? alignment;

  /// The animation to use when the modal is shown.
  ///
  /// Defaults to [EntryAnimation.none].
  ///
  /// See also:
  ///
  /// * [EntryAnimation], for a list of available animations.
  /// * [EntryAnimatedContainer], for the animation widget used.
  final EntryAnimation entryAnimation;

  @override
  Widget build(BuildContext context) {
    final dialogTheme = DialogTheme.of(context);
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
        child: GiffyModal(
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
        ),
      ),
    );
  }
}
