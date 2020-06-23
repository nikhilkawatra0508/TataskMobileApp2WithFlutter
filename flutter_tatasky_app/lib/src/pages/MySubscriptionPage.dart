import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sidekick/flutter_sidekick.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
class MySubscriptionPage extends StatelessWidget {
  ScrollController scrollControllerTop;
  ScrollController scrollControllerBottom;
  int lengthTop = 0;
  int lengthBottom =0;
   final bool istoptataskybing;


  MySubscriptionPage({this.istoptataskybing = false}){

   scrollControllerTop = ScrollController();
   scrollControllerBottom = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar:  istoptataskybing?null: AppBar(title: Text("My Subscription"),),
    
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SidekickTeamBuilder<SubscriptionAppModel>(
              initialSourceList: subscriptionApp,
              builder: (context, sourceBuilderDelegates, targetBuilderDelegates) {
                lengthTop = targetBuilderDelegates.length;
                lengthBottom = sourceBuilderDelegates.length;


                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MyWidgets.heading(context, "Subscribed", hideSeeAll: true),
                         SizedBox(height:10.0),
                      SizedBox(
                        height: 360.0,
                      child: SingleChildScrollView(
                          controller: scrollControllerTop,
                          child: Wrap(
                            children:  targetBuilderDelegates
                                .map((builderDelegate) => builderDelegate.build(
                                      context,
                                      wrapItem(context, builderDelegate.message, true, targetBuilderDelegates.length),
                                      animationBuilder: (animation) => CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.ease,
                                          ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),

                      SizedBox(height: 10),

                       MyWidgets.heading(context, "Unsubscribed"),
                      SizedBox(height:10.0),
                      Container(
                        height: (MediaQuery.of(context).size.height/2) -200,
                        child: SingleChildScrollView(
                          controller: scrollControllerBottom,
                          child: Wrap(
                            children: sourceBuilderDelegates  
                                .map((builderDelegate) => builderDelegate.build(
                                      context,
                                      wrapItem(context, builderDelegate.message, false, sourceBuilderDelegates.length),
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

 Widget wrapItem(context, SubscriptionAppModel item, bool isDes, int length ){
    return GestureDetector(
      onTap: () {
        
        if(!isDes && lengthTop >= 3)
        {
        scrollControllerTop.animateTo(scrollControllerTop.offset + 110 +10, duration: Duration(milliseconds: 500), curve: Curves.linear);
        }

         if(isDes && lengthBottom >= 3)
        {
        scrollControllerBottom.animateTo(scrollControllerBottom.offset + 110 +50, duration: Duration(milliseconds: 500), curve: Curves.linear);
        }
        SidekickTeamBuilder.of<SubscriptionAppModel>(context).move(item);


        
        },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: MyWidgets.subscriptionBox(context, item, isChecked: isDes),
      )
    );
 }
  
}
