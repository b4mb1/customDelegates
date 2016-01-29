//
//  ViewController.swift
//  MyOwnDelegates
//
//  Created by Klaudyna Marciniak on 23.11.2015.
//  Copyright © 2015 Klaudyna Marciniak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var currencyTextField: UITextField!
    @IBOutlet weak var permissionNeededTextField: UITextField!
    @IBOutlet weak var permissionSwitch: UISwitch!
    
    let zipCodeDelegate = zipCodeTextFieldDelegate()
    let currencyDelegate = currencyTextFieldDelegate()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        permissionSwitch.on = false
        zipCodeTextField.delegate = zipCodeDelegate
        currencyTextField.delegate = currencyDelegate
        permissionNeededTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        let shouldBeginEditing = permissionSwitch.on ? true : false
        return shouldBeginEditing
    }

    @IBAction func blockTextField(sender: AnyObject) {
        permissionNeededTextField.endEditing(permissionSwitch.on ? false : true)
    }

}

