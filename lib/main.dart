import 'package:flutter/material.dart';
import 'package:jobhunt/screens/home_screen.dart';
import 'package:jobhunt/screens/login_page.dart'; // Import your LoginScreen here
import 'package:jobhunt/screens/candidates_screen.dart';
import 'package:jobhunt/screens/candidate_detail_screen.dart';
import 'package:jobhunt/screens/create_post_screen.dart';
import 'package:jobhunt/screens/job_listings_screen.dart';
import 'package:jobhunt/screens/job_detail_screen.dart';
import 'package:jobhunt/models/candidate.dart';
import 'package:jobhunt/models/job.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JobHunt',
      initialRoute: '/login', // Set initial route to login
      routes: {
        '/login': (context) => LoginPage(), // Use LoginScreen as initial route
        '/home': (context) => HomeScreen(),
        '/candidates': (context) => CandidatesScreen(),
        '/create_post': (context) => CreatePostScreen(),
        '/job_listings': (context) => JobListingsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/candidate_detail') {
          final args = settings.arguments as CandidateDetailArguments;
          return MaterialPageRoute(
            builder: (context) => CandidateDetailScreen(candidate: args.candidate),
          );
        }
        if (settings.name == '/job_detail') {
          final args = settings.arguments as JobDetailArguments;
          return MaterialPageRoute(
            builder: (context) => JobDetailScreen(job: args.job),
          );
        }
      },
    );
  }
}

// Define CandidateDetailArguments class
class CandidateDetailArguments {
  final Candidate candidate;

  CandidateDetailArguments({required this.candidate});
}

// Define JobDetailArguments class
class JobDetailArguments {
  final Job job;

  JobDetailArguments({required this.job});
}
