
import 'package:flutter/material.dart';

class DialogCheckBox extends StatefulWidget {
  const DialogCheckBox({Key? key,
    this.value,
    required this.onChanged,}) : super(key: key);

  final bool? value;
  final ValueChanged<bool?>? onChanged;

  @override
  State<DialogCheckBox> createState() => _DialogCheckBoxState();
}

class _DialogCheckBoxState extends State<DialogCheckBox> {

  bool? value;  //因为widget.value 是 final，无法改变，所以这里要定义一个可改变的value

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: (v){
      setState(() {
        value = v;
      });
    });
  }
}
