import 'dart:ui';

import 'package:detect/screens/disease.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class homepage extends StatefulWidget{
  const homepage({Key ? key,required this.isNightMode,required this.onThemeChanged}) : super(key: key);
  final bool isNightMode;
  final ValueChanged<bool> onThemeChanged;

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  
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
                    TextButton(onPressed: (){}, child: const Text("About",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> diseasepage(isNightMode: widget.isNightMode, onThemeChanged: widget.onThemeChanged)));
                    }, child: const Text("Disease Detection",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    TextButton(onPressed: (){}, child: const Text("Crop Monitoring",style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
        
                    ),)),
                    TextButton(onPressed: (){
                      
                    }, child: const Text("3D Models",style: TextStyle(
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
            SingleChildScrollView(
              child: Container(
                
  padding: EdgeInsets.only(left:300.0,right: 300.0),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        'About Us',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 32.0),
      Text(
        'FarmVision is an innovative and powerful application designed to enhance plant care and sustainable farming practices through cutting-edge AI algorithms and ML models.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 16.0),
      Text(
        'FarmVision leverages a robust stack of modern technologies to deliver a seamless experience for its users and maintain high accuracy in disease prediction.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 32.0),
      Text(
        'Our Mission',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 16.0),
      Text(
        'At FarmVision, we\'re on a journey to empower both plants and farmers. By harnessing the power of AI and combining it with the wisdom of the FarmVisiona, we aim to provide personalized solutions for healthier plants and joyful farming experiences.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 32.0),
      Text(
        'Inspiration',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 16.0),
      Text(
        'FarmVisiona: The Eyes of Lord Shiva\n\nThe FarmVisiona beads are believed to be a manifestation of the tears of joy or bliss that Lord Shiva once shed.\n\nInspired by the healing properties of the FarmVisiona bead, our project leverages advanced APIs to create an experience of profound joy of healthy farming.\n\nBy combining the power of technology and nature, FarmVision aims to ensure the flourishing health of your plants just by clicking and uploading a photo of the leaf of a sick plant.\n\nOur innovative approach bridges the gap between traditional wisdom and modern innovation, offering a harmonious blend that nurtures both the earth and the spirit.',
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 32.0),
      Text(
        'Why FarmVision?',
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
        SizedBox(height: 16.0),
      Text.rich(TextSpan(
      text: 'Accurate Disease Detection: ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'FarmVision employs a powerful AI model trained on a vast dataset of 87,000 images, ensuring reliable and accurate disease detection in plant leaves.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],
    ),),
      SizedBox(height: 16.0),
    Text.rich(TextSpan(
      text: 'Tailored Remedies: ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'Beyond detection, FarmVision goes a step further by providing personalized remedies for identified diseases, addressing plant health issues effectively.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],
    ),),
      SizedBox(height: 16.0),
    Text.rich(TextSpan(   text: 'Holistic Approach: ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'By blending technology and the spiritual essence of the FarmVisiona bead, FarmVision provides a holistic approach to plant care, honoring both tradition and innovation.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],)),SizedBox(height: 16.0),
      Text.rich(TextSpan(
      text: 'User-Friendly Experience:  ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'With an intuitive user interface, uploading an image and receiving insights from FarmVision is a seamless and straightforward process, making plant care hassle-free.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],
    ),),
      SizedBox(height: 16.0),
      Text.rich(TextSpan(
      text: 'Time and Cost Savings:  ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'FarmVision eliminates the need for manual research and guesswork in diagnosing plant diseases, saving you time, effort, and potentially costly mistakes.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],
    ),),
      SizedBox(height: 16.0),
      Text.rich(TextSpan(
      text: 'Support for Greener Futures:  ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'By choosing FarmVision, you\'re contributing to a greener, healthier planet where technology and tradition unite to create sustainable growth.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],
    ),),
      SizedBox(height: 16.0),
      Text.rich(TextSpan(
      text: 'Feedback-Driven Improvement:  ',
      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
      children: [
        TextSpan(
          text: 'FarmVision values user feedback, using it to improve its capabilities, features, and user experience, ensuring that it continues to meet your needs.',
          style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16),
        ),
      ],
    ),),
      SizedBox(height: 16.0),
      
      ],
          ),
        ),
      ),
      
    ),SizedBox(height: 150,),
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
