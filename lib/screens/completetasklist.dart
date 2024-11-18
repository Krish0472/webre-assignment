import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent_assignment/controller/todo_controller.dart';

class ViewCompleteList extends StatelessWidget {
   ViewCompleteList({super.key});
   final TODoController controller = Get.find<TODoController>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Completed Tasks List',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20),),
        
      ),
      body: Padding(padding: const EdgeInsets.all(8.0),
      child: Obx((){
        return ListView.builder(
          itemCount: controller.task.where((task)=>task.isCompleted).length,
            itemBuilder: (context,index){
          final completedList = controller.task.where((task)=>task.isCompleted).toList();
          final task = completedList[index];
          return ListTile(
            title: Text(
              task.title,style: const TextStyle(color: Colors.black,fontSize: 12),),
            trailing: const Text('Completed',style: TextStyle(color: Colors.green,fontSize: 10),),
          );
        });
    }),),
    );
  }
}
