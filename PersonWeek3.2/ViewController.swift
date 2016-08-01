//
//  ViewController.swift
//  PersonWeek3.2
//
//  Created by Jared Forth on 7/30/16.
//  Copyright © 2016 Jared Forth. All rights reserved.
//

import UIKit

class Person{
    
    var fName: String = ""
    var lName: String = ""
    var address: String = ""
    var address2: String = ""
    var city: String = ""
    var state: String = ""
    var gender: String = ""
    var education: String = ""
    var phone: String = ""
    var email: String = ""
    var dob: String = ""
    
    func isValidPhone(value: String) -> Bool {
        let PhoneRegex = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = Predicate(format: "SELF MATCHES %@", PhoneRegex)
        let phoneResult = phoneTest.evaluate(with: value)
        return phoneResult
        
    }
    
    func isValidEmail(YourEMailAddress: String) -> Bool {
        let REGEX: String
        REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return Predicate(format: "SELF MATCHES %@", REGEX).evaluate(with: YourEMailAddress)
    }
    
    func savePersonInfoSomewhere(){
        //function to save information to file or database if needed
    }
    
    func printPersonInfoFromVariablesToConsole(){
        print(fName,lName,address,address2,city,state,gender,education,phone,email,dob)
    }
    
}

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func Calendar(_ sender: AnyObject) {
    }
    @IBOutlet var GenderButton: UISegmentedControl!
    @IBAction func GenderAction(_: UISegmentedControl!) {
        switch GenderButton.selectedSegmentIndex
        {
        case 0:
            Gender.text! = "Male";
        case 1:
            Gender.text! = "Female";
        default:
            break;
        }
    }
    @IBAction func EducationButton(_ sender: AnyObject) {
        let optionMenu = UIAlertController(title: nil, message: "Choose Option", preferredStyle: .actionSheet)
        let highSchool = UIAlertAction(title: "High School", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.Education.text! = "High School"
        })
        let associates = UIAlertAction(title: "Associates", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.Education.text! = "Associates"
        })
        let bachelors = UIAlertAction(title: "Bachelors", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.Education.text! = "Bachelors"
        })
        let masters = UIAlertAction(title: "Masters", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.Education.text! = "Masters"
        })
        let doctorates = UIAlertAction(title: "Doctorate", style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
            self.Education.text! = "Doctorate"
        })

        optionMenu.addAction(highSchool)
        optionMenu.addAction(associates)
        optionMenu.addAction(bachelors)
        optionMenu.addAction(masters)
        optionMenu.addAction(doctorates)
        self.present(optionMenu, animated: true, completion: nil)
    }

    var PersonClass = Person()
    var PersonArray = Array<String>()
    @IBOutlet var FirstName: UITextField!
    @IBOutlet var LastName: UITextField!
    @IBOutlet var Address: UITextField!
    @IBOutlet var Address2: UITextField!
    @IBOutlet var City: UITextField!
    @IBOutlet var State: UITextField!
    @IBOutlet var Gender: UITextField!
    @IBOutlet var Education: UITextField!
    @IBOutlet var Phone: UITextField!
    @IBOutlet var Email: UITextField!
    @IBOutlet var DOB: UILabel!
    @IBAction func SaveButton(_ sender: AnyObject) {
        PersonArray.append(FirstName.text!)
        PersonClass.fName = FirstName.text!
        PersonArray.append(LastName.text!)
        PersonClass.lName = LastName.text!
        PersonArray.append(Address.text!)
        PersonClass.address = Address.text!
        PersonArray.append(Address2.text!)
        PersonClass.address2 = Address2.text!
        PersonArray.append(City.text!)
        PersonClass.city = City.text!
        PersonArray.append(State.text!)
        PersonClass.state = State.text!
        PersonArray.append(Gender.text!)
        PersonClass.gender = Gender.text!
        PersonArray.append(Education.text!)
        PersonClass.gender = Education.text!
        if (PersonClass.isValidPhone(value: Phone.text!)){
            PersonArray.append(Phone.text!)
            PersonClass.phone = Phone.text!
        } else {
            let alertController = UIAlertController(title: "Error!!", message:
                "Please enter a valid phone number!!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        if (PersonClass.isValidEmail(YourEMailAddress: Email.text!)){
            PersonArray.append(Email.text!)
            PersonClass.phone = Email.text!
        } else {
            let alertController = UIAlertController(title: "Error!!", message:
                "Please enter a valid Email Address!!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        PersonArray.append(DOB.text!)
        PersonClass.dob = DOB.text!
        //print(PersonArray)
        PersonClass.printPersonInfoFromVariablesToConsole()
        let alertController = UIAlertController(title: "Congratulations!!", message:
            "Your Information Has been saved!! P.S the NSA probably has it too...", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}

