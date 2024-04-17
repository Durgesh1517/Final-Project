import 'package:flutter/material.dart';
import 'package:jobhunt/models/job.dart';

class JobListingCard extends StatelessWidget {
  final Job job;

  const JobListingCard({Key? key, required this.job}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(job.logoUrl),
        ),
        title: Text(job.title),
        subtitle: Text(job.company),
        onTap: () {

        },
      ),
    );
  }
}
