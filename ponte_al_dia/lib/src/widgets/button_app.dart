import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({
    super.key,
    required this.color,
    required this.colorTexto,
    required this.texto,
    this.icono,
    required this.onPressed,
  });
  final Color color;
  final Color colorTexto;
  final String texto;
  final Icon? icono;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 60),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Material(
            color: color,
            child: InkWell(
              onTap: () {
                onPressed();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      texto,
                      style: TextStyle(
                          color: colorTexto,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
