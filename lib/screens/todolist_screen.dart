import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webreinvent_assignment/controller/todo_controller.dart';

import 'completetasklist.dart';

class TaskScreen extends StatelessWidget {
   TaskScreen({super.key});

  final TODoController controller = Get.put(TODoController());
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('ToDoTaskApp',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w600),),
        actions: [
          IconButton(onPressed: (){
Get.to(()=>ViewCompleteList());
          },
              icon: const Icon(Icons.list_sharp,color: Colors.black,size: 20,)
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context,constraints){
        return SizedBox(
          height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: Padding(padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Title here',
                      border: OutlineInputBorder()
                    ),

                  ),
                ),
                Padding(padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green,
                      fixedSize: Size(constraints.maxWidth, 40),),
                      onPressed: (){
                      if(textEditingController.text.isNotEmpty){
                        controller.addNewTask(textEditingController.text);
                        textEditingController.clear();
                      }

                      }, child: const Text('Add Task',style: TextStyle(color: Colors.black,fontSize: 14),)),),


                Expanded(
                    child: Padding(padding: EdgeInsets.only(top: 10),
                    child: Obx(()=>
                    ListView.builder(
                      itemCount: controller.task.length,
                      itemBuilder: (BuildContext context, int index) {
                        final taskList = controller.task[index];
                        return ListTile(
                          title:
                          Text(taskList.title,style: TextStyle(
                            color: taskList.isCompleted?Colors.green:Colors.red
                          ),),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Checkbox(activeColor: Colors.green,

                                  value: taskList.isCompleted,
                                  onChanged: (val){
                                    controller.taskStatus(index);
                                  }),

                              taskList.isCompleted?
                              const Text('Completed',style: TextStyle(color: Colors.green,fontSize: 12,fontWeight: FontWeight.w600),)
                                  :const SizedBox.shrink(),
                              IconButton(onPressed: (){
                                Get.defaultDialog(confirmTextColor: Colors.green,
                                  backgroundColor: Colors.white,
                                    title: 'Delete Task',
                                titleStyle: const TextStyle(color: Colors.red),
                                middleText: "Are you sure you want to delete this task",
                                  middleTextStyle: const TextStyle(color: Colors.black,),
                                  textConfirm: 'yes',
                                  cancelTextColor: Colors.red,
                                  textCancel: 'no',
                                  onConfirm: (){
                                  controller.deleteTask(index);
                                  Get.back();
                                  }

                                );
                              }, icon: const Icon(Icons.delete,color: Colors.red,size: 12,))
                            ],
                          ),
                        );
                      },

                    )),)
                )

              ],
            ),)
        );
      })
    );
  }
}
