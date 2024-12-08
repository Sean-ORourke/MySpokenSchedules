import 'package:flutter/material.dart';

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
        title: const Text('Schedules'),
      ),
      body: ListView.builder(
        itemCount: vm.schedules.length + 1,
        itemBuilder: (context, index) {
          if (index == vm.schedules.length) {
            return ListTile(
              title: const Text('Add New Schedule'),
              trailing: const Icon(Icons.add),
              onTap: () {
                vm.addSchedule();
              },
            );
          }
          final scheduleViewModel = vm.schedules[index];
          return ListTile(
            title: Text(
                scheduleViewModel.scheduleModel?.label ?? 'Unnamed Schedule'),
            subtitle: Text(
              (scheduleViewModel.scheduleModel?.days ?? []).join(', '),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value:
                        scheduleViewModel, // Pass the existing SchedulesViewModel instance
                    child: ScheduleDetailView(
                        scheduleViewModel: scheduleViewModel),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
