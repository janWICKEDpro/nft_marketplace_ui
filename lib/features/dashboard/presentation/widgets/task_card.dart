import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class TasksCard extends StatefulWidget {
  const TasksCard({super.key});

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  List<TaskData> tasks = [
    TaskData(id: '1', title: 'Landing Page Design', isCompleted: false),
    TaskData(id: '2', title: 'Dashboard Builder', isCompleted: true),
    TaskData(id: '3', title: 'Mobile App Design', isCompleted: true),
    TaskData(id: '4', title: 'Illustrations', isCompleted: false),
    TaskData(id: '5', title: 'Promotional LP', isCompleted: true),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isDark ? null : Border.all(color: AppColors.border, width: 1),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.responsive(mobile: 16, desktop: 24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 24),
            _buildTasksList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.check, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            "Tasks",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: context.responsive(mobile: 18, desktop: 20),
            ),
          ),
        ),
        Image.asset(
          "assets/icons/ic_more_horiz${isDark ? "" : "_light"}.png",
          height: 30,
          width: 30,
        ),
      ],
    );
  }

  Widget _buildTasksList(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children:
                tasks.asMap().entries.map((entry) {
                  final index = entry.key;
                  final task = entry.value;

                  return _buildTaskItem(
                    context,
                    task,
                    isLast: index == tasks.length - 1,
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskItem(
    BuildContext context,
    TaskData task, {
    bool isLast = false,
  }) {
    return Container(
      margin: EdgeInsets.only(
        bottom: isLast ? 0 : context.responsive(mobile: 12, desktop: 16),
      ),
      child: Responsive(
        mobile: _buildMobileTaskItem(context, task),
        desktop: _buildDesktopTaskItem(context, task),
      ),
    );
  }

  Widget _buildDesktopTaskItem(BuildContext context, TaskData task) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _buildCheckbox(context, task),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              task.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                decorationColor: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 16),
          _buildDragHandle(context),
        ],
      ),
    );
  }

  Widget _buildMobileTaskItem(BuildContext context, TaskData task) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.darklight.withOpacity(0.3)
                : AppColors.lightbg.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? AppColors.darkBorder
                  : AppColors.border,
          width: 0.5,
        ),
      ),
      child: Row(
        children: [
          _buildCheckbox(context, task),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              task.title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
                decorationColor: Theme.of(context).textTheme.bodyMedium?.color,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 12),
          _buildDragHandle(context),
        ],
      ),
    );
  }

  Widget _buildCheckbox(BuildContext context, TaskData task) {
    return GestureDetector(
      onTap: () {
        setState(() {
          final index = tasks.indexWhere((t) => t.id == task.id);
          if (index != -1) {
            tasks[index] = tasks[index].copyWith(
              isCompleted: !task.isCompleted,
            );
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: task.isCompleted ? AppColors.purple : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          border:
              task.isCompleted
                  ? null
                  : Border.all(
                    color:
                        Theme.of(context).brightness == Brightness.dark
                            ? AppColors.darkTextSecondary
                            : AppColors.textSecondary,
                    width: 2,
                  ),
        ),
        child:
            task.isCompleted
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Icon(
        Icons.drag_indicator,
        color:
            Theme.of(context).brightness == Brightness.dark
                ? AppColors.darkTextSecondary
                : AppColors.textSecondary,
        size: 20,
      ),
    );
  }
}

class TaskData {
  final String id;
  final String title;
  final bool isCompleted;

  TaskData({required this.id, required this.title, required this.isCompleted});

  TaskData copyWith({String? id, String? title, bool? isCompleted}) {
    return TaskData(
      id: id ?? this.id,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
