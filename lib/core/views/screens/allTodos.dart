import 'package:apires/core/modeles/todes.dart';
import 'package:apires/core/viewmodels/todes_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllTodos extends StatefulWidget {
  const AllTodos({super.key});

  @override
  State<AllTodos> createState() => _AllTodosState();
}

class _AllTodosState extends State<AllTodos> {
  @override
  Widget build(BuildContext context) {
    TodesVm vm = TodesVm();
    return Scaffold(
      backgroundColor: Color(0XFFFEF9EB), 
    
      body: FutureBuilder(
        future: vm.getTodo(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              List<Todos>? allTodos =
                  snapshot.data; 

              if (allTodos != null && allTodos.isNotEmpty) {
                return ListView.builder(
                  itemCount: allTodos.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      margin: EdgeInsets.all(10), // ????? ??? ????????
                      child: ListTile(
                        title:
                            Text("${allTodos[index].todo}"), // ??? ????? ??????
                        subtitle: Text(
                            "Completed: ${allTodos[index].completed}"), // ???? ???????
                        leading: CircleAvatar(
                          child: Text(allTodos[index]
                              .userId
                              .toString()), // ??? userId ???? ?????
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                    child: Text("No todos found.")); 
              }
            } else {
              return Center(
                  child: Text(
                      "Error fetching data.")); 
            }
          } else {
            return Center(
                child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
