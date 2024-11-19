// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_spoken_schedules/view_model/tasks_view_model.dart';

class SingleTaskWidget extends StatefulWidget {
  const SingleTaskWidget({
    Key? key,
    required this.tasksViewModel,
  }) : super(key: key);

  final TasksViewModel tasksViewModel;

  @override
  State<SingleTaskWidget> createState() => _SingleTaskWidgetState();
}

class _SingleTaskWidgetState extends State<SingleTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
      child: Container(width: 200, color: Colors.grey, child: Text("Bruh")
          // child: CachedNetworkImage(imageUrl: "${widget.picturesViewModel.picsumModel!.downloadUrl}", fit: BoxFit.cover,)
          ),
    );
  }
}
