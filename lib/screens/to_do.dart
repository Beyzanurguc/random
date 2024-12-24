import 'package:flutter/material.dart';
import 'package:to_do_app/screens/calculator.dart';

class ToDoAppPage extends StatefulWidget {
  const ToDoAppPage({super.key});

  @override
  State<ToDoAppPage> createState() => _ToDoAppPageState();
}

class _ToDoAppPageState extends State<ToDoAppPage> {
  final List<Map<String, dynamic>> _tasks = []; // Görevler listesi
  final TextEditingController _taskController =
      TextEditingController(); // Görev ekleme için kontrolör

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add({"task": _taskController.text, "completed": false});
        _taskController.clear();
      });
    }
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index]["completed"] = !_tasks[index]["completed"];
    });
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FEFE),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 254, 254),
        title: const Text("To-Do List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Görev ekleme alanı
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: "Add a task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 169, 235, 235),
                    ),
                  ),
                  onPressed: _addTask,
                  child: const Text("Add"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Görevler listesi
            Expanded(
              child: _tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks added yet!",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        final task = _tasks[index];
                        return Card(
                          color: const Color.fromARGB(255, 169, 235, 235),
                          child: ListTile(
                            leading: Checkbox(
                              value: task["completed"],
                              onChanged: (value) {
                                _toggleTaskCompletion(index);
                              },
                            ),
                            title: Text(
                              task["task"],
                              style: TextStyle(
                                decoration: task["completed"]
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _deleteTask(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Calculator(),
                  ),
                );
              },
              backgroundColor: const Color.fromARGB(255, 169, 235, 235),
              child: const Icon(
                Icons.calculate,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
