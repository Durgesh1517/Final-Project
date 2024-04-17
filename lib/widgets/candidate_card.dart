import 'package:flutter/material.dart';
import 'package:jobhunt/models/candidate.dart';

class CandidateCard extends StatelessWidget {
  final Candidate candidate;

  const CandidateCard({Key? key, required this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(candidate.imageUrl),
        ),
        title: Text(candidate.name),
        subtitle: Text(candidate.jobTitle),
        onTap: () {

        },
      ),
    );
  }
}
