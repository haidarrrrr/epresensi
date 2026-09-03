import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttendanceState extends ChangeNotifier {
  bool isLoading = false;
  String? selectedCategory; // kbm | kegiatan
  String? message;

  void selectCategory(String c) => selectedCategory = c;
  void submit() { isLoading = true; notifyListeners(); }
}

class PresencePage extends StatelessWidget {
  const PresencePage({super.key});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<AttendanceState>();
    return Scaffold(
      appBar: AppBar(title: const Text('Presensi')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => state.selectCategory('kbm'),
            child: const Text('KBM Harian'),
          ),
          ElevatedButton(
            onPressed: () => state.selectCategory('kegiatan'),
            child: const Text('Kegiatan / PHBI'),
          ),
          if (state.selectedCategory != null)
            Text('Kategori: ${state.selectedCategory}'),
        ],
      ),
    );
  }
}
