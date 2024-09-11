import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';

class PrefixCodePicker extends StatefulWidget {
  const PrefixCodePicker({
    super.key,
    this.width,
    this.height,
    required this.code,
  });

  final double? width;
  final double? height;
  final String code;

  @override
  State<PrefixCodePicker> createState() => _PrefixCodePickerState();
}

class _PrefixCodePickerState extends State<PrefixCodePicker> {
  String code = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String prefix = widget.code.substring(0, 1);

    if (prefix != '+') {
      setState(() {
        code = '+${widget.code}';
      });
    } else {
      setState(() {
        code = widget.code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      onChanged: (code) {
        FFAppState().prefixCode = code.dialCode ?? '+91';
      },
      initialSelection: code,
      showCountryOnly: false,
      searchDecoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 5, left: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 0.5),
        ),
        prefixIcon: const Icon(Icons.search, size: 22),
        hintText: 'Search...',
      ),
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
    );

    // return IntlPhoneField(
    //     maxLength: 10,
    //     hintText: '',
    //     initialCountryCode: widget.code,
    //     validator: (data) {
    //       return null;
    //     },
    //     onChanged: (data) {
    //       FFAppState().prefixCode = data.countryCode ?? 'IN';
    //       print("number is $data");
    //     });
  }
}
