import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Profilee extends StatefulWidget {
  const Profilee({super.key});

  @override
  State<Profilee> createState() => _ProfileeState();
}

class _ProfileeState extends State<Profilee> {

 XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 255, 17, 17),
        elevation: 7.20  ,
          toolbarHeight: 75,
        ),
         body: Stack(
          children: <Widget>[
            Container(
              color: Colors.white,
            ),
           Container(
              child: ListView(

                children: <Widget> [
                   Container(
              margin: EdgeInsets.fromLTRB(10, 320, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Text('Full Name',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  TextField(),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                    Text('Email',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  TextField(),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                    Text('Sub Divisi',
                  style: TextStyle(color: Colors.black26, fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                  TextField(),
                  SizedBox(
                    height: 20,
                    width: 20,
                    ),
                  ],
              )
              ),
             Container(
              //margin: EdgeInsets.only(top: 590),
                color: Color.fromARGB(255, 255, 17, 17),
                width: 500,
                height: 50,
                    
              child:
              Container(
               
                child: 
                TextButton(
                      onPressed: () {}, 
                      child: 
                       Text(
                      'UPDATE', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22, color: Colors.white),
                       ),
                      ),
              ),
              ),
                   ]
              ),
           ),
             
            Container(
              
              height: 290,
              color: Color.fromARGB(255, 255, 17, 17),
              
            ),
            Container(
              margin: EdgeInsets.fromLTRB(130, 30, 0, 0),
              height: 130,
              width: 130,
              
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 17, 17),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
               
              ),
            ),
            Container(
              // height: 130,
              // width: 130,
              //color: Colors.black26,
              margin: EdgeInsets.fromLTRB(110, 30, 0, 0),
              child: 
               image != null
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(150),
                      child: Image.file(
                        //to show image, you type like this.
                        File(image!.path),
                        fit: BoxFit.cover,
                        width: 130,
                        height: 130,
                      ),
                    ),
                  )
                : Text(
                    "       Add Image",
                    style: TextStyle(fontSize: 20),
                  ),
            ),
            Container(
               margin: EdgeInsets.fromLTRB(158, 175, 0, 0),
              // color: Colors.black,
              child: Text(
                '287701', style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w600),
              ),
            ),

            //image
            Container( 
              margin: EdgeInsets.only( top: 205,left: 125, right: 120),
            // color: Colors.green,
          child: 
        Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
          
            ElevatedButton(
              
              onPressed: () {
                myAlert();
              },
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.photo,),
              Text('Upload Photo'),
          ]
            ),
            ),
            SizedBox(
              height: 10,
              
            ),
            //if image not null show the image
            //if image null show text
          ]
        ),
        
         ),

            // Container(
            //    margin: EdgeInsets.fromLTRB(105, 210, 0, 0),
            //    decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(5),
            //     color: Color.fromARGB(255, 20, 175, 167),
            //     boxShadow: [BoxShadow(
            //       spreadRadius: 3,
            //       blurRadius: 7,
            //       color: Colors.black12,
                  
            //       )]
            //    ),
               
            //    width: 185,
            //    height: 40,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
        
            //   Icon(Icons.photo, color: Colors.white,),
            //   TextButton(
            //     child: Text('EDIT/ADD PHOTO', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500)
            //     ),
            //     onPressed: () {},
            //     )
            //   ],)
            // ),
           
               
               
            
          ],
        ),
    );
  }
}