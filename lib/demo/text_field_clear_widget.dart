import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//TextField尾部清除按钮 并且使用矢量图
void main(){
  runApp(MaterialApp(home: Scaffold(
    appBar: AppBar(),
    body: const TextFieldWedget(),
  )));
}

class TextFieldWedget extends StatefulWidget {
  const TextFieldWedget({super.key});
  @override
  State<TextFieldWedget> createState() => _TextFieldWedgetState();
}

class _TextFieldWedgetState extends State<TextFieldWedget> {
  final _usernameTextEditingController = TextEditingController();
  var _showUsernameSuffixIcon = false ;

  @override
  void initState() {
    super.initState();
    _usernameTextEditingController.addListener(_updateUsernameSuffixVisibility);
  }

  @override
  void dispose() {
    super.dispose();
    _usernameTextEditingController.dispose();
  }

  void _updateUsernameSuffixVisibility(){
    setState(() {
      _showUsernameSuffixIcon = _usernameTextEditingController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _usernameTextEditingController,
            decoration:InputDecoration(
              prefixIcon: const Icon(Icons.perm_identity),
              suffixIcon: _showUsernameSuffixIcon?IconButton(onPressed: (){
                _usernameTextEditingController.clear();
              }, icon: SvgPicture.asset('assets/svgs/icons_close.svg')):null,
              hintText: "hint string ",
              border: InputBorder.none,),
          ),
          const Divider(color: Colors.black12, height: 0,),
        ],
      ),
    );
  }
}