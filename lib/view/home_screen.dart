import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todo_provider.dart';

import '../widget/change_theme_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController controller = TextEditingController();
  // TextEditingController title = TextEditingController();

  //final List<String> items = List.from(listItems);

  // final _myBox = Hive.box('listItems');

  @override
  void initState() {
    setState(() {});
    super.initState();
    // TodoProvider().getTodoList();
    // log(TodoProvider().getTodoList().toString());
  }

  void addItemToList(String task) {
    Provider.of<TodoProvider>(context, listen: false).addTodo(task);
  }

  void deleteItemToList(int index) {
    Provider.of<TodoProvider>(context, listen: false).removeTodo(index);
  }

  @override
  void dispose() {
    super.dispose();
    //controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
    //     ? 'DarkTheme'
    //     : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.allTasks,
          style: const TextStyle(
              //color: (text == 'DarkTheme') ? Colors.white : Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.apps,
              color: Colors.blue,
              size: 30,
            )),
        actions: const [
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
        backgroundColor: Colors.blue,
        onPressed: () {
          taskForm();
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  taskForm() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  "Add your tasks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: controller,
                  // maxLines: 5,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromARGB(255, 90, 174, 244),
                    hintText: "Enter task details",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: const TextStyle(
                          fontSize: 20,
                        )),
                    onPressed: () {
                      // final key = Random().nextInt(1000000);
                      addItemToList(controller.text);
                      // log(Provider.of<TodoProvider>(context, listen: false)
                      //     .getTodoList
                      //     .toString());

                      setState(() {
                        controller.clear();
                      });
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(fontSize: 18),
                    ))
              ],
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
