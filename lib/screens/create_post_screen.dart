import 'package:flutter/material.dart';
import 'package:jobhunt/models/post.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String _postType = 'Job Listing'; // Default post type
  TextEditingController _contentController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _companyController = TextEditingController();

  List<Post> posts = []; // List to store created posts

  @override
  void dispose() {
    _contentController.dispose();
    _titleController.dispose();
    _companyController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: _postType,
              onChanged: (value) {
                setState(() {
                  _postType = value!;
                });
              },
              items: ['Job Listing', 'Regular Post'].map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(
                    type,
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Post Type',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            if (_postType == 'Regular Post')
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: 'Post Content',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
            if (_postType == 'Job Listing') ...[
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _companyController,
                decoration: InputDecoration(
                  labelText: 'Company Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Get user input
                String content = _contentController.text;
                String title = _titleController.text;
                String company = _companyController.text;

                // Create the post based on post type
                if (_postType == 'Regular Post') {
                  // Create regular post
                  Post newPost = Post(
                    author: 'Durgesh',
                    content: content,
                    timestamp: DateTime.now(),
                    imageUrl: '',
                  );

                  // Add the new post to the beginning of the list
                  setState(() {
                    posts.insert(0, newPost);
                  });
                } else {
                  // Create job listing post
                  // TODO: Handle job listing creation logic
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Post created successfully!'),
                  ),
                );

                // Clear all input fields
                _contentController.clear();
                _titleController.clear();
                _companyController.clear();
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Create Post',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      elevation: 4.0,
                      child: ListTile(
                        title: Text(posts[index].content),
                        subtitle: Text('Posted by ${posts[index].author}'),
                        // You can customize how you display the post details here
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
