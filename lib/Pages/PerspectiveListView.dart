import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:player_card/Pages/Card.dart';

class PerspectiveListView extends StatefulWidget {
  const PerspectiveListView({
    Key? key,
    required this.children,
    required this.itemExtent,
    required this.visualizedItems,
    this.initialIndex = 0,
    this.padding = const EdgeInsets.all(0.0),
    this.backItemShadowColor = Colors.black,
    required this.onTapFrontItem,
    required this.onChangeItem,
  }) : super(key: key);

  final List<Widget> children;
  final double itemExtent;
  final int visualizedItems;
  final int initialIndex;
  final EdgeInsetsGeometry padding;
  final ValueChanged<int> onTapFrontItem;
  final ValueChanged<int> onChangeItem;
  final Color backItemShadowColor;

  @override
  State<PerspectiveListView> createState() => _PerspectiveListViewState();
}

class _PerspectiveListViewState extends State<PerspectiveListView> {
  late PageController _pageController;
  late double _pagePercent;
  late int _currentIndex;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: widget.initialIndex,
        viewportFraction: 1 / widget.visualizedItems);
    _currentIndex = widget.initialIndex;
    _pagePercent = 0.0;
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _currentIndex = _pageController.page!.floor();
    _pagePercent = (_pageController.page! - _currentIndex).abs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: widget.padding,
        child: _PerspectiveItems(
          heightItem: widget.itemExtent,
          currentIndex: _currentIndex,
          children: widget.children,
          generateItems: widget.visualizedItems,
          pagePercent: _pagePercent,
        ),
      ),
      PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _pageController,
          physics: const BouncingScrollPhysics(),
          onPageChanged: (value) {
            if (widget.onChangeItem != null) {
              widget.onChangeItem(value);
            }
          },
          itemCount: widget.children.length,
          itemBuilder: (context, index) {
            return const SizedBox();
          }),
    ]);
  }
}

class _PerspectiveItems extends StatelessWidget {
  const _PerspectiveItems({
    Key? key,
    required this.generateItems,
    required this.currentIndex,
    required this.heightItem,
    required this.pagePercent,
    required this.children,
  }) : super(key: key);

  final int generateItems;
  final int currentIndex;
  final double heightItem;
  final double pagePercent;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final height = constraints.maxHeight;
      return Stack(
        fit: StackFit.expand,
        children: List.generate(generateItems, (index) {
          return Container(); //_TransformedWidget();
        }),
      );
    });
  }
}

class _TransformedWidget extends StatelessWidget {
  const _TransformedWidget({
    super.key,
    required this.child,
    required this.heightItem,
    required this.factorChange,
    this.scale = 1.0,
    this.endscale = 1.0,
    this.translateY = 0.0,
    this.endtranslateY = 0.0,
  });

  final Widget child;
  final double heightItem;
  final double factorChange;
  final double scale;
  final double endscale;
  final double translateY;
  final double endtranslateY;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..scale(
          lerpDouble(scale, endscale, factorChange),
        ),
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: heightItem,
          width: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
