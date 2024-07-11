import 'package:detect/services/apiserv.dart';
import 'package:detect/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:html' as html;
class diseasepage extends StatefulWidget{
  const diseasepage({super.key,required this.isNightMode,required this.onThemeChanged});
  final bool isNightMode;
  final ValueChanged<bool> onThemeChanged;
  @override
  State<diseasepage> createState() => _diseasepageState();
}

class _diseasepageState extends State<diseasepage> {
  String? _uploadedImageUrl;
  final ImagePicker _picker = ImagePicker();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
  String? _result;
   String? _errorMessage;
  html.File? _imageFile;

  Future<void> _pickImage() async {
    try {
      html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) {
        final files = uploadInput.files;
        if (files!.isEmpty) return;

        setState(() {
          _imageFile = files[0];
          _uploadedImageUrl = html.Url.createObjectUrl(_imageFile!);
        });
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  Future<String> convertImageToBase64(html.File imageFile) async {
  final reader = html.FileReader();
  reader.readAsDataUrl(imageFile);
  await reader.onLoadEnd.first;
  final dataUrl = reader.result as String;
  return dataUrl.split(',').last; // Extract the Base64 part of the Data URL
}
Future<void> _fetchResult() async {
  if (_imageFile == null) return;

  setState(() {
    _isLoading = true;
    _result = null;
    _errorMessage = null;
  });

  try {
    if (_imageFile != null) {
      final base64Image = await convertImageToBase64(_imageFile!);
      await _apiService.fetchPlantDiseaseDetection(context, base64Image);
    }
  } catch (e) {
    setState(() {
      _errorMessage = e.toString();
    });
  } finally {
    setState(() {
      _isLoading = false;
    });
  }
}

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              
              height: MediaQuery.of(context).size.height/6,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 219, 227, 231)
                
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   CircleAvatar(
                      backgroundImage:NetworkImage('https://qph.cf2.quoracdn.net/main-qimg-9b09e8b817a1b71a9b21933644c28eca-lq'),
                      radius: 50,
                    ),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> homepage(isNightMode: widget.isNightMode, onThemeChanged: widget.onThemeChanged)));
                    }, child: const Text("About",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    TextButton(onPressed: (){}, child: const Text("Disease Detection",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    TextButton(onPressed: (){}, child: const Text("Crop Monitoring",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    TextButton(onPressed: (){}, child: const Text("3D Models",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    PopupMenuButton(
                      icon: Icon(widget.isNightMode ? Icons.nights_stay : Icons.wb_sunny_outlined),
                      onSelected: (String value) {
              if (value == "Night") {
                widget.onThemeChanged(true);
              } else {
                widget.onThemeChanged(false);
              }
            },
                      itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(child: Text("Light"), value: "Light"),
                  const PopupMenuItem(child: Text("Night"), value: "Night"),
                  
                ];
                
              }
              )
                ],
              ),
            ),
            SizedBox(height: 20,),



      //mlphoto





      SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child:Text.rich(TextSpan(
                  text: 'FarmVision ',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                  ),
                  children: [
                    TextSpan(
                      text: '- Plant Disease Detection',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    ))
                  ]
                ))
              ),
              Text.rich(TextSpan(
                  text: 'Helping ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Farmers ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                    )),
                    TextSpan(
                      text: 'with Machine Learning',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    ))
                  ]
                )),
                
                Container(
                  width: 500,
                  height: 30,
                  child: Divider(
                    height: 120,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              SizedBox(height: 20),
              GestureDetector(
                onTap:  _pickImage,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  child:  _uploadedImageUrl != null
                            ? Image.network(
                                _uploadedImageUrl!,
                                height: 200,
                                fit: BoxFit.cover,
                              )
                            : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSOqXZmHt1pMBLzMOgfDiQ3Fjx9sPsPo8tzw&s',
                      height: 200,
                      ),
                      SizedBox(height: 20,),
                      Text('Upload Plant Image Here',style: TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7))
                ),
                onPressed:_fetchResult,
                child: Text(_uploadedImageUrl != null ? 'Proceed' : 'Add Image to Proceed',style: TextStyle(
                  color: Colors.white
                ),),
              ),
              SizedBox(height: 20),
                   
                    _result != null
                        ? Text(
                            "Result: $_result",
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          )
                        : _errorMessage != null
                            ? Text(
                                "Error: $_errorMessage",
                                style: TextStyle(color: Colors.red, fontSize: 16),
                              )
                            : Container(),
            ],
          ),
        ),
      ),
   SizedBox(height: 150,),
    Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: BottomAppBar(
          color: Colors.grey[200],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Row(
                          children: [
                            Image.network(
                          'https://qph.cf2.quoracdn.net/main-qimg-9b09e8b817a1b71a9b21933644c28eca-lq',
                          height: 70,
                        ),
                            Text(
                              'FarmVision',
                              style: TextStyle(fontWeight: FontWeight.w800,fontSize: 28),
                            ),
                          ],
                        ),SizedBox(height: 16.0),
                        Text(
                          'Blending Tech with Nature\'s \nEssence, Unveiling Plant Health',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Container(
                    height: 100,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          'Explore',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                        ),SizedBox(height: 8.0),
                        Text('Introduction',style: TextStyle(fontSize: 16),),SizedBox(height: 5.0),
                        Text('Home',style: TextStyle(fontSize: 16),),SizedBox(height: 5.0),
                        Text('About',style: TextStyle(fontSize: 16),),SizedBox(height: 5.0),
                      ],
                    ),
                    Container(
                    height: 100,
                    child: VerticalDivider(
                      width: 1,
                      thickness: 0.5,
                      color: Colors.black,
                    ),
                  ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contribute to FarmVision',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
                        ), SizedBox(height: 16.0),
                        Text('GitHub'),
                      ],
                    ),
                  ],
                ),
               
              ],
            ),
          ),
        ),
      ),
    
  ],
  
        ),

      ),
    );
  }
}