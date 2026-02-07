import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum AttendanceStatus { present, absent, holiday }

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _focusedDate = DateTime.now();

  // Dummy attendance data
  final Map<DateTime, AttendanceStatus> attendanceData = {};

  @override
  void initState() {
    super.initState();
    _generateDummyAttendance();
  }

  void _generateDummyAttendance() {
    final now = DateTime.now();
    final daysInMonth =
    DateUtils.getDaysInMonth(now.year, now.month);

    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime(now.year, now.month, i);
      if (date.weekday == DateTime.sunday) {
        attendanceData[date] = AttendanceStatus.holiday;
      } else {
        attendanceData[date] =
        i % 6 == 0 ? AttendanceStatus.absent : AttendanceStatus.present;
      }
    }
  }

  void _changeMonth(int offset) {
    setState(() {
      _focusedDate =
          DateTime(_focusedDate.year, _focusedDate.month + offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(
      _focusedDate.year,
      _focusedDate.month,
    );

    final firstDayOfMonth =
    DateTime(_focusedDate.year, _focusedDate.month, 1);

    final weekdayOffset = firstDayOfMonth.weekday % 7;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance'),
      ),
      body: Column(
        children: [
          _buildMonthHeader(),
          _buildWeekDays(),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: daysInMonth + weekdayOffset,
              itemBuilder: (context, index) {
                if (index < weekdayOffset) {
                  return const SizedBox.shrink();
                }

                final day = index - weekdayOffset + 1;
                final date = DateTime(
                  _focusedDate.year,
                  _focusedDate.month,
                  day,
                );

                final status = attendanceData[date];

                return _buildDayCell(day, status);
              },
            ),
          ),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => _changeMonth(-1),
          ),
          Text(
            DateFormat.yMMMM().format(_focusedDate),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () => _changeMonth(1),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    final days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: days
            .map(
              (d) => Expanded(
            child: Center(
              child: Text(
                d,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
            .toList(),
      ),
    );
  }

  Widget _buildDayCell(int day, AttendanceStatus? status) {
    Color bgColor = Colors.grey.shade200;

    if (status == AttendanceStatus.present) {
      bgColor = Colors.green.shade400;
    } else if (status == AttendanceStatus.absent) {
      bgColor = Colors.red.shade400;
    } else if (status == AttendanceStatus.holiday) {
      bgColor = Colors.orange.shade400;
    }

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        '$day',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _LegendItem(color: Colors.green, label: 'Present'),
          _LegendItem(color: Colors.red, label: 'Absent'),
          _LegendItem(color: Colors.orange, label: 'Holiday'),
        ],
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({
    required this.color,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
