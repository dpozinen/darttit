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
  final IconData _iconData;
  final Color _color;
  final String _label;

  _ButtonState(this._iconData, this._color, this._label);

  @override
  Widget build(BuildContext context) {
    return _label.isEmpty ? _buildButtonColumn() : _buildButtonColumnWithText();
  }

  Widget _buildButtonColumn() {
    return Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_buildIconButton()],
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
    if (_iconData == Icons.reply || _iconData == Icons.comment) showCommentDialog();
    setState(() {
      if (_isVoted && isVoteButton(_iconData)) {
        _isVoted = false;
      } else {
        _isVoted = true;
      }
    });
  }

  static isVoteButton(IconData iconData) =>
      iconData == Icons.arrow_upward || iconData == Icons.arrow_downward;

  Color _getColor() {
    if (_iconData == Icons.arrow_downward) return _isVoted ? Colors.deepPurple : _color;
    if (_iconData == Icons.arrow_upward) return _isVoted ? Colors.deepOrangeAccent : _color;
    return _isVoted ? Colors.lightGreen : _color;
  }

  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 8, right: 8, bottom: 10),
                      child: TextFormField(maxLines: null)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      FlatButton(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'CANCEL',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red[300], fontSize: 15),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 70,
                        child: FlatButton(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            'OK',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey[600], fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
