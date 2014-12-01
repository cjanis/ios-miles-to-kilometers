//
//  ViewController.swift
//  Miles to Kilometers
//
//  Created by Craig Janis on 11/30/2014.
//  Copyright (c) 2014 Fubeca Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelMain: UILabel!
    
    @IBOutlet weak var textfieldMiles: UITextField!
    
    @IBAction func buttonConvert(sender: AnyObject) {
        
        println(">> converting \(textfieldMiles.text) miles to kilometers")
        
        // convert miles from string to float
        var miles = (textfieldMiles.text as NSString).floatValue
        
        // calculate kilometers
        var kilometers = miles * 1.609344
        
        // format numbers
        var finalMiles = NSString(format:"%.2f", miles)
        var finalKilometers = NSString(format:"%.2f", kilometers)
        
        // determine terminology
        var termMiles = "mile"
        if (finalMiles != "1.00") {
            termMiles = termMiles + "s"
        }
        var termKilometers = "kilometer"
        if (finalKilometers != "1.00") {
            termKilometers = termKilometers + "s"
        }
        
        // display results
        labelMain.text = "\(finalMiles) \(termMiles) = \(finalKilometers) \(termKilometers)"
        
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

