import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/utils/validation_mixin.dart';

void main() {
  test("Validation of task", () {
    var result = ValidationMixin().validateTask("");
    expect(result, "Please enter task");
  });
}



 // await tester.pumpWidget(const MaterialApp(
    //   home: HomeScreen(),
    // ));
    // // var taskField = find.byKey(const ValueKey("taskDetails"));
    // // final addButton = find.byKey(const ValueKey("addButton"));
    // // var taskField = find.byType(TextField);
    // // var addButton = find.byType(ElevatedButton);

    // // await tester.enterText(taskField, "find a task details");
    // // await tester.tap(addButton);
    // //await tester.pump();
    // expect(find.byKey(const ValueKey("taskDetails")), findsOneWidget);

    // // expect(find.text("find a task details"), findsOneWidget);