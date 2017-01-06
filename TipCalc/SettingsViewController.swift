//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by David Yuan on 1/5/17.
//  Copyright © 2017 David Yuan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var field: UITextField!
    @IBAction func EditChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(Double(field.text!) ?? 0, forKey: "customPercent")
        defaults.synchronize()
    }
    @IBOutlet weak var seg: UISegmentedControl!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        if defaults.double(forKey: "customPercent") > 0 {
            field.text = String(defaults.double(forKey: "customPercent"))
        }
        seg.selectedSegmentIndex = defaults.integer(forKey: "segIndex") 
        
    }
    @IBAction func dechanged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(seg.selectedSegmentIndex, forKey: "segIndex")

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
