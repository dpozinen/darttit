import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final IconData _iconData;
  final Color _color;
  final String _label;

  const Button(this._color, this._iconData, this._label);
  const Button.noLabel(this._color, this._iconData) : this._label = '';

  @override
  _ButtonState createState() => _ButtonState(_iconData, _color, _label);
}

class _ButtonState extends State<Button> {
  bool _isVoted = false;
  IconData _iconData;
  Color _color;
  String _label;

  _ButtonState(this._iconData, this._color, this._label);

  @override
  Widget build(BuildContext context) {
    return _label.isEmpty
        ? _buildButtonColumn()
        : _buildButtonColumnWithText();
  }

  Widget _buildButtonColumn() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
	        _buildIconButton()
          ],
        ));
  }

  Column _buildButtonColumnWithText() {
    return Column(
      children: <Widget>[
	      _buildIconButton(),
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            _label,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: _color),
          ),
        )
      ],
    );
  }

  IconButton _buildIconButton() => IconButton(
	  icon: Icon(_iconData),
	  color: _getColor(),
	  onPressed: _toggleVoted,
  );

  void _toggleVoted() {
    setState(() {
      if (_isVoted) {
        _isVoted = false;
      } else {
        _isVoted = true;
      }
    });
  }

  Color _getColor() {
      if (_iconData == Icons.arrow_downward)
        return _isVoted ? Colors.deepPurple : _color;
      if (_iconData == Icons.arrow_upward)
        return _isVoted ? Colors.deepOrangeAccent : _color;
      return _isVoted ? Colors.lightGreen : _color;
  }
}
