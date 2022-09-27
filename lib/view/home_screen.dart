import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/utils/validation_mixin.dart';
import 'package:todo_app/widget/language_picker_widget.dart';

import '../widget/change_theme_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();

  // final _myBox = Hive.box('listItems');

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  void addItemToList(String task) {
    Provider.of<TodoProvider>(context, listen: false).addTodo(task);
  }

  void deleteItemToList(int index) {
    Provider.of<TodoProvider>(context, listen: false).removeTodo(index);
  }

  void editItemToList(int key, String task) {
    Provider.of<TodoProvider>(context, listen: false).editTodo(key, task);
  }

  @override
  void dispose() {
    super.dispose();
    //controller.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themep = Provider.of<ThemeProvider>(context, listen: true).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.allTasks,
          style: TextStyle(
              color: themep ? Colors.white : Colors.black,
              //color: (text == 'DarkTheme') ? Colors.white : Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // const Color.fromARGB(255, 25, 145, 242),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.apps,
              color: Colors.blue,
              size: 30,
            )),
        actions: const [
          LanguagePickerWidget(),
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Consumer<TodoProvider>(builder: ((context, todo, child) {
        return ListView.builder(
            itemCount: todo.getTodoList.length,
            itemBuilder: ((context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color.fromARGB(255, 90, 174, 244),
                ),
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    taskForm(
                        task: todo.getTodoList.values.toList()[index],
                        key: todo.getTodoList.keys.toList()[index],
                        isEdit: true);
                  },
                  trailing: IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title:
                                    const Text("Do you want to delete this?"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        deleteItemToList(index);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Yes")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("No")),
                                ],
                              );
                            }));
                        // deleteItemToList(index);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete)),
                  title: Text(todo.getTodoList.values.toList()[index]),
                ),
              );
            }));
      })),
      floatingActionButton: FloatingActionButton(
        key: const Key("floatingButton"),
        backgroundColor: Colors.blue,
        onPressed: () {
          taskForm(isEdit: false);
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  taskForm({String? task, required bool isEdit, int? key}) {
    setState(() {
      controller.clear();
      isEdit ? controller.text = task.toString() : null;
    });
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.addTasks,
                    key: const Key("addYourTasks"),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    key: const Key("taskDetails1"),
                    controller: controller,
                    validator: (value) =>
                        ValidationMixin().validateTask(value!),
                    // (value) =>
                    //     value!.isEmpty ? 'Please enter the task' : null,
                    //initialValue: controller.,

                    // maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: const Color.fromARGB(255, 90, 174, 244),
                      hintText: AppLocalizations.of(context)!.hintText,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      key: const Key("addButton"),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          )),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          isEdit
                              ? editItemToList(key!, controller.text)
                              : addItemToList(controller.text);

                          setState(() {
                            controller.clear();
                          });
                        } else {
                          return;
                        }
                      },
                      child: Text(
                        isEdit ? "Edit" : "Add",
                        // AppLocalizations.of(context)!.addButton,
                        style: const TextStyle(fontSize: 18),
                      ))
                ],
              ),
            ),
          );
        });

    //   return showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           // backgroundColor: Colors.blue,
    //           title: const Text(
    //             "Add your tasks",
    //             // style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    //           ),

    //           content: Column(
    //             children: [
    //               const TextField(
    //                 maxLines: 4,
    //                 decoration: InputDecoration(
    //                   border: InputBorder.none,
    //                   filled: true,
    //                   fillColor: Color.fromARGB(255, 199, 217, 247),
    //                   hintText: "Enter task details",
    //                 ),
    //               ),
    //               const SizedBox(
    //                 height: 10,
    //               ),
    //               ElevatedButton(
    //                   style: ElevatedButton.styleFrom(
    //                       primary: Colors.blue,
    //                       textStyle: const TextStyle(
    //                           fontSize: 30, fontWeight: FontWeight.bold)),
    //                   onPressed: () {},
    //                   child: const Text("Add"))
    //             ],
    //           ),
    //         );
    //       });
    // }
  }
}
