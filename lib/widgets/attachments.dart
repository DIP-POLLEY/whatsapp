


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttachButton extends StatelessWidget {
  const AttachButton({
    Key? key,required this.name,required this.onpres,required this.clr,required this.icn
  }) : super(key: key);
  final String name;
  final VoidCallback onpres;
  final Color clr;
  final IconData icn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpres,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: clr,
            radius: 30,
            child: Icon(
              icn,
              size: 28,
              color: Colors.white,
            ),
          ),
          Text(name)
        ],
      ),
    );
  }
}
