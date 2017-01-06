//
//  ViewController.swift
//  TipCalc
//
//  Created by David Yuan on 1/5/17.
//  Copyright © 2017 David Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLabel: UILabel!
    var cusPer = Double(25)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func changeSplit(_ sender: Any) {
        splitLabel.text=String(Int(splitSlider.value))
        update()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        let defaults = UserDefaults.standard
        
       // print("a")
        cusPer = defaults.double(forKey: "customPercent")
        if cusPer <= 0{
            cusPer = 25
        }
        tipControl.setTitle("\(cusPer)%", forSegmentAt: 3)
        tipControl.selectedSegmentIndex = defaults.integer(forKey: "segIndex")
        if defaults.double(forKey: "bill")>0{
        billField.text = String(defaults.double(forKey: "bill"))
        }
        update()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        //view.endEditing(true)
    }
    @IBAction func calcTip(_ sender: Any) {
        update()
    }
    @IBAction func valChanged(_ sender: Any) {
        update()
    }
    func update(){
        let tipPercentages = [0.15, 0.18, 0.22,cusPer/100]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total/Double(splitLabel.text!)!)
        let defaults = UserDefaults.standard
        defaults.set(Double(billField.text!), forKey: "bill")

    }
    

}

