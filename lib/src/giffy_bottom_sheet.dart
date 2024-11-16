part of 'giffy_modal.dart';

/// A giffy bottom sheet based on Material Design modal bottom sheet.
///
/// A giffy bottom sheet is an alternative to a menu or a dialog and
/// informs the user about situations that require acknowledgment.
///
/// An giffy bottom sheet has an optional title and an optional list of actions.
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
/// Typically passed as the child widget to [showModalBottomSheet], which displays the
/// bottom sheet.
///
/// {@tool snippet}
///
/// This snippet shows a method in a [State] which, when called, displays a giffy bottom
/// sheet and returns a [Future] that completes when the sheet is dismissed.
///
/// ```dart
/// Future<void> _showMyDialog() async {
///   return showModalBottomSheet<void>(
///     context: context,
///     isScrollControlled: true,
///     barrierDismissible: false, // user must tap button!
///     builder: (BuildContext context) {
///       return GiffyBottomSheet(
///         giffy: Image.asset('assets/giffy_sheet.gif'),
///         title: const Text('GiffyBottomSheet Title'),
///         content: SingleChildScrollView(
///           child: ListBody(
///             children: const <Widget>[
///               Text('This is a demo giffy bottom sheet.'),
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
///  * [showModalBottomSheet], which can be used to display a modal bottom
///    sheet.
///  * [BottomSheetThemeData], which can be used to customize the default
///    bottom sheet property values.
///  * <https://material.io/design/components/sheets-bottom.html>
class GiffyBottomSheet extends StatelessWidget {
  /// Creates an giffy bottom sheet.
  ///
  /// Typically used in conjunction with [showModalBottomSheet].
  ///
  /// The [titlePadding] and [contentPadding] default to null, which implies a
  /// default that depends on the values of the other properties. See the
  /// documentation of [titlePadding] and [contentPadding] for details.
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

  /// Creates an giffy bottom sheet which uses a [Image] as the [giffy].
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

  /// Creates an giffy bottom sheet which uses a [RiveAnimation] as the [giffy].
  const GiffyBottomSheet.rive(
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
    this.semanticLabel,
    this.scrollable = false,
    this.entryAnimation = EntryAnimation.none,
  }) : giffy = rive;

  /// Creates an giffy bottom sheet which uses a [LottieBuilder] as the [giffy].
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
