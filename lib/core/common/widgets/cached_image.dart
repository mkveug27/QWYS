import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shimmer/shimmer.dart';

import 'package:qwys/core/core.dart';

class CustomCacheManager {
  CustomCacheManager._();

  static const String key = 'customCacheKey';

  static final CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 20,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileSystem: IOFileSystem(key),
      fileService: HttpFileService(),
    ),
  );
}

class CachedImage extends StatelessWidget {
  const CachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.imageAlignment = Alignment.center,
    this.isCircular = false,
    this.shimmerWidth,
    this.shimmerHeight,
    this.shimmerBaseColor,
    this.shimmerHighlightColor,
    this.errorWidget,
    this.errorIconSize = _defaultErrorIconSize,
  });

  // Image
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Alignment imageAlignment;

  // Loading
  final bool isCircular;
  final double? shimmerWidth;
  final double? shimmerHeight;
  final Color? shimmerBaseColor;
  final Color? shimmerHighlightColor;

  // Error
  final Widget? errorWidget;
  final double errorIconSize;

  static const double _defaultErrorIconSize = 24;

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      alignment: imageAlignment,
      filterQuality: FilterQuality.high,
      cacheManager: CustomCacheManager.instance,
      memCacheWidth: _getCacheDimension(width, devicePixelRatio),
      memCacheHeight: _getCacheDimension(height, devicePixelRatio),
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return isCircular
            ? _buildCircularProgressIndicator()
            : _buildShimmerLoader(context);
      },
      errorWidget: (context, url, error) {
        return errorWidget ?? _buildDefaultErrorWidget();
      },
    );
  }

  int? _getCacheDimension(double? dimension, double devicePixelRatio) {
    if (dimension == null || !dimension.isFinite || dimension <= 0) {
      return null;
    }

    return (dimension * devicePixelRatio).round();
  }

  Widget _buildCircularProgressIndicator() {
    return SizedBox(
      width: width,
      height: height,
      child: const AppProgressIndicator(),
    );
  }

  Widget _buildShimmerLoader(BuildContext context) {
    final colors = Theme.of(context).colors;

    return Shimmer.fromColors(
      baseColor: shimmerBaseColor ?? colors.surfaceSecondaryDefault,
      highlightColor: shimmerHighlightColor ?? colors.surfaceDefault,
      child: SizedBox(
        width: shimmerWidth ?? width,
        height: shimmerHeight ?? height,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultErrorWidget() {
    return Center(
      child: Icon(
        ThemeIcons.circleWarning,
        size: errorIconSize,
      ),
    );
  }
}
