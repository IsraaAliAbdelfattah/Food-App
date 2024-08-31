import 'package:audio_to_text_app/views/thank_you_for_order.dart';
import 'package:audio_to_text_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Delivary extends StatefulWidget {
  const Delivary({super.key});

  @override
  State<Delivary> createState() => _DelivaryState();
}

class _DelivaryState extends State<Delivary> {
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
             const Row(
                children: [
                  Text('Delivery',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  Spacer()
                ],
              ),
              const Row(
              children: [
                Text('Adress detials',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w900,
                ),
                ),
                Spacer(),
                Text('change',
                style: TextStyle(
                  color: Color(0xffF47B0A),
                ),
                )
              ],
            ),
            Container(
               height: 120,
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
            child: const Column(
              children: [
                Text('Name'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Text('Address'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
                Text('phone number'),
                Padding(
                   padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(),
                ),
              ],
            ),
            ),
            const SizedBox(height: 10,),
            const Row(
                children: [
                  Text('Delivery Method',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                  ),
                  ),
                  Spacer()
                ],
              ),
              const SizedBox(height: 10,),
            Container(
               height: 160,
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
            child: Column(
              children: [
                ListTile(
                title:  
                const Text('Door Delivery'),
                  
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
                title:  
                const Text('Pick Up'),
                  
                
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
                
              ],
            ),
            ),
             
              const SizedBox(height: 10,),

           const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text('Total',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                    Spacer(),
                    Text('Rs. 199',
                     style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                  ],
                ),
              ),
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