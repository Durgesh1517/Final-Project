import 'package:flutter/material.dart';
import 'package:jobhunt/models/candidate.dart';
import 'package:jobhunt/screens/candidate_detail_screen.dart';



class CandidatesScreen extends StatefulWidget {
  @override
  _CandidatesScreenState createState() => _CandidatesScreenState();
}

class _CandidatesScreenState extends State<CandidatesScreen> {
  final List<Candidate> candidates = [
    Candidate(
      name: "John Doe",
      jobTitle: "Software Engineer",
      imageUrl: 'assets/images/c4.jpeg',
      description: "Experienced software engineer with expertise in developing scalable applications.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "Durgesh",
      jobTitle: "Web Developer",
      imageUrl: 'assets/images/c10.jpeg',
      description: "Creative web developer with a passion for building interactive and user-friendly websites.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "Michael Johnson",
      jobTitle: "Data Scientist",
      imageUrl: 'assets/images/c1.jpeg',
      description: "Data scientist specialized in analyzing large datasets and deriving actionable insights.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "Emily Smith",
      jobTitle: "Graphic Designer",
      imageUrl: 'assets/images/c2.jpeg',
      description: "Talented graphic designer with a keen eye for detail and a passion for visual storytelling.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "Sophia Brown",
      jobTitle: "Marketing Manager",
      imageUrl: 'assets/images/c3.jpeg',
      description: "Marketing professional with extensive experience in developing and executing successful marketing campaigns.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "David Wilson",
      jobTitle: "Product Manager",
      imageUrl: 'assets/images/c5.jpeg',
      description: "Product manager with a track record of delivering innovative products that meet user needs.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "Jessica Lee",
      jobTitle: "UI/UX Designer",
      imageUrl: 'assets/images/c6.jpeg',
      description: "UI/UX designer passionate about creating intuitive and visually appealing user interfaces.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "Ryan Miller",
      jobTitle: "Financial Analyst",
      imageUrl: 'assets/images/c7.jpeg',
      description: "Financial analyst with expertise in financial modeling and data analysis.",
    ),
    Candidate(
      name: "Amanda Taylor",
      jobTitle: "HR Manager",
      imageUrl: 'assets/images/c8.jpeg',
      description: "Human resources professional with a focus on recruiting, employee relations, and organizational development.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
    Candidate(
      name: "William Martinez",
      jobTitle: "Sales Representative",
      imageUrl: 'assets/images/c9.jpeg',
      description: "Results-driven sales representative with a proven track record of exceeding sales targets.Done more than 100 projects for the company and serving the company with full hardwork and dedication",
    ),
  ];

  List<Candidate> filteredCandidates = [];

  @override
  void initState() {
    super.initState();
    filteredCandidates = candidates;
  }

  void _filterCandidates(String query) {
    setState(() {
      filteredCandidates = candidates
          .where((candidate) => candidate.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Candidates'),
      ),
      backgroundColor: Colors.blue[200],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Candidates...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                ),
                onChanged: _filterCandidates,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCandidates.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CandidateDetailScreen(candidate: filteredCandidates[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: AssetImage(filteredCandidates[index].imageUrl),
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      filteredCandidates[index].name,
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      filteredCandidates[index].jobTitle,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Divider(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
