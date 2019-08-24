import 'package:first/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<IconData> iconData;
  final List<String> labels;

  ButtonRow(this.iconData, this.labels);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).buttonColor;

    return LayoutBuilder(builder: (context, constraints) {
      if (labels.isEmpty)
        return createRow(noTextIcons(color));
      else
        return createRow(textIcons(color));
    });
  }

  List noTextIcons(Color color) {
    List buttons = List<Widget>();
    for (IconData d in iconData) buttons.add(Button.noLabel(color, d));
    return buttons;
  }

  List textIcons(Color color) {
    List buttons = List<Widget>();
    for (int i = 0; i < iconData.length; i++)
      buttons.add(Button(color, iconData.elementAt(i), labels.elementAt(i)));
    return buttons;
  }

  Widget createRow(List icons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: icons,
    );
  }
}
