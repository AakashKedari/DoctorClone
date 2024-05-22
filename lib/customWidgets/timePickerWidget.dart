import 'package:flutter/material.dart';

class TimeSlotSelector extends StatefulWidget {
  @override
  _TimeSlotSelectorState createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  List<String> timeSlots = [
    '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM',
    '3:00 PM', '4:00 PM', '5:00 PM', '6:00 PM', '7:00 PM'
  ];
  String selectedTimeSlot = '';

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 10,
        crossAxisCount: 3, // Creates a 3x3 grid
        childAspectRatio: 3, // Adjusts the aspect ratio of the grid items
      ),
      itemCount: timeSlots.length,
      itemBuilder: (BuildContext context, int index) {
        return TimeSlotChip(
          timeSlot: timeSlots[index],
          isSelected: selectedTimeSlot == timeSlots[index],
          onSelect: () {
            setState(() {
              selectedTimeSlot = timeSlots[index];
            });
          },
        );
      },
    );
  }
}

class TimeSlotChip extends StatelessWidget {
  final String timeSlot;
  final bool isSelected;
  final VoidCallback onSelect;

  TimeSlotChip({
    required this.timeSlot,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(

        child: Chip(
          label: Text(timeSlot),
          backgroundColor: isSelected ? Colors.blue : Colors.grey[200],
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
