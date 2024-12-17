import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:my_spoken_schedules/view_model/list_schedules_view_model.dart';
import 'package:my_spoken_schedules/view/schedule_detail_view.dart';

class ScheduleListView extends StatefulWidget {
  @override
  _ScheduleListViewState createState() => _ScheduleListViewState();
}

class _ScheduleListViewState extends State<ScheduleListView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ListSchedulesViewModel>(context, listen: false)
          .fetchSchedules();
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ListSchedulesViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.deepOrange, //change your color here
        ),
        title: const Text('Schedules'),
      ),
      body: ListView.builder(
        itemCount: vm.schedules.length + 1,
        itemBuilder: (context, index) {
          if (index == vm.schedules.length) {
            return Card(
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text('Add New Schedule'),
                  trailing: const Icon(Icons.add, color: Colors.deepOrange),
                  onTap: () {
                    vm.addSchedule();
                  },
                ));
          }
          final scheduleViewModel = vm.schedules[index];
          return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(1.0),
                leading: Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                      value: scheduleViewModel.scheduleModel?.isActive ?? false,
                      activeColor: Colors.deepOrange,
                      onChanged: (bool? value) {
                        scheduleViewModel.updateIsActive(value!);
                        vm.refreshSchedules();
                      }),
                ),
                title: Text(scheduleViewModel.scheduleModel?.label ??
                    'Unnamed Schedule'),
                subtitle: Text(
                  (scheduleViewModel.scheduleModel?.days ?? []).join(', '),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.mode_edit, color: Colors.deepOrange),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider.value(
                              value:
                                  scheduleViewModel, // Pass the existing SchedulesViewModel instance
                              child: ScheduleDetailView(
                                  vm: vm, scheduleViewModel: scheduleViewModel),
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_forever,
                          color: Colors.deepOrange),
                      onPressed: () {
                        final scheduleId = scheduleViewModel.scheduleModel.id;
                        if (scheduleId != null) {
                          vm.removeSchedule(scheduleId);
                          // taskViewModel.refreshTasks();
                          // notifyListeners();
                        } else {
                          debugPrint(
                              "Schedule ID is null. Cannot remove task.");
                          // taskViewModel.refreshTasks();
                          // notifyListeners();
                        }
                      },
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
