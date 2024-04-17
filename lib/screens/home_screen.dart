import 'package:flutter/material.dart';
import 'package:jobhunt/models/candidate.dart';
import 'package:jobhunt/models/post.dart';
import 'package:jobhunt/screens/candidates_screen.dart';
import 'package:jobhunt/screens/create_post_screen.dart';
import 'package:jobhunt/screens/job_listings_screen.dart';



class HomeScreen extends StatelessWidget {
  final List<Post> posts = [
    Post(author: 'John Doe', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c4.jpeg'),
    Post(author: 'Durgesh', content: '"I am Eager to join a Startup company."', timestamp: DateTime.now(), imageUrl: 'assets/images/c10.jpeg'),
    Post(author: 'Michael Johnson', content: '"Happy Morning, Enjoying Present!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c1.jpeg'),
    Post(author: 'Emily Smith', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c2.jpeg'),
    Post(author: 'Sophia Brown', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c3.jpeg'),
    Post(author: 'David Wilson', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c5.jpeg'),
    Post(author: 'Jessica Lee', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c6.jpeg'),
    Post(author: 'Ryan Miller', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c7.jpeg'),
    Post(author: 'Amanda Taylor', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c8.jpeg'),
    Post(author: 'William Martinez', content: '"Excited to join this platform!"', timestamp: DateTime.now(), imageUrl: 'assets/images/c9.jpeg'),


  ];

  final Candidate? connectedCandidate;

  HomeScreen({Key? key, this.connectedCandidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final connectedAuthor = connectedCandidate?.name ?? '';

    final connectedPosts = posts.where((post) => post.author == connectedAuthor).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade200, Colors.blue.shade600],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: connectedPosts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20.0,
                                  backgroundImage: AssetImage(connectedPosts[index].imageUrl),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  'Posted by ${connectedPosts[index].author}',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              connectedPosts[index].content,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Posted on ${connectedPosts[index].timestamp}',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CandidatesScreen()),
                      );
                    },
                    child: Text('Candidates'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreatePostScreen()),
                      );
                    },
                    child: Text('Create Post'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => JobListingsScreen()),
                      );
                    },
                    child: Text('Job Listing'),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
