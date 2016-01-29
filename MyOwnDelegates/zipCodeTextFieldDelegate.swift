//
//  zipCodeTextFieldDelegate.swift
//  MyOwnDelegates
//
//  Created by Klaudyna Marciniak on 23.11.2015.
//  Copyright © 2015 Klaudyna Marciniak. All rights reserved.
//

import Foundation
import UIKit

class zipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange,
    replacementString string: String) -> Bool {
        
        let currencyFieldDelegate = currencyTextFieldDelegate()
        if !(currencyFieldDelegate.isDigit(string)){
            return false
        }
        var newText = textField.text! as NSString
        newText = newText.stringByReplacingCharactersInRange(range, withString: string)
        if newText.length >= 5 {
            textField.text = newText.substringToIndex(5)
            return false
        }
        else {
            return true
        }
    }
}