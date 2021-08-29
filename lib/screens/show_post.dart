import 'package:flutter/material.dart';

class ShowPost extends StatelessWidget {
  final Map<String, dynamic> post;

  const ShowPost({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title'],
        style:  Theme.of(context).textTheme.headline4,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: SelectableText(
                post['ar_text'],
                textAlign: TextAlign.end,
                style:  Theme.of(context).textTheme.headline5,
              ),
            )
          ],
        ),
      )),
    );
  }
}
