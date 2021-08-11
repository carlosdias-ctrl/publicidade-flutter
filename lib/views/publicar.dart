import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:publicidade/constants/categoriaButtom.dart';
import 'package:publicidade/constants/colors.dart';
import 'package:publicidade/controller/usuario_provider.dart';
import 'package:publicidade/models/usuario.dart';

class Publicar extends StatefulWidget {
  @override
  _PublicarState createState() => _PublicarState();
}

class _PublicarState extends State<Publicar> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _telefoneInputController = TextEditingController();
  TextEditingController _instagramInputController = TextEditingController();
  TextEditingController _whatsappInputController = TextEditingController();
  TextEditingController _facebookInputController = TextEditingController();
  //TextEditingController _imagemInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _fotoInputController = TextEditingController();
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  final _form = GlobalKey<FormState>();
  bool _isLoading = false;
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.grey[350],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 70),
              decoration: BoxDecoration(
                color: Colors.grey[350],
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Publicar',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Commissioner',
                      ),
                    ),
                    Form(
                      key: _form,
                      child: Column(
                        children: [
                          TextFormField(
                            onSaved: (value) =>
                                _formData['Empresa Profissao'] = value,
                            controller: _nameInputController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Empresa ou Profissão",
                              labelStyle: TextStyle(
                                color: Colors.deepPurple[900],
                              ),
                              prefixIcon: Icon(
                                Icons.home_work_rounded,
                                color: Colors.deepPurple[900],
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            onSaved: (value) => _formData['Contato'] = value,
                            controller: _telefoneInputController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Telefone",
                              labelStyle: TextStyle(
                                color: Colors.deepPurple[900],
                              ),
                              prefixIcon: Icon(
                                Icons.call,
                                color: Colors.deepPurple[900],
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            onSaved: (value) => _formData['Instagram'] = value,
                            controller: _instagramInputController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Link do Instagram",
                              labelStyle: TextStyle(
                                color: Colors.deepPurple[900],
                              ),
                              prefixIcon: Icon(
                                Icons.link,
                                color: Colors.deepPurple[900],
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            onSaved: (value) => _formData['mail'] = value,
                            controller: _emailInputController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "E-mail",
                              labelStyle: TextStyle(
                                color: Colors.deepPurple[900],
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.deepPurple[900],
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            onSaved: (value) => _formData['Facebook'] = value,
                            controller: _facebookInputController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Link do Facebook",
                              labelStyle: TextStyle(
                                color: Colors.deepPurple[900],
                              ),
                              prefixIcon: Icon(
                                Icons.link,
                                color: Colors.deepPurple[900],
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                          TextFormField(
                            onSaved: (value) => _formData['Whatsapp'] = value,
                            controller: _whatsappInputController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              labelText: "Whatsapp com DDD",
                              labelStyle: TextStyle(
                                color: Colors.deepPurple[900],
                              ),
                              prefixIcon: Icon(
                                Icons.link,
                                color: Colors.deepPurple[900],
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.deepPurple[900],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 135.0),
                            child: Container(
                              child: ClienteDropdownButton(),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          // TextFormField(
                          //   onSaved: (value) => _formData['Foto'] = value,
                          //   controller: _fotoInputController,
                          //   style: TextStyle(color: Colors.black),
                          //   decoration: InputDecoration(
                          //     labelText: "UrlFoto",
                          //     labelStyle: TextStyle(
                          //       color: Colors.deepPurple[900],
                          //     ),
                          //     prefixIcon: Icon(
                          //       Icons.image,
                          //       color: Colors.deepPurple[900],
                          //     ),
                          //     focusedBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.deepPurple[900],
                          //       ),
                          //     ),
                          //     enabledBorder: UnderlineInputBorder(
                          //       borderSide: BorderSide(
                          //         color: Colors.deepPurple[900],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Row(
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  getImage();
                                },
                                // child: Container(
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.add_a_photo_rounded,
                                      size: 35,
                                    ),
                                    Text(
                                      'Selecionar Imagem',
                                      style: TextStyle(fontSize: 10),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      child: _image != null
                                          ? Image.file(_image)
                                          : Center(),
                                    )
                                  ],
                                ),
                                // ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: RaisedButton(
                        onPressed: () {
                          _form.currentState.save();
                          Provider.of<UsuarioProvider>(context, listen: false)
                              .put(
                            UsuarioDb(
                              id: _formData['id'],
                              name: _formData['Empresa Profissao'],
                              telefone: _formData['Contato'],
                              instagram: _formData['Instagram'],
                              mail: _formData['mail'],
                              facebook: _formData['Facebook'],
                              whats: _formData['Whatsapp'],
                              urlFoto: _formData['Foto'],
                            ),
                          );
                          print(UsuarioDb().name);
                          Navigator.of(context).pop();
                        },
                        child: Text('Publicar'),
                        color: CustomColors().getActiveSecondaryButtomColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
