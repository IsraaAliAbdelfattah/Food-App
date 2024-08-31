import 'package:audio_to_text_app/cubits/add_history_cubit/cubit/add_history_cubit.dart';
import 'package:audio_to_text_app/cubits/show_history_cubit/cubit/show_history_cubit.dart';
import 'package:audio_to_text_app/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThankYouForOrder extends StatelessWidget {
  const ThankYouForOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddHistoryCubit(),
      child:
          BlocConsumer<AddHistoryCubit, AddHistoryState>(
            listener: (context, state) {
        if (state is AddHistoryFaliurState) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errormessage.toString())));
        }
        if (state is AddHistorySuccesState) {
          BlocProvider.of<ShowHistoryCubit>(context).fetchAllHistory();
        }
      }, builder: (context, state) {
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
              title: const Center(
                child: Text(
                  'ChekOut',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/chek_out_icon.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Thank you for ',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    'placing the order',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const Text(
                    'your order will be dilevered under ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9A9A9D),
                    ),
                  ),
                  const Text(
                    '30 mins of placing your order',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9A9A9D),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(const Color(0xffFA4A0C)),
                              minimumSize:
                                  WidgetStateProperty.all(const Size(130, 50))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomBottomNavigationBar()));
                          },
                          child: const Text(
                            'Explore',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(const Color(0xff9A9A9D)),
                              minimumSize:
                                  WidgetStateProperty.all(const Size(130, 50))),
                          onPressed: () {},
                          child: const Text(
                            'Cancel order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
