import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ARViewer extends StatefulWidget {
  const ARViewer({Key? key}) : super(key: key);

  @override
  State<ARViewer> createState() => _ARViewerState();
}

class _ARViewerState extends State<ARViewer> {
  final List<Map<String, String>> _models = [
    {"name": "Wooden Table", "asset": "assets/astronaut.glb"},
    {"name": "Furniture ID-1", "asset": "assets/robot.glb"}
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentModel = _models[_selectedIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Furniture Shop - ${currentModel['name']}"),
        backgroundColor: Colors.purple.shade300,
      ),
      body: Column(
        children: [
          Expanded(
            child: ModelViewer(
              src: currentModel['asset']!,
              alt: "3D model of ${currentModel['name']}",
              ar: true,
              arModes: const ["sceneViewer", "webXR", "quickLook"],
              arScale: "auto",
              arPlacement: "floor",
              autoRotate: true,
              cameraControls: true,
              backgroundColor: const Color(0xFFFFFFFF),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_models.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedIndex == index ? Colors.purple.shade300 : null,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    _models[index]["name"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: _selectedIndex == index ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
} 