import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ustoz_ai_task/src/core/theme/app_colors.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.body, this.scaffoldKey});
  final Widget body;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.appColors.linear2,
                context.appColors.linear1,
                // context.appColors.linear2,
              ],
            ),
          ),
        ),
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.appColors.linear2,
                    context.appColors.linear1,
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Material(color: Colors.transparent, child: body),
          ),
        ],
      ),
    );
  }
}
