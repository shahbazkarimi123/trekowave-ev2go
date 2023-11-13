import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditions extends StatelessWidget {
  static const TERMS_AND_CONDITIONS = "termsAndConditions";
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    String tac="In e-commerce sites, the Terms of Service is typically the document that contains information related to conditions of sale and disclosures on methods of payment, shipping, delivery, withdrawals, and cancellation conditions etc. – as commonly required by consumer protection regulations. European providers of B2C services (selling goods / services) are also required to include, among other things, an Online Dispute Resolution (ODR) statement that explains the mandatory dispute resolution process online."+
    "In e-commerce sites, the Terms of Service is typically the document that contains information related to conditions of sale and disclosures on methods of payment, shipping, delivery, withdrawals, and cancellation conditions etc. – as commonly required by consumer protection regulations. European providers of B2C services (selling goods / services) are also required to include, among other things, an Online Dispute Resolution (ODR) statement that explains the mandatory dispute resolution process online."+
    "In e-commerce sites, the Terms of Service is typically the document that contains information related to conditions of sale and disclosures on methods of payment, shipping, delivery, withdrawals, and cancellation conditions etc. – as commonly required by consumer protection regulations. European providers of B2C services (selling goods / services) are also required to include, among other things, an Online Dispute Resolution (ODR) statement that explains the mandatory dispute resolution process online."+
    "In e-commerce sites, the Terms of Service is typically the document that contains information related to conditions of sale and disclosures on methods of payment, shipping, delivery, withdrawals, and cancellation conditions etc. – as commonly required by consumer protection regulations. European providers of B2C services (selling goods / services) are also required to include, among other things, an Online Dispute Resolution (ODR) statement that explains the mandatory dispute resolution process online."+
    "In e-commerce sites, the Terms of Service is typically the document that contains information related to conditions of sale and disclosures on methods of payment, shipping, delivery, withdrawals, and cancellation conditions etc. – as commonly required by consumer protection regulations. European providers of B2C services (selling goods / services) are also required to include, among other things, an Online Dispute Resolution (ODR) statement that explains the mandatory dispute resolution process online.";
    return Scaffold(
      body: Container(
        child: Stack(children: <Widget>[
          Container(
          
          height: MediaQuery.of(context).size.height*0.3,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFF674AEF),
              blurRadius: 25.0,
              offset: Offset(0.5,0.75)
            )
          ],
          color: Color(0xFF674AEF),
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(50) )
        ),child: Image.asset('assets/images/EV2GO-LOG0-10-11-22-1.png'),
        ),
          Container(
            
            width: MediaQuery.of(context).size.width,
            height: 0.7.sh,
            margin: EdgeInsets.only(top: 0.32.sh),
            child: Column(children: <Widget>[
              Text('Terms and Conditions',style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                
              ),),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.63.sh,
                margin: EdgeInsets.all(10.r),
                child: SingleChildScrollView(child: Text(tac)),
              )
            ]),
          )
        ]),
      ),
    );
  }
}