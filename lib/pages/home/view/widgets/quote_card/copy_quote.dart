import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codwise/constants.dart';
import 'package:codwise/pages/home/view/widgets/quote_card/copy_text_toast.dart';
import 'package:codwise/pages/view_utils/screen_size_util.dart';

class CopyQuote extends StatefulWidget {
  const CopyQuote({
    Key? key,
    required this.quoteText,
  }) : super(key: key);
  final String quoteText;

  @override
  State<CopyQuote> createState() => _CopyQuoteState();
}

class _CopyQuoteState extends State<CopyQuote> {
  var showToast = false;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen =
        ScreenSizeUtil.getFromSize(MediaQuery.of(context).size) == ScreenSize.small;
    final double fontSize = isSmallScreen ? 14 : 18;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
      child: Column(
        children: [
          Visibility(
            visible: showToast,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: const CopyTextToast(),
          ),
          InkWell(
            onTap: () => onCopyQuoteClicked(widget.quoteText),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.copy,
                    color: AppColors.accentColor,
                    size: 24,
                  ),
                ),
                Text(
                  "Copy quote",
                  style: TextStyle(fontSize: fontSize),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onCopyQuoteClicked(String quoteText) async {
    Clipboard.setData(ClipboardData(text: quoteText));
    setState(() {
      showToast = true;
      Future.delayed(
        const Duration(seconds: 1),
        () {
          setState(() {
            showToast = false;
          });
        },
      );
    });
  }
}
