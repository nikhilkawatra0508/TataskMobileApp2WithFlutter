import 'package:flutter/material.dart';
import 'package:flutter_sidekick/flutter_sidekick.dart';
import 'package:fluttertataskyapp/Widget/appTheme.dart';
import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/apppimagecollection.dart';

import '../Model/apppimagecollection.dart';

class AppListPage extends StatelessWidget {
  final String title;

  const AppListPage({Key key, this.title}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Text("Apps"),
      backgroundColor: AppTheme.background,
      ),
    
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SidekickTeamBuilder<AppImagecollection>(
              initialSourceList: appImagecollection,
              builder: (context, sourceBuilderDelegates, targetBuilderDelegates) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyWidgets.heading(context, "Subscribed"),
                         SizedBox(height:10.0),
                      SizedBox(
                        height: 360.0,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: targetBuilderDelegates
                                .map((builderDelegate) => builderDelegate.build(
                                      context,
                                      WrapItem(builderDelegate.message, true),
                                      animationBuilder: (animation) => CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.ease,
                                          ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),

                       MyWidgets.heading(context, "Unsubscribed"),
                      SizedBox(height:10.0),
                      SizedBox(
                        height: 250.0,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: sourceBuilderDelegates 
                                .map((builderDelegate) => builderDelegate.build(
                                      context,
                                      WrapItem(builderDelegate.message, false),
                                      animationBuilder: (animation) => CurvedAnimation(
                                            parent: animation,
                                            curve: FlippedCurve(Curves.ease),
                                          ),
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  
}

class WrapItem extends StatelessWidget {
  const WrapItem(
    this.item,
    this.isSource,
  ) : size = isSource ? 40.0 : 50.0;
  final bool isSource;
  final double size;
  final AppImagecollection item;

 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SidekickTeamBuilder.of<AppImagecollection>(context).move(item),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyWidgets.channelBox(item, isChecked: isSource),
      )
    );
  }

 
}
