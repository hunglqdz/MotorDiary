import 'package:camera/camera.dart';

class CameraService {
  CameraController? cameraController;

  Future<void> initialize() async {
    if (cameraController != null) return;
    CameraDescription description = await getCameraDescription();
    await setupCameraController(description: description);
  }

  Future<CameraDescription> getCameraDescription() async {
    List<CameraDescription> cameras = await availableCameras();
    return cameras.firstWhere((CameraDescription camera) =>
        camera.lensDirection == CameraLensDirection.front);
  }

  Future setupCameraController({required CameraDescription description}) async {
    cameraController = CameraController(description, ResolutionPreset.high,
        enableAudio: false);
    await cameraController?.initialize();
  }

  dispose() async {
    await cameraController?.dispose();
    cameraController = null;
  }
}
