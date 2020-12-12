import 'package:flutter/material.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Color(0xFF407BFF)),
                onPressed: () {},
              ),
              Center(child: Text("Bookee Challenge", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold))),
              SizedBox(height: 20.0),
              _buildChallengeWidget(challengeType: "Daily Challenge", isCompleted: true, progressLevel: "0"),
              SizedBox(height: 20.0),
              _buildChallengeWidget(challengeType: "Weekly Challenge", isCompleted: true, progressLevel: "0"),
              SizedBox(height: 20.0),
              _buildChallengeWidget(challengeType: "2 weeks challenge", isCompleted: false, progressLevel: "21%"),
              SizedBox(height: 20.0),
              _buildChallengeWidget(challengeType: "Monthly challenge", isCompleted: false, progressLevel: "32%"),
              SizedBox(height: 20.0),
              _buildChallengeWidget(challengeType: "Yearly challenge", isCompleted: false, progressLevel: "5%"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeWidget({String challengeType, bool isCompleted, String progressLevel}) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 100,
            width: 280,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  challengeType,
                                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(width: 40.0),
                                Visibility(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 13.0),
                                      child: Text(progressLevel),
                                    ),
                                    visible: isCompleted ? false : true,
                                    maintainSize: false,
                                    maintainState: false),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Text(isCompleted ? "Completed" : "Ongoing"),
                              SizedBox(width: 50.0),
                              Visibility(
                                visible: isCompleted ? false : true,
                                child: SizedBox(width: 120, child: LinearProgressIndicator(backgroundColor: Colors.blue, value: 2.0)),
                              )
                            ],
                          )
                        ],
                      ),
                      Visibility(
                        maintainSize: false,
                        maintainState: false,
                        visible: isCompleted ? true : false,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0, top: 20),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: Color(0xff407BFF), borderRadius: BorderRadius.circular(10)),
                            child: Icon(Icons.check, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: Colors.white,
            elevation: 3,
            child: Container(
              width: 80,
              height: 80,
              child: Center(
                child: Image.asset("assets/images/icon_feather_award.png", width: 30, height: 30),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
