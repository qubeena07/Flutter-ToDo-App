import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("Integration testing of todo add", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
    var floatButton = find.byIcon(Icons.add);
    await tester.tap(floatButton);

    await tester.pumpAndSettle();

    ///expect(const Text("Add your tasks"), findsOneWidget);
    expect(find.byKey(const Key("addYourTasks")), findsOneWidget);
    //Future.delayed(const Duration(seconds: 4));

    var textfield = find.byKey(const Key("taskDetails1"));
    await tester.enterText(textfield, "eating food");
    // //Future.delayed(const Duration(seconds: 4));
    expect(textfield, findsOneWidget);
    // //expect(find.text("Dancing"), findsOneWidget);

    // Future.delayed(const Duration(seconds: 4));

    var addBut = find.byKey(const Key("addButton"));
    await tester.tap(addBut);
    Future.delayed(const Duration(seconds: 4));
    expect(addBut, findsOneWidget);
    // Future.delayed(const Duration(seconds: 4));
  });
}
