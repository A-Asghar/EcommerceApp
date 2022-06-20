import 'package:ecommerceapp/Widgets/MultiPurposeButton.dart';
import 'package:ecommerceapp/Widgets/UserInput.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

import '../Services/ProductManagement/AddProduct.dart';
import '../Widgets/NavigateToHome.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _productName = TextEditingController();
  final _productCategory = TextEditingController();
  final _productDescription = TextEditingController();
  final _productPrice = TextEditingController();
  final _productStoreName = TextEditingController();

  File? file;
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  UploadTask? task;
  List<String> ImageList = [];
  String PhotoUrl = '';
  bool isLoaded = false;
  bool imagesUploading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Product',
            style: TextStyle(fontSize: 20, color: Colors.grey)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const NavigateToHome(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              userInput(
                  'Product Name', TextInputType.text, _productName, false, 30),
              userInput('Product Description', TextInputType.text,
                  _productDescription, false, 1500),
              userInput('Product Price', TextInputType.number, _productPrice,
                  false, 30),
              userInput('Product Store Name', TextInputType.text,
                  _productStoreName, false, 30),
              CategoryDropDown(),
              AddImages(
                text: 'Add Thumbnail Image',
                onPressed: () {
                  selectImage();
                },
              ),
              AddImages(
                text: 'Add Product Gallery Images',
                onPressed: () {
                  ImageList.clear();
                  selectImages();
                },
              ),
              imagesUploading
                  ? const CircularProgressIndicator(
                      color: Colors.blue,
                    )
                  : MultiPurposeButton(
                      onPressed: () {
                        AddProduct().addNewProduct(
                            _productName.text,
                            _productCategory.text,
                            double.parse(_productPrice.text),
                            _productDescription.text,
                            _productStoreName.text,
                            PhotoUrl,
                            ImageList);
                      },
                      buttonText: 'Add Product')
            ],
          ),
        ),
      ),
    ));
  }

  Widget CategoryDropDown() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.black)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
        child: DropdownButton<String>(
          hint: _productCategory.text == ""
              ? const Text('Product Category')
              : Text(_productCategory.text),
          items:
              <String>['Clothing', 'Technology', 'Sports'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _productCategory.text = value!;
            });
          },
        ),
      ),
    );
  }

  Future selectImage() async {
    final result = await imagePicker.pickImage(source: ImageSource.gallery);
    if (result == null) return;
    final path = File(result.path);
    setState(() {});
    final fileName = basename(path.path);
    try {
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/${DateTime.now()}_$fileName');

      task = ref.putFile(path);
      TaskSnapshot taskSnapshot = await task!.whenComplete(() {});
      taskSnapshot.ref.getDownloadURL().then(
        (value) {
          PhotoUrl = value;
          print("Done: $value");
        },
      );
    } catch (e) {
      print('error occured');
      print(e);
    }
  }

  void selectImages() async {
    imagesUploading = true;
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());
    setState(() {});
    await uploadFile(imageFileList!);
  }

  Future uploadFile(List _images) async {
    int count = 0;
    _images.forEach((_photo) async {
      if (_photo == null) {
        return;
      }
      File file = File(_photo.path);
      final fileName = basename(file.path);
      try {
        FirebaseStorage storage = FirebaseStorage.instance;
        Reference ref =
            storage.ref().child('images/${DateTime.now()}_$fileName');
        task = ref.putFile(file);
        TaskSnapshot taskSnapshot = await task!.whenComplete(() {});
        taskSnapshot.ref.getDownloadURL().then(
          (value) {
            ImageList.add(value);
            count++;
            if (count == imageFileList!.length) {
              setState(() {
                isLoaded = true;
                imagesUploading = false;
              });
            }
            print('ImageList length ' + ImageList.length.toString());
            print("Done: $value");
          },
        );
      } catch (e) {
        print('error occured');
        print(e);
      }
    });
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}

class AddImages extends StatelessWidget {
  const AddImages({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 15)),
      ),
    );
  }
}
