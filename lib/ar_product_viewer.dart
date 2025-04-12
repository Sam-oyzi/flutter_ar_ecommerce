import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'dart:core';

class ARViewer extends StatefulWidget {
  const ARViewer({Key? key}) : super(key: key);

  @override
  State<ARViewer> createState() => _ARViewerState();
}

class _ARViewerState extends State<ARViewer> {
  final List<Map<String, String>> _models = [
    {
      "name": "Wooden Table", 
      "asset": "assets/table_wood.glb"
    },
    {
      "name": "Furniture ID-1", 
      "asset": "assets/Meuble_ID_1.glb"
    }
  ];
  int _selectedIndex = 0;
  bool _isModelLoaded = false;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    print("Initializing ARViewer with models: $_models");
    // Set a timer to simulate model loading
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isModelLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentModel = _models[_selectedIndex];
    print("Building ARViewer with model: ${currentModel['asset']}");
    
    return Scaffold(
      appBar: AppBar(
        title: Text("AR Furniture Shop - ${currentModel['name']}"),
        backgroundColor: Colors.purple.shade300,
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ModelViewer(
                  key: ValueKey(currentModel['asset']),
                  src: currentModel['asset']!,
                  alt: "3D model of ${currentModel['name']}",
                  ar: true,
                  arModes: const ["scene-viewer", "webxr", "quick-look"],
                  arScale: ArScale.auto,
                  arPlacement: ArPlacement.floor,
                  autoRotate: true,
                  cameraControls: true,
                  backgroundColor: const Color(0xFFFFFFFF),
                ),
                if (!_isModelLoaded) 
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(height: 20),
                        Text(_errorMessage.isEmpty ? "Loading 3D model..." : "Error: $_errorMessage"),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_models.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    print("Switching to model: ${_models[index]['name']} at path: ${_models[index]['asset']}");
                    setState(() {
                      _selectedIndex = index;
                      _isModelLoaded = false;
                      _errorMessage = '';
                      
                      // Reset the model loading timer when switching models
                      Future.delayed(const Duration(seconds: 2), () {
                        if (mounted) {
                          print("Model loading complete for: ${_models[index]['name']}");
                          setState(() {
                            _isModelLoaded = true;
                          });
                        }
                      });
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