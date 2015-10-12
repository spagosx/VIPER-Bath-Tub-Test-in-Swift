VIPER-Bath-Tub-Test-in-Swift
============================

![Build Status](https://travis-ci.org/spagosx/VIPER-Bath-Tub-Test-in-Swift.svg?branch=master)

The Bath Tub test project, designed and architected using VIPER. Written in Swift.

The purpose of this project is to show how to implement the full test, using the great architecture pattern <a href="http://www.objc.io/issue-13/viper.html">VIPER</a>, and Swift. It's developed using the TDD approach. 

**Requirements**

The interface will be able to show the current status at anytime. It will show the water level in the bath and the water temperature. 
The user will be presented with 2 taps. The user will be able to turn on and off each tap individually; one for cold water and one for hot water. 

- The bath has a capacity of 150 litres.
- The cold water tap has a flow of 12 litres per miunte at 10 degrees celsius
- The hot water has a flow of 10 litres per minute. The temperature will be retrieved from a "boiler" service. 
- The "boiler" service can be a json document response from a URL request.

**NOTES:**
- The system is perfect and doesn't have cooling over time.
- There is no warmup time.
- There is no reduced flow.
- When both taps are open there's a full flow rate and constant temperature.

***NOTEWORTHY***
- It shows how to architect an app (even if simple) using VIPER.
- It shows how the TDD approach drives the production code.
- It shows how to achieve mocking in Swift.
- It shows how to test NSTimer (looking for suggestion to improve that).
- It shows a non trivial TDD problem, testing IBOutlet and IBActions connections.
...

***TODO***
- Decouple Interactor class from Thermometer (stop it being a Singleton 'yuk').
- Interactor does too much. Extract water flow to a flow controller class. Extract water temperatures to a Boiler model class
