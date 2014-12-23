VIPER-Bath-Tub-Test-in-Swift
============================

The Bath Tub test project, designed and architected using VIPER. Written in Swift.

The purpose of this project is to show how to implement the full test (test requirements to follow), using the great architecture pattern <a href="http://www.objc.io/issue-13/viper.html">VIPER</a>, and Swift. It will be developed using TDD as much as possible. 

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
