import 'package:flutter/material.dart';
import 'package:jobhunt/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        title: Text(post.author),
        subtitle: Text(post.content),
        trailing: Text(
          // Format the timestamp as needed
          '${post.timestamp.hour}:${post.timestamp.minute}',
        ),
      ),
    );
  }
}
