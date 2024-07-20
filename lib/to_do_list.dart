import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final List<String> tasks = [];
  final TextEditingController textController = TextEditingController();

  void _addTask(String task) {
    setState(() {
      tasks.add(task);
    });
    textController.clear();
  }

  void _removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  _editTask(int index, String updatedTask) {
    setState(() {
      tasks[index] = updatedTask;
    });
    textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 60, 150),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 48, 89, 224),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        title: const Text(
          "To-Do List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: index.isEven
                            ? const Color.fromARGB(255, 57, 95, 219)
                            : const Color.fromARGB(255, 94, 131, 253),
                        borderRadius: BorderRadius.circular(20)),
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          tasks[index],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 19),
                        ),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              textController.text = tasks[index];
                              showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: Container(
                                        width: 700,
                                        height: 200,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: const Color.fromARGB(
                                                255, 255, 214, 204)),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20.0,
                                                      vertical: 30),
                                              child: TextField(
                                                controller: textController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            "Edit your task"),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: const Color
                                                                .fromARGB(255,
                                                                255, 171, 171)),
                                                        child: TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: const Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black45),
                                                            ))),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8.0),
                                                      child: Container(
                                                          width: 80,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  241,
                                                                  101,
                                                                  91)),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                if (textController
                                                                    .text
                                                                    .isNotEmpty) {
                                                                  _editTask(
                                                                      index,
                                                                      textController
                                                                          .text);
                                                                }
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: const Text(
                                                                "Save",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ))),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              _removeTask(index);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return Dialog(
                    child: Container(
                      width: 700,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(255, 255, 214, 204)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 30),
                            child: TextField(
                              controller: textController,
                              decoration: const InputDecoration(
                                  labelText: "Enter your text"),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: const Color.fromARGB(
                                              255, 255, 171, 171)),
                                      child: TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: const Text("Cancel",
                                              style: TextStyle(
                                                  color: Colors.black45)))),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                        width: 80,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: const Color.fromARGB(
                                                255, 241, 101, 91)),
                                        child: TextButton(
                                            onPressed: () {
                                              if (textController
                                                  .text.isNotEmpty) {
                                                _addTask(textController.text);
                                              }
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                });
          },
          shape: const CircleBorder(),
          backgroundColor: const Color.fromARGB(255, 223, 68, 68),
          splashColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          )),
    );
  }
}
