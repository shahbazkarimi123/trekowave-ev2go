import 'dart:io';

import 'package:ev2go/data/models/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// ignore: must_be_immutable
class IdProofs extends StatefulWidget {
  // ignore: constant_identifier_names
  static const String IDPROOFS = "idProofs";
  SignupData? singUpData;
  IdProofs({super.key,this.singUpData});

  @override
  State<IdProofs> createState() => _IdProofsState();
}

class _IdProofsState extends State<IdProofs> {
 late Map<String,File> imageFiles={};
 
 List<String> item = [
      'Selfie *:',
      'Organisation ID Proof*:',
      'Driving Licence (Front):',
      'Driving Licence (Back):',
      'Voter ID/ Passport (Front)',
      'Voter ID/ Passport (Back)',
      'Aadhar Card (Front)*:',
      'Aadhar Card (Back)*:'
    ];
 

  
  bool valueCheck2 = false;
  final picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    int i = 2;
    
    Map<int,String> imageChacker = {};
    

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration:const BoxDecoration(
                boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xFF674AEF),
                      blurRadius: 25.0,
                      offset: Offset(0.5, 0.75)
                    )
                  ],

                color: Color(0xFF674AEF),
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              padding: const EdgeInsets.only(left: 15, right: 15),
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Column(
                children: [
                  const SizedBox(height: 8,),
                  Align(
                      alignment: Alignment.bottomRight,
                      
                      child: Text(
                        'Step $i/3',
                        style: TextStyle(
                          color: Colors.yellow.shade800,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const Text('ID Proofs',style: TextStyle(height: 0.1,color: Color(0xFF674AEF),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2,),),
                  GridView.builder(
                    itemCount: item.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 3.8),
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()async {
                          Map<Permission,PermissionStatus> status= await[
                            Permission.storage,Permission.camera

                          ].request();
                          setState(() {
                            i=index;
                            //print(i.toString()+"........................."+index.toString());
                          });
                          if(status[Permission.storage]!.isGranted && status[Permission.camera]!.isGranted){
                            imageChacker[index]=item[index];
                              // ignore: use_build_context_synchronously
                              showImagePicker(context,index);
                          }else{
                            //print("no permission provider");
                          }
                          //print(widget.singUpData!.phone.toString()+" "+index.toString());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow:const <BoxShadow>[
                              BoxShadow(
                                color: Color(0xFF674AEF),
                                blurRadius: 8.0,
                                offset: Offset(0.0,0.75),
                                
                              )
                            ],
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.grey[300]),
                          child:Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  item[index],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                
                                (imageFiles.containsKey(item[index])) ? Image.file(imageFiles[item[index]]!,height: 70,):
                                
                                
                                const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 70,
                                  color: Color(0xFF674AEF),
                                )
                              ]),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 15),
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.8),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Checkbox(
                          value: valueCheck2,
                          onChanged: (valueCheck2) {
                            setState(() {
                              this.valueCheck2 = valueCheck2!;
                            });
                          }),
                      const Text(
                        'Accept the Terms and Conditions',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Material(
                        elevation: 10,
                        color: const Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15),
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Material(
                        elevation: 10,
                        color: const Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            if(widget.singUpData!.image0==null){
                        Fluttertoast.showToast(msg: 'Select ID 1',toastLength:Toast.LENGTH_SHORT);
                      }else if(widget.singUpData!.image1==null){
                        Fluttertoast.showToast(msg:"Select ID 2",toastLength: Toast.LENGTH_SHORT);
                      }else{
                            Navigator.pushNamed(context, 'rentalRegistrationForm',arguments: widget.singUpData);
                      }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 60, vertical: 15),
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      

                        Navigator.popAndPushNamed(context, 'login');
                      

                    },
                    child: const Text(
                      'Already Have An Account? Sign In',
                      style: TextStyle(color: Color(0xFF674AEF)),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      )),
    );
  }
  showImagePicker(BuildContext context,int index){
    
    showModalBottomSheet(
      
      context: context,
      builder: (builder){
        return Card(
          child: Container(
            height: MediaQuery.of(context).size.height*0.15,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(8.0),
            padding:const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: <Widget>[
                        Icon(Icons.image,size: 50.0,),
                        SizedBox(height: 10,),
                        Text("Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16,color:Colors.black),
                        )
                      ],
                    ),
                    onTap: (){
                      _imageFromGallery(index);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: const Column(
                      children: <Widget>[
                        Icon(Icons.camera,size: 50.0,),
                        SizedBox(height: 10,),
                        Text("Camera",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16,color:Colors.black),
                        )
                      ],
                    ),
                    onTap: (){
                      _imageFromCamera(index);
                      Navigator.pop(context);
                    },),
                )

              ],
            ),
          ),
        );
      });

  }
  _imageFromGallery(int index)async{
    await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50
    ).then((value)=>{
      if(value != null){
        _cropImage(File(value.path),index)
      }
    });
  }
  _imageFromCamera(int index)async{
    await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50
    ).then((value) => {
      if(value != null){
        
        _cropImage(File(value.path),index)
        
      }
    },);
  }
  _cropImage(File imageFile,int index)async{
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid ?[
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9

      ]:[
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [AndroidUiSettings(
        toolbarTitle: "Image cropper",
        toolbarColor: Colors.deepOrange,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false
      )]
    );
    // ignore: unnecessary_null_comparison
    if(croppedFile != null){
      imageCache.clear();
      
      setState(() {
        imageFiles[item[index]]=File(croppedFile.path);
        if(index==0){
          widget.singUpData!.image0=File(croppedFile.path);
        }else if(index==1){
          widget.singUpData!.image1=File(croppedFile.path);
        }else if(index==2){
          widget.singUpData!.image2=File(croppedFile.path);
        }else if(index==3){
          widget.singUpData!.image3=File(croppedFile.path);
        }else if(index==4){
          widget.singUpData!.image4=File(croppedFile.path);
        }else if(index==5){
          widget.singUpData!.image5=File(croppedFile.path);
        }else if(index==6){
          widget.singUpData!.image6=File(croppedFile.path);
        }else if(index==7){
          widget.singUpData!.image7=File(croppedFile.path);
        }
        
        
        //print("                     Path"+File(croppedFile.path).toString());
        
      });
    }
  }

  
}
