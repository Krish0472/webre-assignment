import 'package:get/get.dart';
import 'package:webreinvent_assignment/taskmodelclass/todomodel.dart';

class TODoController extends GetxController{
  var task = <Task>[].obs;
  void addNewTask(String title){
    task.add(Task(title: title));
  }

  void taskStatus(int index){
    task[index].isCompleted=!task[index].isCompleted;
    task.refresh();
  }

  void deleteTask(int index){
    task.removeAt(index);
  }

}