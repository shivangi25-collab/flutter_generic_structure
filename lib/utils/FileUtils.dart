import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../api/DioClient.dart';

class FileUtils {
  static Future<String> getTempFilePath({String? fileName}) async {
    Directory dir = await getTemporaryDirectory();
    dir.create(recursive: true);
    return "${dir.path}/${fileName!}";
  }

  static Future<CroppedFile?> pickAndCropImage(
      ImageSource imageSource, BuildContext context,
      [int? maxWidth, int? maxHeight]) async {
    ImagePicker picker = ImagePicker();
    List<CroppedFile> cropFile = [];
    XFile? pickedFile =
        (await picker.pickImage(source: imageSource, imageQuality: 50));
    if (pickedFile != null) {
      File selectedFile = File(pickedFile.path);
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: selectedFile.path,
        // maxWidth: maxWidth ?? 800,
        // maxHeight: maxHeight,
        compressQuality: 50,
        uiSettings: <PlatformUiSettings>[
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Get.theme.primaryColor,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false)
        ],
      );
      cropFile.add(croppedFile ?? CroppedFile(""));

      return croppedFile;
    }
    return null;
  }

  static Future<File?> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File? file;
    if (result != null) {
      file = File(result.files.single.path!);
    }
    return file;
  }

  static Future<File> urlToFile(String imageUrl, String extension) async {
    var rng = Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File('$tempPath${rng.nextInt(100)}.$extension');
    final response = await DioClient.client
        .get(imageUrl, options: Options(responseType: ResponseType.bytes));
    await file.writeAsBytes(response.data);
    return file;
  }

  static bool isImage(String path) {
    String extension = path.split(".").last;
    return extension.toLowerCase() == "jpg" ||
        extension.toLowerCase() == "png" ||
        extension.toLowerCase() == "jpeg";
  }
}
