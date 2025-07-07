import 'package:flutter/material.dart';
import 'package:nft_marketplace/core/theme/app_colors.dart';
import 'package:nft_marketplace/core/utils/responsive.dart';

class CalendarCard extends StatefulWidget {
  const CalendarCard({super.key});

  @override
  State<CalendarCard> createState() => _CalendarCardState();
}

class _CalendarCardState extends State<CalendarCard> {
  DateTime selectedDate = DateTime(2021, 4, 27);
  int selectedMonth = 4; // April
  int selectedYear = 2021;
  Set<int> selectedDates = {27, 30}; // Multiple selected dates

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final List<String> weekDays = ['Mo', 'Tu', 'We', 'Th', 'Fri', 'Sa', 'Su'];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.responsive(mobile: 20, desktop: 24)),
      decoration: BoxDecoration(
        color: const Color(0xff1B2559),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: context.responsive(mobile: 20, desktop: 24)),
          _buildWeekDaysHeader(context),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(child: _buildCalendarGrid(context)),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDropdown(
          context,
          months[selectedMonth - 1],
          () => _showMonthPicker(context),
        ),
        const SizedBox(width: 32),
        _buildDropdown(
          context,
          selectedYear.toString(),
          () => _showYearPicker(context),
        ),
      ],
    );
  }

  Widget _buildDropdown(BuildContext context, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: context.responsive(mobile: 18, desktop: 20),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white.withOpacity(0.8),
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDaysHeader(BuildContext context) {
    return Row(
      children:
          weekDays.map((day) {
            return Expanded(
              child: Center(
                child: Text(
                  day,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: context.responsive(mobile: 14, desktop: 15),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
    final daysInMonth = DateTime(selectedYear, selectedMonth + 1, 0).day;
    final firstDayOfMonth = DateTime(selectedYear, selectedMonth, 1);
    final firstWeekday = (firstDayOfMonth.weekday - 1) % 7; // Monday = 0

    // Previous month days
    final previousMonth = selectedMonth == 1 ? 12 : selectedMonth - 1;
    final previousYear = selectedMonth == 1 ? selectedYear - 1 : selectedYear;
    final daysInPreviousMonth =
        DateTime(previousYear, previousMonth + 1, 0).day;

    List<Widget> calendarCells = [];

    // Add previous month days
    for (int i = firstWeekday - 1; i >= 0; i--) {
      final day = daysInPreviousMonth - i;
      calendarCells.add(
        _buildCalendarCell(
          context,
          day,
          isCurrentMonth: false,
          isNextMonth: false,
        ),
      );
    }

    // Add current month days
    for (int day = 1; day <= daysInMonth; day++) {
      calendarCells.add(
        _buildCalendarCell(
          context,
          day,
          isCurrentMonth: true,
          isNextMonth: false,
        ),
      );
    }

    // Add next month days to fill the grid
    final remainingCells = 42 - calendarCells.length; // 6 rows × 7 days
    for (int day = 1; day <= remainingCells; day++) {
      calendarCells.add(
        _buildCalendarCell(
          context,
          day,
          isCurrentMonth: false,
          isNextMonth: true,
        ),
      );
    }

    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 7,
      children: calendarCells,
    );
  }

  Widget _buildCalendarCell(
    BuildContext context,
    int day, {
    required bool isCurrentMonth,
    required bool isNextMonth,
  }) {
    final isSelected = isCurrentMonth && selectedDates.contains(day);
    final cellSize = context.responsive(mobile: 32.0, desktop: 36.0);

    return Container(
      margin: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: isCurrentMonth ? () => _onDateTap(day) : null,
        child: Container(
          width: cellSize,
          height: cellSize,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.purple : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              day.toString(),
              style: TextStyle(
                color:
                    isCurrentMonth
                        ? (isSelected ? Colors.white : Colors.white)
                        : Colors.white.withOpacity(0.4),
                fontSize: context.responsive(mobile: 14, desktop: 15),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onDateTap(int day) {
    setState(() {
      if (selectedDates.contains(day)) {
        selectedDates.remove(day);
      } else {
        selectedDates.add(day);
      }
    });
  }

  void _showMonthPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff1B2559),
          title: const Text(
            'Select Month',
            style: TextStyle(color: Colors.white),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: months.length,
              itemBuilder: (context, index) {
                final month = months[index];
                final monthNumber = index + 1;
                final isSelected = monthNumber == selectedMonth;

                return ListTile(
                  title: Text(
                    month,
                    style: TextStyle(
                      color: isSelected ? AppColors.purple : Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedMonth = monthNumber;
                      selectedDates
                          .clear(); // Clear selections when changing month
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  void _showYearPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xff1B2559),
          title: const Text(
            'Select Year',
            style: TextStyle(color: Colors.white),
          ),
          content: SizedBox(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: 20, // Show 10 years before and after current
              itemBuilder: (context, index) {
                final year = selectedYear - 10 + index;
                final isSelected = year == selectedYear;

                return ListTile(
                  title: Text(
                    year.toString(),
                    style: TextStyle(
                      color: isSelected ? AppColors.purple : Colors.white,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      selectedYear = year;
                      selectedDates.clear();
                    });
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
