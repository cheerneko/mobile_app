import 'dart:io';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My first App",
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back_ios, color: Colors.white),),
        actions: const [
        IconButton(onPressed: null, icon: Icon(Icons.ios_share_rounded, color: Color.fromARGB(255, 248, 153, 185))),
        IconButton(onPressed: null, icon: Icon(Icons.favorite_border,  color: Colors.white))
      ],
      title: const Center(
        child: Text("Chiang Mai", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      ),
    
      body: 
      SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
        
        ImageSlideshow(
          width: double.infinity,
          height: 150,
          children: [
            Image.asset("assets/images/hotel1.png",
            fit: BoxFit.cover,
            ),
            Image.network('https://pix10.agoda.net/hotelImages/2311381/0/76915fa191fe1cf70fde35f7e8f1f1d4.jpg?ca=9&ce=1&s=1024x768',
            fit: BoxFit.cover,
            ),
            Image.network('https://ak-d.tripcdn.com/images/200n10000000ott2uDAEB_R_960_660_R5_D.jpg',
            fit: BoxFit.cover,
            ),
            Image.network('https://media-cdn.tripadvisor.com/media/photo-s/02/24/dc/77/hotel-from-pool-area.jpg',
            fit: BoxFit.cover,
            ),
            Image.network('https://itravel.in.th/wp-content/uploads/2019/09/%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1%E0%B9%81%E0%B8%8A%E0%B8%87%E0%B8%81%E0%B8%A3%E0%B8%B5-%E0%B8%A5%E0%B8%B2-%E0%B9%80%E0%B8%8A%E0%B8%B5%E0%B8%A2%E0%B8%87%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88-%E0%B9%82%E0%B8%A3%E0%B8%87%E0%B9%81%E0%B8%A3%E0%B8%A1-5-%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B9%80%E0%B8%8A%E0%B8%B5%E0%B8%A2%E0%B8%87%E0%B9%83%E0%B8%AB%E0%B8%A1%E0%B9%88-itravel.jpg',
            fit: BoxFit.cover,
            ),
          ]),
          SizedBox(height: 20,),
      
          Container(child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,children: [
            
            Text('UNESCO Sustainable Travel pledge',style: TextStyle(fontSize: 15, color: Colors.grey[700]) ),
            Text('Shangri-La Chiang Mai',style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white) ),
            //Icon(Icons.star, color: Colors.white,),
            Row(children: [
              Icon(Icons.star, color: Colors.grey[700],),
              Icon(Icons.star, color: Colors.grey[700],),
              Icon(Icons.star, color: Colors.grey[700],),
              Icon(Icons.star, color: Colors.grey[700],),
              Icon(Icons.star, color: Colors.grey[700],),
            ],),
            Text('Luxury hotel with free water park near Chiang Mai Night Bazaar',style: TextStyle(fontSize: 18, color: Colors.grey[700]) ),
          ]),), 
          
          Container(child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,children: [
            
            SizedBox(
              height: 25.0,
            ),
            Text('9.0/10 Superb',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white) ),
            SizedBox(height: 10,),
            Text('1000 verified Hotels.com guest reviews',style: TextStyle(fontSize: 15, color: Colors.grey[400]) ),
            SizedBox(height: 5,),
            Text('See all 1,000 reviews  >',style: TextStyle(fontSize: 15, color: Colors.blue[100]) ),
          ]),),
           
          
          //const Expanded(child: Text('UNESCO Sustainable Travel pledge',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200, color: Colors.white) ),
          
          Container(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(
              height: 20.0,
            ),
            Text('Popular amenities',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white) ),
          ]),),
      
          Container(padding: EdgeInsets.all(10),
           child: Row(children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.wifi, color: Colors.white,),
                      Text("   Free WiFi", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  ),
      
                  Row(children: [
                    Icon(Icons.ac_unit, color: Colors.white,),Text("   Air Conditioning", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 245, 236, 236)) ,),
                  ],),
      
                  Row(children: [
                    Icon(Icons.fitness_center, color: Colors.white,),Text("   Gym", style: TextStyle(fontSize: 15, color: Colors.white) ,)
                  ],)
      
                ],
              ),
            ), 
            
          Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.pool, color: Colors.white,),
                      Text("   Pool", style: TextStyle(fontSize: 15, color: Colors.white)),
                    ],
                  ),
      
                  Row(children: [
                    Icon(Icons.directions_car, color: Colors.white,),Text("   Free Parking", style: TextStyle(fontSize: 15, color: Colors.white) ,),
                  ],),
      
                  Row(children: [
                    Icon(Icons.thermostat_outlined, color: Colors.white,),Text("   Refrigeration", style: TextStyle(fontSize: 15, color: Colors.white) ,)
                  ],),
      
                ],
              ),
              
            ),
          ],),
          
          ),
          SizedBox(height: 30,),
          Container(child: Image.asset("assets/images/map1.png"),)],
       ),
       
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 50.0,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 152, 194, 236),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: Text(
                'Select a room',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
        ),
      )
        
      
      ));}
}

