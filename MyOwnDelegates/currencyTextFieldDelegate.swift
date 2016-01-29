//
//  currencyTextFieldDelegate.swift
//  MyOwnDelegates
//
//  Created by Klaudyna Marciniak on 23.11.2015.
//  Copyright © 2015 Klaudyna Marciniak. All rights reserved.
//

import Foundation
import UIKit

class currencyTextFieldDelegate: NSObject, UITextFieldDelegate{

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string:  String) -> Bool {
        
        if !(isDigit(string)) {
            return false
        }
        let cleanArray = textField.text!.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet) as NSArray
        let cleanCentString  = cleanArray.componentsJoinedByString("")
        var centAmount:NSInteger! =  Int(cleanCentString)
        if (string as NSString).length > 0 {
            if centAmount == nil {
                centAmount = 0
            }
            
            centAmount = centAmount * 10 + Int(string)!
        }
        
        else {
            centAmount = centAmount / 10
        }
        
        let floatValue = Double(centAmount) / 100
        let amount = NSNumber(double:  floatValue )
        let _currencyFormatter = NSNumberFormatter()
        _currencyFormatter.numberStyle = .CurrencyStyle
        _currencyFormatter.currencyCode = "USD"
        
        textField.text = _currencyFormatter.stringFromNumber(amount)
        return false
    }
    
    
    func isDigit(string:  String) -> Bool {
        print(string)
        //check for digits while not blocking
        let digits = NSCharacterSet.decimalDigitCharacterSet()
        for c in string.characters {
            let convertedC = String(c).utf16
            if !digits.characterIsMember(convertedC[convertedC.startIndex]) {
                return false
            }
        }
        return true
    }
}
