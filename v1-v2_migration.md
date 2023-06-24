# V1-V2 Migration

## Introduction

This document describes the migration from the v1 to the v2 version of the Giffy Dialog package.

## Changes

### NetworkGiffyDialog

- The `NetworkGiffyDialog` class has been replaced with the `GiffyDialog.image` constructor.
- The `image` property in the old API is now can be set using the `Image.network` in the new API.

### AssetGiffyDialog

- The `AssetGiffyDialog` class has been replaced with the `GiffyDialog.image` constructor.
- The `image` property in the old API is now can be set using the `Image.asset` in the new API.

### FlareGiffyDialog

- The `FlareGiffyDialog` class has been replaced with the `GiffyDialog.rive` constructor.
- The `flarePath` and `flareAnimation` properties in the old API is now can be set using the `rive` property of
  type `RiveAnimation` in the new API.

### Other common changes

- The `description` property in the old API is now can be set using the `content` widget in the new API.
- The `onOkButtonPressed` and `onCancelButtonPressed` properties in the old API are replaced with the `actions`
  property in the new API to handle button actions.
- The `onlyOkButton`, `onlyCancelButton`, `buttonOkText`, `buttonCancelText` and all the other button
  related properties in the old API is no longer available and has been replaced with the `actions` property in the
  new API to handle button actions.
- The `cornerRadius` property in the old API is now can be set using the `shape` property in the new API.
