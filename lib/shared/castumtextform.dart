import 'package:flutter/material.dart';

class Castumtextform extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool ispass;

  const Castumtextform({
    super.key,
    required this.hint,
    required this.controller,
    required this.ispass,
  });

  @override
  State<Castumtextform> createState() => _CastumtextformState();
}

class _CastumtextformState extends State<Castumtextform> {
  late bool showPass;

  @override
  void initState() {
    super.initState();
    showPass = widget.ispass;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPass,
      controller: widget.controller,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Invalid input';
        }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: widget.ispass == true
            ? IconButton(
                onPressed: () {
                  setState(() {
                    showPass = !showPass;
                  });
                },
                icon: Icon(
                  showPass
                      ? Icons.visibility_off_outlined
                      : Icons.remove_red_eye_outlined,
                ),
              )
            : null,
        fillColor: Colors.white,
        filled: true,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        hintText: widget.hint,
      ),
    );
  }
}
