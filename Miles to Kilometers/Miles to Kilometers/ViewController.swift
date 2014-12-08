//
//  ViewController.swift
//  Miles to Kilometers
//
//  Created by Craig Janis on 11/30/2014.
//  Copyright (c) 2014 Fubeca Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // convert function
    func convert() {
        
        // convert distance from string to float
        var distance = (textfieldDistance.text as NSString).floatValue
        
        // make conversion
        var miles, kilometers: Float
        if (units == "miles") {
            miles = distance
            kilometers = miles * 1.609344
        } else {
            kilometers = distance
            miles = kilometers * 0.621371192
        }
        
        // format numbers
        let nf = NSNumberFormatter(); nf.numberStyle = NSNumberFormatterStyle.DecimalStyle; nf.maximumFractionDigits = 9
        var formattedMiles = nf.stringFromNumber(miles)
        var formattedKilometers = nf.stringFromNumber(kilometers)
        
        // determine terminology
        var termMiles = "mi"
        if (formattedMiles != "1") {
            termMiles = termMiles + ""
        }
        var termKilometers = "km"
        if (formattedKilometers != "1") {
            termKilometers = termKilometers + ""
        }
        
        // display results
        labelMain.text = "\(formattedMiles!) \(termMiles) = \(formattedKilometers!) \(termKilometers)"
        
    }
    
    // setup main label
    @IBOutlet weak var labelMain: UILabel!

    // setup textfield
    @IBOutlet weak var textfieldDistance: UITextField!
    @IBAction func textfieldDistanceChange(sender: AnyObject) {
        convert()
    }
    // reset textfield content
    func resetTextfieldDistance() {
        var distance = (textfieldDistance.text as NSString).floatValue
        if (distance > 0) {
            // format numbers
            let nf = NSNumberFormatter(); nf.numberStyle = NSNumberFormatterStyle.NoStyle; nf.maximumFractionDigits = 9
            var formattedDistance = nf.stringFromNumber(distance)
            // reset content
            textfieldDistance.text = formattedDistance
        } else {
            textfieldDistance.text = "0"
        }
        convert()
    }
    // dismiss keyboard
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        resetTextfieldDistance()
        self.view.endEditing(true)
    }

    // setup unit selector
    var units = "miles"
    @IBOutlet weak var segmentUnits: UISegmentedControl!
    @IBAction func segmentUnits(sender: AnyObject) {
        switch segmentUnits.selectedSegmentIndex
        {
            case 0:
                units = "miles";
            case 1:
                units = "kilometers";
            default:
                break;
        }
        convert()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

