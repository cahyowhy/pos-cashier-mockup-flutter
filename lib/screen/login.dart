import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:padi_pos_kasir/component/button.dart';
import 'package:padi_pos_kasir/model/user.dart';
import 'package:padi_pos_kasir/services/user_service.dart';
import 'package:padi_pos_kasir/style/style.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameCtrl = TextEditingController(text: 'harusmandika@aol.com');
  final _passwordCtrl = TextEditingController(text: '1234');
  bool _isLoading = false;

  InputDecoration _renderInput(
      {String label,
      String hint,
      Radius topleft = Radius.zero,
      Radius topright = Radius.zero,
      Radius bottomleft = Radius.zero,
      Radius bottomright = Radius.zero}) {
    return InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
                topLeft: topleft,
                topRight: topright,
                bottomRight: bottomright,
                bottomLeft: bottomleft),
            borderSide: BorderSide(color: Color(0xFF000000))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CommonStyle.paddingWrapper(
                      SvgPicture.asset("assets/images/logo-color-long.svg",
                          height: 56),
                      bottom: 24),
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _userNameCtrl,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        } else if (!emailValid(value)) {
                          return 'Format email masih salah';
                        }

                        return null;
                      },
                      decoration: _renderInput(
                          hint: 'Username',
                          topleft: Radius.circular(25),
                          topright: Radius.circular(25))),
                  TextFormField(
                      obscureText: true,
                      controller: _passwordCtrl,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Field tidak boleh kosong';
                        }

                        return null;
                      },
                      decoration: _renderInput(
                          hint: 'Password',
                          bottomleft: Radius.circular(25),
                          bottomright: Radius.circular(25))),
                  CommonStyle.paddingWrapper(
                      CommonButton(
                        loading: _isLoading,
                        child: Text("Login"),
                        onPressed: () {
                          if (_formKey.currentState.validate() && !_isLoading) {
                            User user = User(
                                username: _userNameCtrl.text,
                                password: _passwordCtrl.text);

                            setState(() {
                              _isLoading = true;
                            });

                            UserService.instance.doLogin(user.toJson()).then(
                                (res) => setState(() => _isLoading = false));
                          }
                        },
                      ),
                      top: 24),
                ]),
          )),
    );
  }
}
