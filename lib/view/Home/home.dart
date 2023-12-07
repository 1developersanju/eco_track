import 'package:carousel_slider/carousel_slider.dart';
import 'package:electricity/dummy/charts.dart';
import 'package:electricity/models/usageDataModel.dart';
import 'package:electricity/services/UsageDataServices.dart';
import 'package:electricity/services/general%20services/helpers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String userName;

  HomePage({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UsageData> usageDataList = [];
  int _current = 0;
  final CarouselController _controller = CarouselController();
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    // Use a post-frame callback to wait for the widget to build
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // Jump to the last index after the widget builds
      _controller.jumpToPage(usageDataList.length - 1);
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();

  }

  Future<void> loadData() async {
    UsageDataService usageDataService = UsageDataService();
    usageDataList = await usageDataService.fetchUsageData(useApi: false);
    setState(() {
      _current = usageDataList.length - 1; // Set current index to last index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
     appBar: AppBar(backgroundColor: ColorConstants.white,title:                     Text(
                      "Hi ${widget.userName}!",
                      style: TextStyles.subHeading,
                    ),
centerTitle: false,),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                                          Text(
                                      "Check your usage compared to previous bills",
                
                      style: TextStyles.normalText,
                    ),
                
                  ],
                ),
                Spacer(),
                IconButton(onPressed: (){}, icon: Icon(Icons.notifications))
              ],
            ),
            CarouselSlider(
              
  items: usageDataList.map((usageData) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Month: ${usageData.dateOfBillIssued}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: _buildElectricityData(usageData),
                    ),
                    Expanded(
                      child: _buildWaterData(usageData),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }).toList(),
  carouselController: _controller,
  options: CarouselOptions(
    initialPage: _current,
    autoPlay: false,
    enableInfiniteScroll: false,
    enlargeCenterPage: true,
    aspectRatio: 1.7,
    onPageChanged: (index, reason) {
      setState(() {
        _current = index;
      });
    },
  ),
),

            SizedBox(height: 16),
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
                      color: _current == entry.key
                          ? Colors.teal
                          : Colors.teal.withOpacity(0.4),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Chart(
              electricityData: ElectricityData,
              waterData: WaterData,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElectricityData(UsageData usageData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Electricity Usage'),
        SizedBox(height: 8),
        Text('Date: ${usageData.dateOfBillIssued}'),
        Text('Consumer: ${usageData.electricityConsumerNumber}'),
        Text('Amount Paid: \$${usageData.electricityAmountPaid}'),
        Text('Kilowatt Used: ${usageData.electricityKilowattUsed} kWh'),
      ],
    );
  }

  Widget _buildWaterData(UsageData usageData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Water Usage'),
        SizedBox(height: 8),
        Text('Date: ${usageData.dateOfBillIssued}'),
        Text('Consumer: ${usageData.waterConsumerNumber}'),
        Text('Amount Paid: \$${usageData.waterAmountPaid}'),
        Text('Liters Used: ${usageData.waterLitersUsed} liters'),
      ],
    );
  }
}
