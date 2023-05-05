import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final IconData icons;
  final String title;
  final TextInputType textinputType;
  final int maxline;

  const CustomTextForm({
    super.key,
    required this.controller,
    required this.icons,
    required this.maxline,
    required this.textinputType,
    required this.title,
    required this.validator,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          maxLines: widget.maxline,
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.title == "Password" ? _obscureText : false,
          decoration: InputDecoration(
              suffixIcon: widget.title == "Password"
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              contentPadding: const EdgeInsets.all(.5),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 210, 205, 205))),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 210, 205, 205)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.red),
              ),
              fillColor: const Color.fromARGB(255, 210, 205, 205),
              // focusColor: grey,

              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              )),
        ),
      ],
    );
  }
}
