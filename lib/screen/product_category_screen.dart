import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:padi_pos_kasir/component/drawer.dart';
import 'package:padi_pos_kasir/model/product_category.dart';
import 'package:padi_pos_kasir/common/database.dart';

class ProductCategoryScreen extends StatefulWidget {
  ProductCategoryScreen({Key key}) : super(key: key);

  @override
  _ProductCategoryScreenState createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameCtrl = TextEditingController();
  final _productKetCtrl = TextEditingController();

  ProductCategory productCategory;

  Widget _paddingWrapper(Widget child,
      {double top = 0, double right = 0, double bottom = 0, double left = 0}) {
    return Padding(padding: EdgeInsets.fromLTRB(left, top, right, bottom));
  }

  Widget _renderFormProductCategory() {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _paddingWrapper(
                    TextFormField(
                      maxLength: 20,
                      controller: _productNameCtrl,
                      decoration: InputDecoration(labelText: 'Nama'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }

                        return null;
                      },
                    ),
                    bottom: 8),
                _paddingWrapper(
                    TextFormField(
                        maxLength: 20,
                        keyboardType: TextInputType.multiline,
                        controller: _productKetCtrl,
                        decoration: InputDecoration(
                          labelText: 'Kategori',
                        )),
                    bottom: 8),
                RaisedButton(
                  child: Text('save'),
                  onPressed: _doSave,
                )
              ],
            )));
  }

  _doSave() async {
    if (_formKey.currentState.validate()) {
      productCategory.name = _productNameCtrl.text;
      var bean = await Database.getProductCategoryBean();

      // bean.insert(model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: AppBar(title: Text("Product Category")),
      body: DefaultTabController(
        length: 2,
        child: TabBarView(
            children: <Widget>[_renderFormProductCategory(), Text("cek")]),
      ),
    );
  }
}
