import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

// DialogBox untuk membuat task baru
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Mengambil Input dari user
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),

            // buttons -> simpan + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // simpan tombol
                MyButton(text: "Simpan", onPressed: onSave),

                const SizedBox(width: 8),

                // cancel tombol
                MyButton(text: "Kembali", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
