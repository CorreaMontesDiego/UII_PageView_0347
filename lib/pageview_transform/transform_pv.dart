import 'dart:math';
import 'package:flutter/material.dart';

class TransformPageView extends StatefulWidget {
  const TransformPageView({Key? key}) : super(key: key);

  @override
  State<TransformPageView> createState() => _TransformPageViewState();
}

class _TransformPageViewState extends State<TransformPageView> {
  final _controller = PageController(viewportFraction: 0.6);
  double _currentPage = 0.0;

  void _listener() {
    setState(() {
      _currentPage = _controller.page!;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener((_listener));
  }

  @override
  void dispose() {
    _controller.removeListener((_listener));
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _opty;
    List<String> images = [
      'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/300zx.jpg',
      'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/mazda-rx7.jpg',
      'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/silvia_s15.jpg',
      'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/supramk4.jpg',
      'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/mitsubishi-bravo.jpg',
      'https://raw.githubusercontent.com/CorreaMontesDiego/img_IOS/main/fondo_r32.png'
    ];
    return Center(
        child: SizedBox(
      height: 450.0,
      child: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        itemBuilder: (_, i) {
          if (i == _currentPage) {
            _opty = 1;
            return Transform.scale(
              scale: 1.3,
              child: _pageImages(images[i], _opty),
            );
          } else if (i < _currentPage) {
            _opty = max(1.3 - (_currentPage - i), 0.5);
            return Transform.scale(
              scale: max(1.3 - (_currentPage - i), 0.8),
              child: _pageImages(images[i], _opty),
            );
          } else {
            _opty = max(1.3 - (i - _currentPage), 0.5);
            return Transform.scale(
              scale: max(1.3 - (i - _currentPage), 0.8),
              child: _pageImages(images[i], _opty),
            );
          }
        },
      ),
    ));
  }

  _pageImages(String images, double opty) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffb5ccf6),
            borderRadius: BorderRadius.circular(25.0),
            image: DecorationImage(
                image: NetworkImage(images),
                fit: BoxFit.fitHeight,
                opacity: opty)),
      ),
    );
  }
}
