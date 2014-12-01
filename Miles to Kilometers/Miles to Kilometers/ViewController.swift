//
//  ViewController.swift
//  Miles to Kilometers
//
//  Created by Craig Janis on 11/30/2014.
//  Copyright (c) 2014 Fubeca Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // setup main label
    @IBOutlet weak var labelMain: UILabel!

    // setup textfield
    @IBOutlet weak var textfieldDistance: UITextField!

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
    }
    
    // setup submit button
    @IBAction func buttonConvert(sender: AnyObject) {

        // convert distance from string to float
        var distance = (textfieldDistance.text as NSString).floatValue

        // make conversion
        var miles, kilometers: Float
        if (units == "miles") {
            miles = distance
            kilometers = miles * 1.609344
        } else {
            kilometers = distance
            miles = kilometers * 0.621371
        }
        
        // format numbers
        let nf = NSNumberFormatter(); nf.numberStyle = NSNumberFormatterStyle.DecimalStyle; nf.maximumFractionDigits = 2
        var formattedMiles = nf.stringFromNumber(miles)
        var formattedKilometers = nf.stringFromNumber(kilometers)
        
        // determine terminology
        var termMiles = "mile"
        if (formattedMiles != "1") {
            termMiles = termMiles + "s"
        }
        var termKilometers = "kilometer"
        if (formattedKilometers != "1") {
            termKilometers = termKilometers + "s"
        }
        
        // display results
        labelMain.text = "\(formattedMiles!) \(termMiles) = \(formattedKilometers!) \(termKilometers)"
        
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

