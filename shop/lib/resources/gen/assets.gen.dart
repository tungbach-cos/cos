// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $FontsGen {
  const $FontsGen();

  /// File path: fonts/Inter-Black.ttf
  String get interBlack => 'fonts/Inter-Black.ttf';

  /// File path: fonts/Inter-BlackItalic.ttf
  String get interBlackItalic => 'fonts/Inter-BlackItalic.ttf';

  /// File path: fonts/Inter-Bold.ttf
  String get interBold => 'fonts/Inter-Bold.ttf';

  /// File path: fonts/Inter-BoldItalic.ttf
  String get interBoldItalic => 'fonts/Inter-BoldItalic.ttf';

  /// File path: fonts/Inter-ExtraBold.ttf
  String get interExtraBold => 'fonts/Inter-ExtraBold.ttf';

  /// File path: fonts/Inter-ExtraBoldItalic.ttf
  String get interExtraBoldItalic => 'fonts/Inter-ExtraBoldItalic.ttf';

  /// File path: fonts/Inter-ExtraLight.ttf
  String get interExtraLight => 'fonts/Inter-ExtraLight.ttf';

  /// File path: fonts/Inter-ExtraLightItalic.ttf
  String get interExtraLightItalic => 'fonts/Inter-ExtraLightItalic.ttf';

  /// File path: fonts/Inter-Italic.ttf
  String get interItalic => 'fonts/Inter-Italic.ttf';

  /// File path: fonts/Inter-Light.ttf
  String get interLight => 'fonts/Inter-Light.ttf';

  /// File path: fonts/Inter-LightItalic.ttf
  String get interLightItalic => 'fonts/Inter-LightItalic.ttf';

  /// File path: fonts/Inter-Medium.ttf
  String get interMedium => 'fonts/Inter-Medium.ttf';

  /// File path: fonts/Inter-MediumItalic.ttf
  String get interMediumItalic => 'fonts/Inter-MediumItalic.ttf';

  /// File path: fonts/Inter-Regular.ttf
  String get interRegular => 'fonts/Inter-Regular.ttf';

  /// File path: fonts/Inter-SemiBold.ttf
  String get interSemiBold => 'fonts/Inter-SemiBold.ttf';

  /// File path: fonts/Inter-SemiBoldItalic.ttf
  String get interSemiBoldItalic => 'fonts/Inter-SemiBoldItalic.ttf';

  /// File path: fonts/Inter-Thin.ttf
  String get interThin => 'fonts/Inter-Thin.ttf';

  /// File path: fonts/Inter-ThinItalic.ttf
  String get interThinItalic => 'fonts/Inter-ThinItalic.ttf';

  /// File path: fonts/Lora-Bold.ttf
  String get loraBold => 'fonts/Lora-Bold.ttf';

  /// File path: fonts/Lora-BoldItalic.ttf
  String get loraBoldItalic => 'fonts/Lora-BoldItalic.ttf';

  /// File path: fonts/Lora-Italic.ttf
  String get loraItalic => 'fonts/Lora-Italic.ttf';

  /// File path: fonts/Lora-Medium.ttf
  String get loraMedium => 'fonts/Lora-Medium.ttf';

  /// File path: fonts/Lora-MediumItalic.ttf
  String get loraMediumItalic => 'fonts/Lora-MediumItalic.ttf';

  /// File path: fonts/Lora-Regular.ttf
  String get loraRegular => 'fonts/Lora-Regular.ttf';

  /// File path: fonts/Lora-SemiBold.ttf
  String get loraSemiBold => 'fonts/Lora-SemiBold.ttf';

  /// File path: fonts/Lora-SemiBoldItalic.ttf
  String get loraSemiBoldItalic => 'fonts/Lora-SemiBoldItalic.ttf';

  /// File path: fonts/social-icon-font.woff2
  String get socialIconFont => 'fonts/social-icon-font.woff2';

  /// List of all assets
  List<String> get values => [
    interBlack,
    interBlackItalic,
    interBold,
    interBoldItalic,
    interExtraBold,
    interExtraBoldItalic,
    interExtraLight,
    interExtraLightItalic,
    interItalic,
    interLight,
    interLightItalic,
    interMedium,
    interMediumItalic,
    interRegular,
    interSemiBold,
    interSemiBoldItalic,
    interThin,
    interThinItalic,
    loraBold,
    loraBoldItalic,
    loraItalic,
    loraMedium,
    loraMediumItalic,
    loraRegular,
    loraSemiBold,
    loraSemiBoldItalic,
    socialIconFont,
  ];
}

class $IconsGen {
  const $IconsGen();

  /// File path: icons/leaf_1.svg
  SvgGenImage get leaf1 => const SvgGenImage('icons/leaf_1.svg');

  /// File path: icons/leaf_2.svg
  SvgGenImage get leaf2 => const SvgGenImage('icons/leaf_2.svg');

  /// File path: icons/leaf_3.svg
  SvgGenImage get leaf3 => const SvgGenImage('icons/leaf_3.svg');

  /// List of all assets
  List<SvgGenImage> get values => [leaf1, leaf2, leaf3];
}

class $ImagesGen {
  const $ImagesGen();

  /// File path: images/lanscape_logo.png
  AssetGenImage get lanscapeLogo =>
      const AssetGenImage('images/lanscape_logo.png');

  /// File path: images/logo.gif
  AssetGenImage get logo => const AssetGenImage('images/logo.gif');

  /// List of all assets
  List<AssetGenImage> get values => [lanscapeLogo, logo];
}

class AppAssets {
  const AppAssets._();

  static const $FontsGen fonts = $FontsGen();
  static const $IconsGen icons = $IconsGen();
  static const $ImagesGen images = $ImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
