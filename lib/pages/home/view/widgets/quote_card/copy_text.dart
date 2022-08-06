import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wise_dev/constants.dart';
import 'package:wise_dev/pages/home/view/widgets/quote_card/copy_text_toast.dart';

class CopyText extends StatefulWidget {
  const CopyText({Key? key, required this.quoteText}) : super(key: key);
  final String quoteText;

  @override
  State<CopyText> createState() => _CopyTextState();
}

class _CopyTextState extends State<CopyText> {
  var showToast = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Column(
        children: [
          Visibility(
            visible: showToast,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: CopyTextToast(),
          ),
          InkWell(
            onTap: () => onCopyTextClicked(widget.quoteText),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.copy,
                    color: AppColors.accentColor,
                    size: 24,
                  ),
                ),
                Text(
                  "Copy text",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onCopyTextClicked(String quoteText) async {
    Clipboard.setData(ClipboardData(text: quoteText));
    setState(() {
      showToast = true;
      Future.delayed(
        Duration(seconds: 1),
        () {
          setState(() {
            showToast = false;
          });
        },
      );
    });
  }
}
