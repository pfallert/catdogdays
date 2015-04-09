//
//  ViewController.swift
//  datdogdaysV2
//
//  Created by Paul Fallert on 4/8/15.
//  Copyright (c) 2015 Paul Fallert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var catAgeEntry: UITextField!
    @IBOutlet weak var dogAgeEntry: UITextField!
    
    @IBOutlet weak var catAgeResult: UILabel!
    @IBOutlet weak var dogAgeResult: UILabel!
    
    @IBOutlet weak var factoidText: UILabel!
    
    var factoids = ["Fact1","Fact2", "Fact3", "Fact4", "Fact5", "Fact6"]
    
    func RandomFactoid()
    {
     var random = Int(arc4random_uniform(UInt32(factoids.count)))
      factoidText.text = factoids[random]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RandomFactoid()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func calcCatTapped(sender: AnyObject) {
        var age = Double((catAgeEntry.text as NSString).doubleValue)
        switch age
        {
            case 1:
                var result = 15
                catAgeResult.text = toString(result)
            case 2:
                var result = 24
                catAgeResult.text = toString(result)
            default:
                var interimResult = (age - 2) * 4
                var result = interimResult + 24
                catAgeResult.text = toString(result)
        }
        RandomFactoid()
        catAgeResult.hidden = false
        catAgeEntry.text = ""
        catAgeEntry.resignFirstResponder()
    }


    @IBAction func calcDogTapped(sender: AnyObject) {
        var age = Double((dogAgeEntry.text as NSString).doubleValue)
        if age <= 2
        {
            var result = age * 10.5
            dogAgeResult.text = toString(result)
        } else {
            var interimResult = (age - 2) * 4
            var result = interimResult + 21
            dogAgeResult.text = toString(result)
        }
        RandomFactoid()
        dogAgeResult.hidden = false
        dogAgeEntry.text = ""
        dogAgeEntry.resignFirstResponder()
    }
    
    
    @IBAction func newFactoidTapped(sender: AnyObject) {
        RandomFactoid()
    }
}

