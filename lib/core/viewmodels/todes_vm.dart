import 'package:apires/core/modeles/todes.dart';
import 'package:dio/dio.dart';

class TodesVm {
    // كائن dio للتعامل مع Api
  Dio dio = Dio();
    // دالة لجلب جميع المهام وتحويلها الى قائمة من نوعTodos"
  Future<List<Todos>?> getTodo() async {
    try {
    //استدعاء ِApi لجلب المهاام
      Response res = await dio.get("https://dummyjson.com/todos");

    //تحويل map للوصول الى قائمة بداخل القاءمة map ثانية
      Map<String, dynamic> allTodos = res.data;
      List<dynamic> list = allTodos["todos"];

     //بتحويل كل عنصر بقائمة  الى كائن من نوعTodos باستخدامformjson
      List<Todos> listTodos = list.map((e) => Todos.fromJson(e)).toList();

      return listTodos; 
    } catch (e) {
      print("the exception is $e");
      return null; 
    }
  }

  // ???? ?????? ??? ?????? ???????? ???????? where
  Future<List<Todos>?> getCompletedTodos() async {
    try {
      // ??? ???? ??????
      List<Todos>? allTodos = await getTodo();

      if (allTodos != null) {
        // ????? ?????? ????????
        List<Todos> completedTodos =
            allTodos.where((todo) => todo.completed == true).toList();
        return completedTodos;
      } else {
        return null;
      }
    } catch (e) {
      print("the exception is $e");
      return null;
    }
  }
 //دالة للحصول على المهام المكتملة باستخدام where
  Future<List<Todos>?> getIncompletedTodos() async {
    try {
      // جلب جميع المهام
      List<Todos>? allTodos = await getTodo();

      if (allTodos != null) {
        // تصفية المهام غير المكتملة
        List<Todos> incompletedTodos = allTodos.where((todo) => todo.completed == false).toList();
        return incompletedTodos;
      } else {
        return null;
      }
    } catch (e) {
      print("the exception is $e");
      return null;
    }
  }

  // دالة لارجاع المهام بناء علىuserIdمحدد
  Future<List<Todos>?> getTodosByUserId(int userId) async {
    try {
      // جلب جميع المهام
      List<Todos>? allTodos = await getTodo();

      if (allTodos != null) {
        // تصفية المهام بناء على userId
        List<Todos> userTodos = allTodos.where((todo) => todo.userId == userId).toList();
        return userTodos;
      } else {
        return null;
      }
    } catch (e) {
      print("the exception is $e");
      return null;
    }
  }


  Future<List<Todos>?> getJustTodos() async {
    Response res1 = await dio.get("https://dummyjson.com/todos");
    List<Todos>? justTodos =
        res1.data!.map<Todos>((e) => Todos.fromJson(e)).toList();
    return justTodos!;
  }
//دالة الحصول على المهام المكتملة باستخدام where
}
