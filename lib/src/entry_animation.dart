import 'package:flutter/material.dart';

/// Defines variants of entry animations
enum EntryAnimation {
  /// Uses the default entry animation for the dialog.
  none,

  /// Enters screen horizontally from the left.
  left,

  /// Enters screen horizontally from the right.
  right,

  /// Enters screen horizontally from the top.
  top,

  /// Enters screen horizontally from the bottom.
  bottom,

  /// Enters screen from the top left corner.
  topLeft,

  /// Enters screen from the top right corner.
  topRight,

  /// Enters screen from the bottom left corner.
  bottomLeft,

  /// Enters screen from the bottom right corner.
  bottomRight,
}

extension on EntryAnimation {
  /// Returns [Offset] for the given [EntryAnimation]
  Offset getOffset() {
    switch (this) {
      case EntryAnimation.none:
        return Offset.zero;
      case EntryAnimation.left:
        return const Offset(-1.0, 0.0);
      case EntryAnimation.right:
        return const Offset(1.0, 0.0);
      case EntryAnimation.top:
        return const Offset(0.0, -1.0);
      case EntryAnimation.bottom:
        return const Offset(0.0, 1.0);
      case EntryAnimation.topLeft:
        return const Offset(-1.0, -1.0);
      case EntryAnimation.topRight:
        return const Offset(1.0, -1.0);
      case EntryAnimation.bottomLeft:
        return const Offset(-1.0, 1.0);
      case EntryAnimation.bottomRight:
        return const Offset(1.0, 1.0);
    }
  }
}

/// A widget that animates its child when it is first added to the tree.
///
/// The animation is defined by [animation].
class EntryAnimatedContainer extends StatefulWidget {
  /// Creates a [EntryAnimatedContainer].
  const EntryAnimatedContainer({
    super.key,
    this.animation = EntryAnimation.none,
    required this.child,
  });

  /// Defines the entry animation.
  ///
  /// Defaults to [EntryAnimation.none].
  final EntryAnimation animation;

  /// The widget to animate when it is first added to the tree.
  ///
  /// The child is animated from the offset defined by [animation].
  final Widget child;

  @override
  State<EntryAnimatedContainer> createState() => _EntryAnimatedContainerState();
}

class _EntryAnimatedContainerState extends State<EntryAnimatedContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> entryOffset;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    // create the animation.
    entryOffset = Tween<Offset>(
      begin: widget.animation.getOffset(),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    // start the animation.
    controller.forward();
  }

  @override
  void didUpdateWidget(covariant EntryAnimatedContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.animation != widget.animation) {
      // re-create the animation with the new offset.
      entryOffset = Tween<Offset>(
        begin: widget.animation.getOffset(),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

      // reset and start the animation again.
      controller.reset();
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: entryOffset,
      child: widget.child,
    );
  }
}
