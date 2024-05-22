import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 30, // Number of days to display
        itemBuilder: (BuildContext context, int index) {
          DateTime date = DateTime.now().add(Duration(days: index));
          bool isSelected = selectedDate == date;

          return Card(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = date;
                });
              },
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  border: isSelected
                      ? Border.all(color: Colors.blue, width: 3)
                      : null,
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      DateFormat('E').format(date), // Day
                      style: TextStyle(
                        fontSize: 18,

                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat('d').format(date), // Date
                      style: TextStyle(
                        fontSize: 22,

                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat('MMM').format(date), // Month
                      style: TextStyle(
                        fontSize: 18,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}