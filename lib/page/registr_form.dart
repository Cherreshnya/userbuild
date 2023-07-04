import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/form.dart';



class RegistrFormPage extends StatefulWidget {
  @override
  State<RegistrFormPage> createState() => _RegistrFormPageState();
}

class _RegistrFormPageState extends State<RegistrFormPage> {
  bool _hidePass = true;
  final _formKey = GlobalKey<FormState>();
  
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _storyController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();


  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _storyController.dispose();
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registr Form"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Full Name *",
                hintText: "What do people call you?",
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              validator: _validateName,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Phone number *",
                hintText: "Where can we reach you?",
                helperText: "Phoneformat : (XXX)XXX-XX-XX",
                prefixIcon: Icon(Icons.call),
                suffixIcon: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(color: Colors.black, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // only accept letters from a to z
                FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'), allow: true)
              ],
              validator: (value) => value== null || _validatePhoneNumber(value) ? null : "Phone number must be enter as (###) ###-#### ",
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email address ",
                hintText: "Enter a email address",

                icon: Icon(Icons.mail),
              ),
              validator: _validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _storyController,
              decoration: InputDecoration(
                labelText: "Life Story ",
                hintText: "Tell us about yourself",
                helperText: "Keep it short, this is just a demo",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter password",
                suffixIcon: IconButton(
                  icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
              ),
              obscureText: _hidePass,
              maxLength: 8,
              controller: _passController,
              validator: _validatePassword,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Confirm password",
                hintText: "Confirm password",
              ),
              obscureText: _hidePass,
              maxLength: 8,
              controller: _confirmController,
              validator: _validatePassword,
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                "Submit Form",
                style: TextStyle(color: Colors.white),
              ),
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _submitForm() {
    if(_formKey.currentState!.validate()) {
      print("Form is valid");
      print("Name : ${_nameController.text}");
      print("Phone : ${_phoneController.text}");
      print("Email : ${_emailController.text}");
      print("Story : ${_storyController.text}");
    }
  }

  String? _validateName(String? value) {
    final _nameExp = RegExp(r'^[A-Za-z]+$');
    if(value == null || value.isEmpty) {
      return "Name is reqired";
    } else if (!_nameExp.hasMatch(value)) {
      return "Please enter alphabetical correct";
     } else {
      return null;
    }
  }
}

bool _validatePhoneNumber(String input) {
  final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
      return _phoneExp.hasMatch(input);
}

String? _validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email can't be empty";
  } else if (!value.contains("@")) {
    return "Invalid email address";
  }
    return null;
}

String? _validatePassword(String? value) {
  if(value == null || value.length != 8 ) {
    return "8 character required for password";
  } else if (!_confirmController.text != _passController.text) {
    return "password does not match";
  } else {
    return null;
  }
}