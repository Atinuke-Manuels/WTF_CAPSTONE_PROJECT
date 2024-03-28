import 'package:flutter/material.dart';
import '../pages/sign_up_page.dart';

class DropDownContainerWidget extends StatefulWidget {
  final Role initialValue; // Initial value for the dropdown
  final ValueChanged<Role> onChanged; // Callback function when value changes

  const DropDownContainerWidget({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  _DropDownContainerWidgetState createState() => _DropDownContainerWidgetState();
}

class _DropDownContainerWidgetState extends State<DropDownContainerWidget> {
  late Role _selectedRole; // Track the selected role

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.initialValue; // Initialize selected role
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<Role>(
        value: _selectedRole,
        onChanged: (Role? value) {
          setState(() {
            _selectedRole = value!;
          });
          widget.onChanged(value!); // Notify parent widget about the change
        },
        items: [
          DropdownMenuItem(
            value: null,
            child: Text("Select Role"), // Placeholder text
          ),
          ...Role.values.map((Role role) {
            return DropdownMenuItem<Role>(
              value: role,
              child: Text(role == Role.client ? 'Client' : 'Agent'),
            );
          }).toList(),
        ],
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintStyle: TextStyle(color: Colors.black45),
        ),
      ),
    );
  }
}

