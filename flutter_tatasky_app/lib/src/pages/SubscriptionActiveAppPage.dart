import 'package:fluttertataskyapp/Widget/appTheme.dart';

import 'package:fluttertataskyapp/Widget/myWidgets.dart';
import 'package:fluttertataskyapp/src/Model/SubscriptionAppModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SubscriptionActiveAppPage extends StatefulWidget {
  @override
  _SubscriptionActiveAppPageState createState() =>
      _SubscriptionActiveAppPageState();
}

class _SubscriptionActiveAppPageState extends State<SubscriptionActiveAppPage> {
  

  // PageController controller;
  PageController pageController ;
  SubscriptionPlanModel selectedSubscriptionPlanModel;

  List<SubscriptionPlanModel> subscriptionPlanModels;
     
  @override
  void initState() {
   
   
    super.initState();
    pageController =  PageController(initialPage: 0 , viewportFraction: 1.0);
    
    selectedSubscriptionPlanModel = SubscriptionPlanModel(isSelected: true, planName: "Standard 299", planDescription: "7 days trial", planPrice: "₹  299 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition");

  subscriptionPlanModels = List<SubscriptionPlanModel>();
    subscriptionPlanModels.add(SubscriptionPlanModel(planName: "Basic 199", planDescription: "7 days trial", planPrice: "₹ 199 / Month"));
    subscriptionPlanModels.add(SubscriptionPlanModel(planName: "Standard 299", planDescription: "7 days trial", planPrice: "₹  299 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition", type: 2));
    subscriptionPlanModels.add(SubscriptionPlanModel(planName: "Premium 399", planDescription: "7 days trial", planPrice: "₹ 399 / Month", planPriceDescrition: "Eligible for an Amazon FTV stick Tata Sky Edition", type: 3));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Image.asset(
            "assets/images/tatskybinge1.png",
            height: 50,
          ),
          SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: pageController, // PageController
            count: 2,
            // textDirection: TextDirection.rtl,
            effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 10,
                dotColor: HexColor("#283554"),
                activeDotColor: HexColor('#5174c9')),
          ),
          //it is middle screen that is expanded
          Expanded(
            child: Container(
              child: PageView(controller: pageController, children: <Widget>[
                //first page
                buildFirstPage(context),
                // second page
                buildSecondPage(context),

                //second page end..
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSecondPage(BuildContext context) {
    return Column(
     
      children: <Widget>[

        SizedBox(height: 10,),
        Text("Subscription Summary",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 32.0,
                    color: AppTheme.white,
                    fontWeight: FontWeight.w500))),
        SizedBox(
          height: 10,
        ),
        Text(selectedSubscriptionPlanModel.planName ,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400))),
        SizedBox(
          height: 10,
        ),
        gridImage(selectedSubscriptionPlanModel.type),
        SizedBox(
          height: 10,
        ),
        Text(selectedSubscriptionPlanModel.planPriceDescrition,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[350],
                    fontWeight: FontWeight.w400))),
        SizedBox(
          height: 10,
        ),
        Text("your free trial expires on 14/07/2020",
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    fontSize: 20.0,
                    color: HexColor("#fafafa"),
                    fontWeight: FontWeight.w400))),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.white,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left:2,right: 2) ,
            child: Text(
                "You would be required to make a payment of "+ selectedSubscriptionPlanModel.planPrice +" during or after your trail period to continue watching content form these apps.",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w400))),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: FractionalOffset.bottomCenter,
                  child: MyWidgets.buttonsWithOutShadow(
                      
                      context, "Start Watching Now", HexColor("#5991c9"),
                      height: 48, width: 300, ontap: (){
                         Navigator.pushReplacementNamed(context, "/homeBinge");
                      }),
                      
                    
                      ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFirstPage(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
          //top after tatasky logo start
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
          
              children: <Widget>[
                Text(
                  "Start Your Free Trial",
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          fontSize: 32.0,
                          color: AppTheme.white,
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Select a plan of your choice and start\n watching your favourite Movies and TV\n Show today",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: 18.0,
                            color: HexColor("#fafafa"),
                            fontWeight: FontWeight.w400))),
              ],
            ),
            //top after tatasky logo end

      //center start
        Expanded(
          child: ListView(
            children: subscriptionPlanModels.map((f)=>  buildExpandListTile(f)).toList()
          ),
        ),
        //center end
        SizedBox(height: 10,),
       //botoom page
        Column(
          children: <Widget>[
            MyWidgets.buttonsWithOutShadow(
                context, "Proceed", AppTheme.secondaryButtonColor,
                height: 48, width: 300, ontap: (){
                
                
                      pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear);
                
                
                }),
            InkWell(
              onTap: ()=>    pageController.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.linear) ,
              child: Text("Skip",
                  style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
            ),
            SizedBox(height: 25),
          ],
        ),
      ],
    );
  }

  Container buildExpandListTile(SubscriptionPlanModel subscriptionPlanModel) {
    return Container(
      
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        color: HexColor('#3c4254'),
        child: ExpansionTile(
          key: Key(subscriptionPlanModel.planName),
          initiallyExpanded:  subscriptionPlanModel.isSelected,
          onExpansionChanged: (isExpand){
            setState(() {

                subscriptionPlanModel.isSelected = isExpand;
                selectedSubscriptionPlanModel = subscriptionPlanModel;

            });
          
          },
          title: Text(subscriptionPlanModel.planName,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold))),
          subtitle: Text(subscriptionPlanModel.planDescription,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
       
          trailing: InkWell(
            onTap: (){

              setState(() {
                subscriptionPlanModel.isSelected = !subscriptionPlanModel.isSelected;
              });

            },
            child: checkbox(subscriptionPlanModel.isSelected)),
          children:   <Widget>[
            gridImage(subscriptionPlanModel.type),
            Text(subscriptionPlanModel.planPrice,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold))),
            Text(subscriptionPlanModel.planPriceDescrition,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 20)
          ],
        ));
  }

  Widget checkbox(bool isSelected) {

  
    return Container(
        height: 25,
        width: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            shape: BoxShape.rectangle,
            color: HexColor('#676f85')),
        child: isSelected
            ? Icon(
                Icons.check,
                size: 25.0,
                color: Colors.white,
              )
            : Container());
  }

  Widget gridImage(int type) {
    return Container(
      height: 210 ,
      padding: EdgeInsets.only(top: 10),
      child: GridView.count(
        mainAxisSpacing: 5.0,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 3.0,
        childAspectRatio: 1.9,
        padding: EdgeInsets.symmetric(horizontal: 10),
        crossAxisCount: 4,
        children: getList(type),
      ),
    );
  }

 List<Widget> getList(int type){

    switch (type) {

        case 2:
        return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Container(child: Image.network("https://exchange4media.gumlet.com/news-photo/100624.zee5main.jpg?format=webp&w=1100",)),
          Image.asset("assets/images/hungama.png"),
          Image.asset("assets/images/disnyhotstar.jpg"),
           Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
           Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
        ];
        break;
      case 3:
        return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Container(child: Image.network("https://exchange4media.gumlet.com/news-photo/100624.zee5main.jpg?format=webp&w=1100",)),
          Image.asset("assets/images/hungama.png"),
          Image.asset("assets/images/disnyhotstar.jpg"),
           Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Container(child: Image.network("https://exchange4media.gumlet.com/news-photo/100624.zee5main.jpg?format=webp&w=1100",)),
          Image.asset("assets/images/hungama.png"),
          Image.asset("assets/images/disnyhotstar.jpg"),
        ];
        break;
      default:

      return <Widget>[
          Image.asset("assets/images/disnyhotstar.jpg"),
          Image.asset("assets/images/geefive.jpg"),
          Image.asset("assets/images/sun.jpg"),
          Image.asset("assets/images/errosnow.jpg"),
          Container(child: Image.network("https://exchange4media.gumlet.com/news-photo/100624.zee5main.jpg?format=webp&w=1100",)),
          Image.asset("assets/images/hungama.png"),
          Image.asset("assets/images/disnyhotstar.jpg"),
        ];
    }
    
  }
}

