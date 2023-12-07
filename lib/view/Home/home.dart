import 'package:carousel_slider/carousel_slider.dart';
import 'package:electricity/dummy/charts.dart';
import 'package:electricity/models/usageDataModel.dart';
import 'package:electricity/services/UsageDataServices.dart';
import 'package:electricity/services/general%20services/helpers.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String userName;
  HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UsageData> usageDataList = []; // Placeholder for fetched or local data

  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  void initState() {
    super.initState();
    loadData(); // Function to load data from API or local JSON
  }

  Future<void> loadData() async {
    // Fetch data using service method or use local JSON data
    UsageDataService usageDataService = UsageDataService();
    usageDataList = await usageDataService.fetchUsageData(useApi: false);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      // appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Hi ${widget.userName}!",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              CarouselSlider(
                items: usageDataList.map((usageData) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: _buildElectricityData(usageData)),
                            Expanded(child: _buildWaterData(usageData)),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: false,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                    aspectRatio: 1.7,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: usageDataList.asMap().entries.map((entry) {
                  return GestureDetector(
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorConstants.teal
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Chart(
                  electricityData: ElectricityData,
                  waterData: WaterData,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildElectricityData(UsageData usageData) {
  return Column(
    children: [
      Text('Date: ${usageData.dateOfBillIssued}'),
      Text('Electricity Consumer: ${usageData.electricityConsumerNumber}'),
      Text('Electricity Amount Paid: ${usageData.electricityAmountPaid}'),
      Text('Electricity Kilowatt Used: ${usageData.electricityKilowattUsed}'),
      // Add other electricity details
    ],
  );
}

Widget _buildWaterData(UsageData usageData) {
  return Column(
    children: [
      Text('Date: ${usageData.dateOfBillIssued}'),
      Text('Water Consumer: ${usageData.waterConsumerNumber}'),
      Text('Water Amount Paid: ${usageData.waterAmountPaid}'),
      Text('Water Liters Used: ${usageData.waterLitersUsed}'),
      // Add other water details
    ],
  );
}
