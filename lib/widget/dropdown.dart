import 'package:flutter/material.dart';

class DropdownMenupage extends StatefulWidget {
  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropdownMenu> {
  bool isDropdownOpen = false;

  void toggleDropdown() {
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: toggleDropdown,
          child: Text('Toggle Dropdown'),
        ),
        if (isDropdownOpen)
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text('Option 1'),
                  onTap: () {
                    // Handle Option 1 tap
                    setState(() {
                      isDropdownOpen = false;
                    });
                  },
                ),
                ListTile(
                  title: Text('Option 2'),
                  onTap: () {
                    // Handle Option 2 tap
                    setState(() {
                      isDropdownOpen = false;
                    });
                  },
                ),
                ListTile(
                  title: Text('Option 3'),
                  onTap: () {
                    // Handle Option 3 tap
                    setState(() {
                      isDropdownOpen = false;
                    });
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}