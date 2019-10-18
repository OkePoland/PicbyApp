import 'package:flutter/material.dart';
import 'package:picby/utils/assets.dart';

class IconsIndicator extends AnimatedWidget {
  IconsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;

  Widget _buildIcon(int index) {
    return new Container(
        child: new InkWell(
        child: index == controller.page ? Assets.openEye : Assets.closedEye,
        onTap: () => onPageSelected(index),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: new List<Widget>.generate(itemCount, _buildIcon),
    );
  }
}