import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RegistrFormPage extends StatefulWidget {
  @override
  State<RegistrFormPage> createState() => _RegistrFormPageState();
}

class _RegistrFormPageState extends State<RegistrFormPage> {
  bool _hidePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registr Form"),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextField(
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
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
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
                FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: "Email address ",
                hintText: "Enter a email address",
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
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
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {},
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
}
