import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var textFieldd = find.byKey(const ValueKey("textField"));
    var pressBb = find.byKey(const ValueKey("pressButton"));

    await tester.enterText(textFieldd, "find a task");
    await tester.tap(pressBb);

    expect(textFieldd, findsOneWidget);
    //expect("find a task", findsOneWidget);
  });
}
