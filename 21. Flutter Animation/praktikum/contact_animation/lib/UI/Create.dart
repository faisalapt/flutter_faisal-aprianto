import '../Contact.dart';
import '../bloc/contact_bloc.dart';
import '../bloc/contact_state.dart';
import '../bloc/contact_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController teName = TextEditingController();
  TextEditingController teNumber = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    teName.dispose();
    teNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext CreateContactContext) {
    final ContactBloc _contactBloc =
        BlocProvider.of<ContactBloc>(CreateContactContext);
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Contact"),
        centerTitle: true,
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        bloc: _contactBloc,
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kolom harus terisi";
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: teName,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text("Name"),
                          hintText: "Name",
                          counterText: '',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Kolom harus terisi";
                        }
                        return null;
                      },
                      maxLines: 1,
                      controller: teNumber,
                      textCapitalization: TextCapitalization.words,
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          label: Text("Number"),
                          hintText: "Number",
                          counterText: '',
                          border: InputBorder.none,
                          fillColor: Color(0xfff3f3f4),
                          filled: true),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 400,
                      height: 50,
                      child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              var contact = Contact(
                                  name: teName.text, number: teNumber.text);
                              context
                                  .read<ContactBloc>()
                                  .add(AddContact(contact: contact));

                              Navigator.of(context).pop();
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Kesalahan pada validasi')),
                              );
                            }
                          },
                          child: Text("Create Contact")))
                ],
              ),
            ),
          );
        },
      ),
      // ),
    );
    // },
    //   ),
    // );
  }
}
