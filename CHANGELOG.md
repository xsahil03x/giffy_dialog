## 2.3.0

- Bump rive version to `^0.13.10`.
- Bump lottie version to `^3.1.0`.
- Bump minimum Flutter version to `3.22.0`.

## 2.2.0

- Fix `Image` is imported from both packages. [#110](https://github.com/xsahil03x/giffy_dialog/issues/110)

## 2.1.0

- Bump rive version to `^0.13.0`.
- Bump lottie version to `^3.0.0`.
- Bump minimum Flutter version to `3.16.0`.

## 2.0.0+2

- Fix README.md gif links.

## 2.0.0+1

- Add live demo link to README.md.
- Update README.md.

## 2.0.0

🚨 Breaking

- The `NetworkGiffyDialog` class has been replaced with the `GiffyDialog.image` constructor.
- The `image` property in the old API is now can be set using the `Image.network` in the new API.
- The `AssetGiffyDialog` class has been replaced with the `GiffyDialog.image` constructor.
- The `image` property in the old API is now can be set using the `Image.asset` in the new API.
- The `FlareGiffyDialog` class has been replaced with the `GiffyDialog.rive` constructor.
- The `flarePath` and `flareAnimation` properties in the old API is now can be set using the `rive` property of
  type `RiveAnimation` in the new API.
- The `description` property in the old API is now can be set using the `content` widget in the new API.
- The `onOkButtonPressed` and `onCancelButtonPressed` properties in the old API are replaced with the `actions`
  property in the new API to handle button actions.
- The `onlyOkButton`, `onlyCancelButton`, `buttonOkText`, `buttonCancelText` and all the other button
  related properties in the old API is no longer available and has been replaced with the `actions` property in the
  new API to handle button actions.
- The `cornerRadius` property in the old API is now can be set using the `shape` property in the new API.
- A new `GiffyDialog.lottie` constructor has been added to support Lottie animations.

## 1.8.0

- Fixed pub scoring errors
- Upgraded flare_flutter dependency.

## 1.7.0

- Added ability to have only Cancel button, just like only OK button. Thanks to (@SaadBinShahid)
- Upgraded flare_flutter dependency.

## 1.6.1

- Minor Improvements.

## 1.6.0

- Added Some more variations for Entry Animation.

```dart
enum EntryAnimation {
  DEFAULT, // Center
  LEFT,
  RIGHT,
  TOP,
  BOTTOM,
  TOP_LEFT,
  TOP_RIGHT,
  BOTTOM_LEFT,
  BOTTOM_RIGHT,
}
```

- Added a callback for Cancel Button Pressed.
- Added Documentation
- Minor bug fixes

## 1.5.0

- Added Entry Animation for dialogs.
    * DEFAULT,
    * LEFT_RIGHT,
    * RIGHT_LEFT,
    * TOP_BOTTOM,
    * BOTTOM_TOP,

## 1.4.0

- Added Landscape dialogs and reduced code size.

## 1.3.0

- Remove dependency from cached_network_image (More Generic).

## 1.2.0

- Add widget tests and description.

## 1.1.1

- Fix formatting.

## 1.1.0

- Added Boolean to show only OK button.

## 1.0.1

- Minor Changes.

## 1.0.0

- Initial Release.
