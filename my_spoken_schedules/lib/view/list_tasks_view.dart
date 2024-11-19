import 'package:flutter/cupertino.dart';
import 'package:my_spoken_schedules/view_model/list_tasks_view_model.dart';

import 'package:my_spoken_schedules/view/widgets/single_task_widget.dart';

import 'package:provider/provider.dart';

class TaskListView extends StatefulWidget {
  const TaskListView({Key? key}) : super(key : key);

  @override
  State<TaskListView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TaskListView> {


  @override
  void initState() {
    super.initState();
    Provider.of<ListTasksViewModel>(context, listen: false).fetchTasks();
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }


  @override
  Widget build(BuildContext context){

    final vm = Provider.of<ListTasksViewModel>(context);


    final parentWidth = MediaQuery.of(context).size.width;

    final gridCount = parentWidth < 800 ? 2: 3;

    return CupertinoPageScaffold(
      navigationBar : CupertinoNavigationBar(
        middle: Text('Your Tasks'),
      ),

      child: Column (children: <Widget>[

        Expanded(
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: vm.tasks!.length,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: gridCount),
            itemBuilder: (BuildContext context, int index){
              final task = vm.tasks[index];

              return SingleTaskWidget(tasksViewModel: task);
            },
          )
        )

      ]),

    );
  }
}