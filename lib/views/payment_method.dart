
import 'package:audio_to_text_app/views/thank_you_for_order.dart';
import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String _selectedOption='Option 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Center(child: Text('ChekOut',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        ),),    
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            const Row(
              children: [
                Text('PayMent',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                ),
                ),
                Spacer()
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text('PayMent Method',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
                ),
                Spacer()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 240,
               decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    ListTile(
                title:  Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xffF47B0A),
                           borderRadius:BorderRadius.circular(12)
                        ),
                        child: const Icon(Icons.credit_card,color: Colors.white,),
                      ),
                    ),
                    const Text('Card'),
                  ],
                ),
                leading: Radio<String>(
                  value: 'Option 1',
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                            ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(),
                ),
                   ListTile(
                title:  Row(
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(
                        height: 40,
                        width: 40,
                        decoration:  BoxDecoration(
                          color: const Color(0xffEB4796),
                          borderRadius:BorderRadius.circular(12)
                        ),
                        child: const Icon(Icons.account_balance,color: Colors.white,),
                                           ),
                     ),
                    const Text('Bank'),
                  ],
                ),
                leading: Radio<String>(
                  value: 'Option 2',
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                            ),
                            const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(),
                ),
                            ListTile(
                title:  Row(
                  children: [
                     Padding(
                       padding: const EdgeInsets.only(right: 10),
                       child: Container(
                        height: 40,
                        width: 40,
                        decoration:  BoxDecoration(
                          color: const Color(0xff756CE4),
                          borderRadius:BorderRadius.circular(12)
                        ),
                        child: const Icon(Icons.money,color: Colors.white,),
                                           ),
                     ),
                    const Text('Cach on Dilvery'),
                  ],
                ),
                leading: Radio<String>(
                  value: 'Option 3',
                  groupValue: _selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
                            ),
                            const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Divider(),
                ),
                  ],
                ),
              ),
            ),
            const Spacer(),
             
            const SizedBox(
              height: 5,
            ),
            CustomButton(
              color: const Color(0xffFA4A0C),
              text: 'Procced to payment',
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ThankYouForOrder()));
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}