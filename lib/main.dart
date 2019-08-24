import 'package:first/button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_widgets/infinite_widgets.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post',
      home: Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.asset('images/sasha.jpg', fit: BoxFit.cover),
            postTitle,
            postText,
	          ButtonRow([Icons.comment, Icons.share, Icons.arrow_downward, Icons.arrow_upward], ['comment','share','downvote','upvote']),
	          Divider(),
            Column(
              children: <Widget>[commentView],
            )
          ],
        ),
      ),
    );
  }
}

Widget postTitle = Container(
  padding: const EdgeInsets.only(top: 20, left: 25, bottom: 15, right: 25),
  child: Row(
    children: <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'Post Title',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

Widget postText = Container(
  padding: const EdgeInsets.only(bottom: 10, right: 25, left: 25, top: 10),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
  ),
);

Widget comment = Container(
  padding: const EdgeInsets.only(left: 25, right: 25),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Text(
          'This is a very onformative comment lmaoaoaooaoaoaaoa',
        ),
      ),
      ButtonRow([Icons.reply, Icons.share, Icons.arrow_downward, Icons.arrow_upward], [])
    ],
  ),
);

InfiniteListView commentView = InfiniteListView.separated(
  physics: ClampingScrollPhysics(),
  shrinkWrap: true,
  itemCount: 110,
  itemBuilder: (context, index) {
    return ListTile(
      title: comment,
    );
  },
  nextData: null, // TODO: load comment?
  separatorBuilder: (context, int) => Divider(height: 1),
//	separatorBuilder: (context, index) {
//		return Divider();
//	}
);
