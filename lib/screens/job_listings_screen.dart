import 'package:flutter/material.dart';
import 'package:jobhunt/models/job.dart';
import 'package:jobhunt/screens/job_detail_screen.dart';

class JobCard extends StatelessWidget {
  final Job job;

  const JobCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => JobDetailScreen(job: job),
          ),
        );
      },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display the company logo
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(job.logoUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          job.title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Company: ${job.company}',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Location: Mountain View, CA',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Posted on: ${DateTime.now()}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobListingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Custom job listings from big companies
    List<Job> customJobListings = [
      Job(
        title: 'Software Engineer',
        company: 'Google',
        logoUrl: 'assets/images/google.png',
        experience: '3+ years',
        skills: ['Flutter', 'Dart', 'Mobile Development'],
      ),
      Job(
        title: 'Product Manager',
        company: 'Facebook',
        logoUrl: 'assets/images/facebook.png',
        experience: '5+ years',
        skills: ['Product Management', 'Team Leadership', 'Market Analysis'],
      ),
      Job(
        title: 'Data Scientist',
        company: 'Amazon',
        logoUrl: 'assets/images/amazon.png',
        experience: '2+ years',
        skills: ['Data Analysis', 'Machine Learning', 'Python'],
      ),
      Job(
        title: 'UX Designer',
        company: 'Microsoft',
        logoUrl: 'assets/images/microsoft.png',
        experience: '4+ years',
        skills: ['User Experience', 'UI Design', 'Prototyping'],
      ),
      Job(
        title: 'iOS Developer',
        company: 'Apple',
        logoUrl: 'assets/images/apple.png',
        experience: '3+ years',
        skills: ['iOS Development', 'Swift', 'Xcode'],
      ),
      Job(
        title: 'Mechanical Engineer',
        company: 'Tesla',
        logoUrl: 'assets/images/tesla.png',
        experience: '5+ years',
        skills: ['Mechanical Engineering', 'Product Design', 'CAD'],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Job Listings'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: customJobListings.map((job) {
            return JobCard(job: job);
          }).toList(),
        ),
      ),
    );
  }
}
