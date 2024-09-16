import 'package:apires/core/viewmodels/todes_vm.dart';
import 'package:apires/core/views/screens/allTodos.dart';
import 'package:apires/core/views/screens/completedTod.dart';
import 'package:apires/core/views/screens/incompletedTod.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../modeles/todes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  Todo? todoModel;
  TodesVm pvm = TodesVm();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              " Todos ",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            backgroundColor: Color.fromARGB(255, 247, 222, 236),
            bottom: TabBar(tabs: [
              Text("Completed",
                  style: TextStyle(fontSize: 12, color: Colors.black)),
              Text("InCompleted",
                  style: TextStyle(fontSize: 11, color: Colors.black)),
              Text("AllTodo",
                  style: TextStyle(fontSize: 13, color: Colors.black)),
            ]),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: TabBarView(children: [
              CompletedTod(),
              IncompletedTod(),
              AllTodos(),
            ]),
          ),
        ));
  }
}
