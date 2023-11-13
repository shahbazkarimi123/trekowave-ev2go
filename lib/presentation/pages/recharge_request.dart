import 'package:ev2go/data/register_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RechargeRequest extends StatefulWidget {
  static const RECHARGEREQUEST = "rechargeRequest";
  RechargeData? rechargeData = RechargeData();
  RechargeRequest({super.key, this.rechargeData});

  @override
  State<RechargeRequest> createState() => _RechargeRequestState();
}

class _RechargeRequestState extends State<RechargeRequest> {
  var _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    Fluttertoast.showToast(
        msg: 'Payment Successful', toastLength: Toast.LENGTH_SHORT);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Fluttertoast.showToast(
        msg: 'Something went wrong!', toastLength: Toast.LENGTH_SHORT);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    Fluttertoast.showToast(
        msg: 'Payment Successful', toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            Container(
              height: 0.35.sh,
              decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFF674AEF),
                        blurRadius: 25.0,
                        offset: Offset(0.5, 0.75))
                  ],
                  color: Color(0xFF674AEF),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(50))),
                      child: Center(child: Image.asset('assets/images/EV2GO-LOG0-10-11-22-1.png')),
            ),
            Container(
              height: 0.7.sh,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 0.4.sh),
              child: Column(children: <Widget>[
                SizedBox(height: 25.h,),
                Text("Plan ${widget.rechargeData!.plan} days",
                  style: TextStyle(color:const Color.fromARGB(255, 151, 164, 185),fontSize: 20.h,fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 25.h,),
                Text("Amount ${widget.rechargeData!.amount}"
                  ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color:const
                     Color.fromARGB(255, 151, 164, 185)
                  ),
                ),
                SizedBox(height: 25.h,),
                
                MaterialButton(
                  elevation: 12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    height: 75,
                    minWidth: 150,
                    color: const Color(0xFF674AEF),
                    child: Text("Make Payment",style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600
                    ),),
                    onPressed: () {
                      // print(widget.rechargeData!.amount);

                      var options = {
                        'key': 'rzp_test_LsPfbjKzfqawGz',
                        'amount': int.parse(widget.rechargeData!.amount!) * 100,
                        'name': '             Ev2Go',
                        'description': 'Fine T-Shirt',
                        'prefill': {
                          'contact': '9871069105',
                          'email': 'shahbazkarimi123@gmail.com'
                        }
                      };
                      try {
                        _razorpay.open(options);
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: "Something went wrong!",
                            toastLength: Toast.LENGTH_SHORT);
                      }
                    })
              ]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear(); // Removes all listeners
    super.dispose();
  }
}
