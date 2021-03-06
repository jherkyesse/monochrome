import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignatureContainer extends StatelessWidget {
  SignatureContainer(this.signatureController);
  final SignatureController signatureController;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(
          color: theme.primaryColor,
          width: 4,
        ),
      ),
      child: Signature(
        controller: signatureController,
        width: size.width - 28,
        height: size.width - 28,
        backgroundColor: theme.canvasColor,
      ),
    );
  }
}
