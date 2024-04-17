import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobhunt/main.dart';

void main() {
  testWidgets('Verify initial screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the HomeScreen is displayed.
    expect(find.text('Home Screen'), findsOneWidget);
    expect(find.text('Candidates Screen'), findsNothing); // Candidates Screen should not be visible initially

    // Navigate to Candidates Screen.
    await tester.tap(find.text('Candidates'));
    await tester.pumpAndSettle();

    // Verify that the Candidates Screen is displayed.
    expect(find.text('Candidates Screen'), findsOneWidget);
    expect(find.text('Job Listings Screen'), findsNothing); // Job Listings Screen should not be visible initially
  });

  // Add more tests for other screens and interactions as needed.
}
