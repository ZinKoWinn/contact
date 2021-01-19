import 'package:contact/model/contact.dart';
import 'package:contact/utils/date-format.dart';
import 'package:contact/widgets/custom-textfield.dart';
import 'package:contact/widgets/custom-validation.dart';
import 'package:flutter/material.dart';

import 'custom-form-button.dart';

class MyForm extends StatefulWidget {
  final AddContact addContact;

  const MyForm({Key key, this.addContact}) : super(key: key);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> with MyValidation {
  DateTime dateofbirth;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text("Add Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              MyTextField(
                label: "Name",
                hint: "Enter Your Name",
                prefix: null,
                icon: Icons.person,
                controller: nameController,
                validator: validateName,
                textInputType: TextInputType.text,
              ),
              MyTextField(
                label: "Email",
                hint: "Enter Your Email",
                prefix: null,
                icon: Icons.email,
                controller: emailController,
                validator: validateEmail,
                textInputType: TextInputType.emailAddress,
              ),
              MyTextField(
                label: "Phone",
                hint: "Enter Your Phone",
                prefix: "+95",
                icon: Icons.phone,
                controller: phoneController,
                validator: validatePhone,
                textInputType: TextInputType.phone,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(top: 16, left: 8, bottom: 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: GestureDetector(
                  onTap: _getDate,
                  child: Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text(dateofbirth != null
                            ? dateFormat(dateofbirth)
                            : "Select Date Of Birth"),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormButton(
                        width: MediaQuery.of(context).size.width / 2.4,
                        label: "Cancel",
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    FormButton(
                      width: MediaQuery.of(context).size.width / 2.4,
                      label: "Save",
                      onPressed: submit,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getDate() async {
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    setState(() {
      dateofbirth = pickedDate;
    });
  }

  void submit() {
    var name = nameController.text;
    var email = emailController.text;
    var phone = phoneController.text;

    final newContact = Contact(
      name: name,
      email: email,
      phone: phone,
      dateofbirth: dateofbirth,
    );

    if (formKey.currentState.validate()) {
      widget.addContact(newContact);
      Navigator.of(context).pop();
    }
  }
}
