import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextInputBox extends StatefulWidget {
  final String title;
  final IconData icon;
  final TextEditingController controller;
  final bool? isPassword;

  const AppTextInputBox(
      {super.key,
      required this.title,
      required this.controller,
      required this.icon,
      this.isPassword});

  @override
  State<AppTextInputBox> createState() => _AppTextInputBoxState();
}

class _AppTextInputBoxState extends State<AppTextInputBox> {
  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Icon(widget.icon),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: TextField(
                controller: widget.controller,
                obscureText: (widget.isPassword != null && !hidePassword),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.title,
                ),
              )),
              if (widget.isPassword != null)
                IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(hidePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined ))
            ],
          ),
        ),
      ],
    );
  }
}
