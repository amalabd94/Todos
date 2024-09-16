import 'package:apires/core/modeles/todes.dart';
import 'package:apires/core/viewmodels/todes_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IncompletedTod extends StatefulWidget {
  const IncompletedTod({super.key});

  @override
  State<IncompletedTod> createState() => _IncompletedTodState();
}

class _IncompletedTodState extends State<IncompletedTod> {
  @override
  Widget build(BuildContext context) {
    TodesVm tvm = TodesVm();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 191, 221), // ??? ???????
     // appBar: AppBar(title: Text("Incompleted Todos")), // ???? ???????
      body: FutureBuilder(
        future: tvm.getIncompletedTodos(), // ??????? ???? ?????? ??? ????????
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Todos>? incompletedTodos = snapshot.data; // ??? ?????? ??? ???????? ?? snapshot

              if (incompletedTodos != null && incompletedTodos.isNotEmpty) {
                return ListView.builder(
                  itemCount: incompletedTodos.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: EdgeInsets.all(10), // ????? ??? ????????
                      child: ListTile(
                        title: Text("${incompletedTodos[index].todo}"), // ??? ????? ??????
                        subtitle: Text("Completed: ${incompletedTodos[index].completed}"), // ???? ??????? (false)
                        leading: CircleAvatar(
                          child: Text(incompletedTodos[index].userId.toString()), // ??? userId ???? ?????
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("No incompleted todos found.")); // ??? ?? ??? ???? ???? ??? ??????
              }
            } else {
              return Center(child: Text("Error fetching data.")); // ?? ??? ???? ??? ?? ??? ????????
            }
          } else {
            return Center(child: CircularProgressIndicator()); // ?? ???? ????? ????????
          }
        },
      ),
    );
  }
}
