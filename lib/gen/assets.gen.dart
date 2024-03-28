/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsOnboardingGen {
  const $AssetsOnboardingGen();

  /// File path: assets/onboarding/onboarding1.jpg
  AssetGenImage get onboarding1Jpg =>
      const AssetGenImage('assets/onboarding/onboarding1.jpg');

  /// File path: assets/onboarding/onboarding1.png
  AssetGenImage get onboarding1Png =>
      const AssetGenImage('assets/onboarding/onboarding1.png');

  /// File path: assets/onboarding/onboarding2.jpg
  AssetGenImage get onboarding2Jpg =>
      const AssetGenImage('assets/onboarding/onboarding2.jpg');

  /// File path: assets/onboarding/onboarding2.png
  AssetGenImage get onboarding2Png =>
      const AssetGenImage('assets/onboarding/onboarding2.png');

  /// File path: assets/onboarding/onboarding3.jpg
  AssetGenImage get onboarding3Jpg =>
      const AssetGenImage('assets/onboarding/onboarding3.jpg');

  /// File path: assets/onboarding/onboarding3.png
  AssetGenImage get onboarding3Png =>
      const AssetGenImage('assets/onboarding/onboarding3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        onboarding1Jpg,
        onboarding1Png,
        onboarding2Jpg,
        onboarding2Png,
        onboarding3Jpg,
        onboarding3Png
      ];
}

class $AssetsSplashGen {
  const $AssetsSplashGen();

  /// File path: assets/splash/laundryEaseLogo.png
  AssetGenImage get laundryEaseLogo =>
      const AssetGenImage('assets/splash/laundryEaseLogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [laundryEaseLogo];
}

class Assets {
  Assets._();

  static const $AssetsOnboardingGen onboarding = $AssetsOnboardingGen();
  static const $AssetsSplashGen splash = $AssetsSplashGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
