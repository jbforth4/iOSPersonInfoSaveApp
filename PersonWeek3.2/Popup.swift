//
//  Popup.swift
//  PersonWeek3.2
//
//  Created by Jared Forth on 7/30/16.
//  Copyright © 2016 Jared Forth. All rights reserved.
//

import UIKit

class popup: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        datePickerLabel.text! =
            (presentingViewController as! ViewController).DOB.text!
        super.viewWillAppear(animated)
    }

    @IBOutlet var datePickerLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBAction func doneButton(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let strDate = dateFormatter.string(from: datePicker.date)
        datePickerLabel.text! = strDate
        (presentingViewController as! ViewController).DOB.text =
            datePickerLabel.text
        dismiss(animated: true, completion: nil)
    
    }
}
