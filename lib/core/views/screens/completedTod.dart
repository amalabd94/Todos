import 'dart:math';

import 'package:apires/core/modeles/todes.dart';
import 'package:apires/core/viewmodels/todes_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CompletedTod extends StatefulWidget {
  const CompletedTod({super.key});

  @override
  State<CompletedTod> createState() => _CompletedTodState();
}

class _CompletedTodState extends State<CompletedTod> {
  @override
  Widget build(BuildContext context) {
    TodesVm fvm = TodesVm();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 191, 221), // ??? ???????
      // appBar: AppBar(title: Text("Incompleted Todos")), // ???? ???????
      body: FutureBuilder(
        future: fvm.getCompletedTodos(), // ??????? ???? ?????? ??? ????????
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Todos>? completedTodos =
                  snapshot.data; // ??? ?????? ??? ???????? ?? snapshot

              if (completedTodos != null && completedTodos.isNotEmpty) {
                return ListView.builder(
                  itemCount: completedTodos.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: EdgeInsets.all(10), // ????? ??? ????????
                      child: ListTile(
                        title: Text(
                            "${completedTodos[index].todo}"), // ??? ????? ??????
                        subtitle: Text(
                            "Completed: ${completedTodos[index].completed}"), // ???? ??????? (false)
                        leading: CircleAvatar(
                          child: Text(completedTodos[index]
                              .userId
                              .toString()), // ??? userId ???? ?????
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    child: Text(
                        "No incompleted todos found.")); // ??? ?? ??? ???? ???? ??? ??????
              }
            } else {
              return Center(
                  child: Text(
                      "Error fetching data.")); // ?? ??? ???? ??? ?? ??? ????????
            }
          } else {
            return Center(
                child: CircularProgressIndicator()); // ?? ???? ????? ????????
          }
        },
      ),
    );
  }
}
