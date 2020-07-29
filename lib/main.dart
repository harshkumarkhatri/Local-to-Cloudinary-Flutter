// Method-1 {It is most lengthy method and requires external apis to be called}

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:loading/loading.dart';
// import 'package:loading/indicator/ball_pulse_indicator.dart';
// // import 'package:http/http.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var imageUrl;
//   static const url =
//       'https://api.cloudinary.com/v1_1/harshkumarkhatri/image/upload';
//   bool isLoading = false;
//   Future uploadImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       isLoading = true;
//     });
//     Dio dio = Dio();
//     FormData formData = FormData.fromMap({
//       "file": await MultipartFile.fromFile(image.path,
//       // contentType: new MediaType("image", "jpeg"),
//        ),
//        "folder":"demo_images",
//       "upload_preset": "uploading",
//       "cloud_name": "harshkumarkhatri"

//     });
//     try {print(0);
//       Response response = await dio.post(url, data: formData,options: Options(
//             followRedirects: false,
//             validateStatus: (status) {
//               return status < 500;
//             },
//             // headers: headers,
//           ),);
//       print(1);
//       var data = jsonDecode(response.toString());
//       print(2);
//       print(data);
//       print(3);
//       setState(() {
//         isLoading = false;
//         imageUrl = data['secure_url'];

//       });print(4);
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: CircleAvatar(
//           radius: 100,
//           backgroundColor: Colors.blueAccent,
//           backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
//           child: imageUrl == null
//               ? !isLoading
//                   ? Icon(Icons.person, size: 100, color: Colors.white)
//                   : Loading(
//                       indicator: BallPulseIndicator(),
//                       size: 100,
//                       color: Colors.red)
//               : Container(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           uploadImage();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// Metho-2 {A better version of the first method}

// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:image_picker/image_picker.dart';
// import 'package:dio/dio.dart';
// import 'package:loading/loading.dart';
// import 'package:loading/indicator/ball_pulse_indicator.dart';
// import 'package:cloudinary_public/cloudinary_public.dart';
// // import 'package:http/http.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   var imageUrl;
//   // static const url =
//   //     'https://api.cloudinary.com/v1_1/harshkumarkhatri/image/upload';
//   bool isLoading = false;

//   Future uploadImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       isLoading = true;
//     });
//     CloudinaryResponse response=await cloudinary.uploadFile(
//       CloudinaryFile.fromFile(
//         image,resourceType: CloudinaryResourceType.Image
//       )
//     );print(response);
//     setState(() {
//       isLoading=false;
//       imageUrl=response.secureUrl;
//     });
//       // setState(() {
//       //   isLoading = false;
//       //   imageUrl = data['secure_url'];

//       // });print(4);
//     // } catch (e) {
//     //   print(e);
//     // }
//   }

//   final cloudinary=CloudinaryPublic('harshkumarkhatri', 'uploading',cache: false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: CircleAvatar(
//           radius: 100,
//           backgroundColor: Colors.blueAccent,
//           backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
//           child: imageUrl == null
//               ? !isLoading
//                   ? Icon(Icons.person, size: 100, color: Colors.white)
//                   : Loading(
//                       indicator: BallPulseIndicator(),
//                       size: 100,
//                       color: Colors.red)
//               : Container(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           uploadImage();
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// Method 3 {When the api keys are made available}

import 'package:cloudinary_client/models/CloudinaryResponse.dart' as cr;
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:cloudinary_client/cloudinary_client.dart';
import 'credentials.dart' as cred;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CloudinaryClient client = CloudinaryClient(
      cred.api_key, cred.api_secret, cred.cloud_name);
  var imageUrl;
  bool isLoading = false;

  Future uploadImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      isLoading = true;
    });
    cr.CloudinaryResponse response =
        await client.uploadImage(image.path, folder: 'new_floder 123');

    print(response.secure_url);
    setState(() {
      isLoading = false;
      imageUrl = response.secure_url;
    });
  }

  final cloudinary =
      CloudinaryPublic(cred.cloud_name, 'uploading', cache: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blueAccent,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
          child: imageUrl == null
              ? !isLoading
                  ? Icon(Icons.person, size: 100, color: Colors.white)
                  : Loading(
                      indicator: BallPulseIndicator(),
                      size: 100,
                      color: Colors.red)
              : Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uploadImage();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
