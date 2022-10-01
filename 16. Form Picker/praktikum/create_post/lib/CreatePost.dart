import 'package:create_post/Post.dart';
import 'package:create_post/data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({super.key});

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  var path;
  DateTime _time = DateTime.now();
  TextEditingController teDate = TextEditingController();
  TextEditingController teColor = TextEditingController();
  Color _color = Color(0xFFFFFFFF);
  TextEditingController teCaption = TextEditingController();

  @override
  void initState() {
    teDate.text = DateFormat('dd-MM-yyyy').format(_time);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cover",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        child: Text("Pilih File"),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.grey)),
                        onPressed: () async {
                          var result = await ImagePicker.platform
                              .pickImage(source: ImageSource.gallery);
                          if (result != null) {
                            setState(() {
                              path = result.path;
                            });
                            print(path);
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Publish At",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: teDate,
                    readOnly: true,
                    decoration: InputDecoration(hintText: "dd/mm/yyyy"),
                    onTap: () async {
                      final selectDate = await showDatePicker(
                          context: context,
                          initialDate: _time,
                          firstDate: DateTime(1990),
                          lastDate: DateTime(_time.year + 10));
                      setState(() {
                        if (selectDate != null) {
                          teDate.text =
                              DateFormat('dd-MM-yyyy').format(selectDate);
                          _time = selectDate;
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Color Theme",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: teColor,
                    readOnly: true,
                    decoration: InputDecoration(
                        hintText: "Color Theme",
                        fillColor: _color,
                        filled: true),
                    onTap: () async {
                      final _pick = showPlatformDialog(
                          context: context,
                          builder: (context) => BasicDialogAlert(
                                title: Text("Color Picker"),
                                content: BlockPicker(
                                  pickerColor: _color,
                                  onColorChanged: (color) {
                                    setState(() {
                                      _color = color;
                                    });
                                  },
                                ),
                                actions: [
                                  BasicDialogAction(
                                    title: Text("Cancel"),
                                    onPressed: () {
                                      var _feedback = {
                                        "pick": false,
                                        "color": 0xFFFFFFFF
                                      };
                                      Navigator.pop(context, _feedback);
                                    },
                                  ),
                                  BasicDialogAction(
                                    title: Text("Pick"),
                                    onPressed: () {
                                      var _feedback = {
                                        "pick": true,
                                        "color": this._color
                                      };
                                      Navigator.pop(context, _feedback);
                                    },
                                  ),
                                ],
                              ));
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Caption",
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: teCaption,
                    decoration: InputDecoration(hintText: "Caption"),
                    maxLines: 5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  var post;
                  setState(() {
                    post = new Post(
                        caption: teCaption.text.toString(),
                        color: _color,
                        date: _time,
                        file: path.toString());
                  });
                  Navigator.pop(context, post);
                },
                child: Text("Publish Post"))
          ],
        ),
      ),
    );
  }
}
