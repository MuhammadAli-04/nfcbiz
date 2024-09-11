import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class QuillWidget extends StatefulWidget {
  const QuillWidget({
    super.key,
    this.width,
    this.height,
    required this.htmlData,
    this.isEnable = false,
  });

  final double? width;
  final double? height;
  final String htmlData;
  final bool isEnable;

  @override
  State<QuillWidget> createState() => _QuillWidgetState();
}

class _QuillWidgetState extends State<QuillWidget> {
  late QuillEditorController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuillEditorController();
    // _controller.enableEditor(widget.isEnable);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.getText(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              (widget.isEnable)
                  ? ToolBar(
                      alignment: WrapAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      activeIconColor: Colors.green,
                      padding: const EdgeInsets.all(20),
                      iconSize: 20,
                      toolBarConfig: const [
                        ToolBarStyle.bold,
                        ToolBarStyle.italic,
                        ToolBarStyle.underline,
                        ToolBarStyle.align,
                      ],
                      controller: _controller,
                    )
                  : Container(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(0xffE7E9EB),
                  ),
                ),
                child: QuillHtmlEditor(
                  textStyle: const TextStyle(fontSize: 15),
                  isEnabled: widget.isEnable,
                  backgroundColor: Colors.white,
                  hintText: 'Add Your Notes',
                  text: widget.htmlData,
                  controller: _controller,
                  minHeight: 100,
                  onTextChanged: (String text) async{
                    // FFAppState().update(() async {
                    //   FFAppState().manualPaymentGuide =
                    //       await _controller.getText();
                    // });
                    FFAppState().manualPaymentGuide =
                        await _controller.getText();
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('${snapshot.error}'),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
