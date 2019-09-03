import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:padi_pos_kasir/common/database.dart';
import 'package:padi_pos_kasir/common/notification.dart';
import 'package:padi_pos_kasir/common/storage.dart';
import 'package:padi_pos_kasir/component/button.dart';
import 'package:padi_pos_kasir/model/merchant_preference.dart';
import 'package:padi_pos_kasir/model/user.dart';
import 'package:padi_pos_kasir/services/user_service.dart';
import 'package:padi_pos_kasir/style/style.dart';
import 'package:padi_pos_kasir/util/StringUtil.dart';
import 'package:padi_pos_kasir/util/logUtil.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  final _formLoginKey = GlobalKey<FormState>();
  final _userNameCtrl = TextEditingController(text: 'matraman@outlook.com');
  final _passwordCtrl = TextEditingController(text: 'Cahyowhy123');

  bool _isLoading = false;
  bool _isLoadingInit = true;
  bool _isChoseRoleView = false;
  User _user = User();
  MerchantPreferences _merchantPreferences = MerchantPreferences();

  @override
  void initState() {
    _initUserData();
    super.initState();
  }

  void _doLogin() {
    if (_formLoginKey.currentState.validate() && !_isLoading) {
      User user =
          User(username: _userNameCtrl.text, password: _passwordCtrl.text);

      setState(() {
        _isLoading = true;
      });

      UserService.instance.doLogin(user.toJson()).then((res) {
        setState(() => _isLoading = false);
        final responseBody = res.getResponseBody({});

        if (res.isSuccess()) {
          setState(() {
            _user = res.getDeserializeResponse(defaultValue: User());
            _isChoseRoleView = _user.id != 0;

            if (responseBody['menu'] != null) {
              _user.menu = json.encode(responseBody['menu']);
            }

            if (responseBody['merchantPreferences'] != null) {
              _merchantPreferences = MerchantPreferences.fromJson(
                  responseBody['merchantPreferences']);
            }
          });
        }
      });
    }
  }

  void _doSubmit() async {
    final submitValid =
        !_isLoading && _user.outletIdSelected != null && _user.loginAs != null;

    if (submitValid) {
      _isLoading = true;
      var responses = await Future.wait([
        Storage.writeValue('user', _user),
        Database.getUserBean(),
        Database.getMerchantPreferencesBean()
      ]);

      if (responses.length == 3) {
        var userBean = responses[1] as UserBean;
        var merchantPreferencesBean = responses[2] as MerchantPreferencesBean;

        await Future.wait([
          userBean.insert(_user),
          merchantPreferencesBean.insert(_merchantPreferences)
        ]);

        Navigator.of(context).pushNamed('Cashier');
      }
    } else {
      NotifToast.showToast(
          msg: "Periksa kembali field diatas, pastikan tidak ada yang kosong");
    }
  }

  Future<void> _initUserData() async {
    _user = await Authentication.getUser();

    Future.delayed(Duration.zero).then((_) {
      setState(() {
        _isLoadingInit = false;
      });

      if (_user.id > 0) {
        Navigator.of(context).pushNamed('Cashier');
      }
    });
  }

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

  Widget _logo = CommonStyle.paddingWrapper(
      SvgPicture.asset("assets/images/logo-color-long.svg", height: 56),
      bottom: 24);

  List<DropdownMenuItem> _renderDropdownItem({bool outlet = false}) {
    List<DropdownMenuItem> dropdowns = [];

    Widget getDropdown(String name, value) {
      return DropdownMenuItem(
          child: Text(
            name,
          ),
          value: value);
    }

    if (outlet) {
      _user.outlets.forEach((outlet) {
        dropdowns.add(getDropdown(outlet.name, outlet.id));
      });
    } else {
      try {
        final menus = json.decode(_user.menu);
        (menus as List<dynamic>)
            .forEach((item) => dropdowns.add(getDropdown(item, item)));
      } catch (e) {
        LogUtil.print(e.toString());
      }
    }

    return dropdowns;
  }

  Widget _loadingIndicator = Center(
      child:
          SizedBox(child: CircularProgressIndicator(), width: 64, height: 64));

  Widget _renderFormLogin() {
    return Form(
      key: _formLoginKey,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _logo,
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
                  onPressed: _doLogin,
                ),
                top: 24),
          ]),
    );
  }

  Widget _dropdownWrapper(List<DropdownMenuItem> childs, String hint,
      void Function(dynamic) onChange, defaultValue, String column) {
    return CommonStyle.paddingWrapper(
        Row(children: <Widget>[
          SizedBox(width: 80, child: Text(column)),
          Expanded(
              child: DropdownButtonHideUnderline(
                  child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: CommonStyle.primary),
                borderRadius: BorderRadius.all(Radius.circular(3))),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: DropdownButton(
                isExpanded: true,
                disabledHint: Text(hint + " Kosong"),
                hint: Text(hint),
                onChanged: onChange,
                value: defaultValue,
                items: childs),
          )))
        ]),
        bottom: 12);
  }

  Widget _renderViewChooseRole() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _logo,
        _dropdownWrapper(
            _renderDropdownItem(outlet: true),
            'Outlet',
            (param) => setState(() => _user.outletIdSelected = param),
            _user.outletIdSelected,
            'Pilih Outlet'),
        _dropdownWrapper(
            _renderDropdownItem(),
            'Shift',
            (param) => setState(() => _user.loginAs = param),
            _user.loginAs,
            'Pilih Shift'),
        Row(
          children: <Widget>[
            SizedBox(width: 80),
            Expanded(
                child: CommonButton(
              loading: _isLoading,
              child: Text("Submit"),
              onPressed: _doSubmit,
            ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            child: _isLoadingInit
                ? _loadingIndicator
                : _isChoseRoleView
                    ? _renderViewChooseRole()
                    : _renderFormLogin()));
  }
}
