import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../../configs/asset_paths.dart';

class BonfireBackgroundCarousel extends StatefulWidget {
  const BonfireBackgroundCarousel({super.key});

  @override
  State<BonfireBackgroundCarousel> createState() => _BonfireBackgroundCarouselState();
}

class _BonfireBackgroundCarouselState extends State<BonfireBackgroundCarousel> {
  final List<String> images = [
    AssetPaths.background,
    AssetPaths.bonfireBackground2,
    AssetPaths.bonfireBackground3,
    AssetPaths.bonfireBackground4,
    AssetPaths.bonfireBackground5,
    AssetPaths.bonfireBackground7,
    AssetPaths.bonfireBackground8,
    AssetPaths.bonfireBackground9,
    AssetPaths.bonfireBackground10,
  ];
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 2000), (_) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: images.length,
      onPageChanged: (i) {
        setState(() => _currentPage = i);
        _startAutoScroll();
      },
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return _BackgroundImageWithBlur(
              imagePath: images[index],
              width: constraints.maxWidth,
              height: constraints.maxHeight,
            );
          },
        );
      },
    );
  }
}

class _BackgroundImageWithBlur extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;
  const _BackgroundImageWithBlur({required this.imagePath, required this.width, required this.height});

  Future<Size> _getImageSize(BuildContext context) async {
    final completer = Completer<Size>();
    final img = Image.asset(imagePath);
    img.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(
          info.image.width.toDouble(),
          info.image.height.toDouble(),
        ));
      }),
    );
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Size>(
      future: _getImageSize(context),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.expand();
        }
        final imgSize = snapshot.data!;
        final imgRatio = imgSize.width / imgSize.height;
        final widgetRatio = width / height;
        if (imgRatio < 1) {
          return Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: width,
            height: height,
            alignment: Alignment.center,
          );
        } else {
          return Stack(
            fit: StackFit.expand,
            children: [
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: width,
                  height: height,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: height*0.15,
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: width,
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
} 