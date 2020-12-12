import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchView extends StatelessWidget {
  final Function showSearchCallback;
  final TextEditingController _textEditingController = TextEditingController();

  SearchView({this.showSearchCallback});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 52.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: TextFormField(
          controller: _textEditingController,
          maxLines: 1,
          onTap: () => showSearchCallback(),
          autofocus: false,
          readOnly: false,
          inputFormatters: [LengthLimitingTextInputFormatter(30)],
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              suffixIconConstraints: BoxConstraints(minWidth: 23, maxHeight: 20),
              hintText: 'Search anything',
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: () {}, padding: EdgeInsets.all(0)),
              hintStyle: TextStyle(fontSize: 16.0)),
        ),
      ),
    );
  }
}
