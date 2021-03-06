//
//  CurrencyVC.swift
//  UnitConverter
//
//  Created by Nick on 12/01/2017.
//  Copyright © 2017 Nick Bell. All rights reserved.
//

import UIKit

class CurrencyVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var fromBtn: UIButton!
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var toBtn: UIButton!
    @IBOutlet weak var convertBtn: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    let currencies = ["British Pounds", "American Dollars", "Euros"]
    let GBPtoDOL: Double = 1.23
    let GBPtoEUR: Double = 1.15
    let DOLtoEUR: Double = 0.94

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromPicker.dataSource = self
        fromPicker.delegate = self
        toPicker.dataSource = self
        toPicker.delegate = self
        fromPicker.tag = 1
        toPicker.tag = 2
        
        valueTextField.delegate = self
        valueTextField.keyboardType = UIKeyboardType.numbersAndPunctuation
        answerLabel.isHidden = true
    }

    @IBAction func BackBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }


    @IBAction func fromBtnPressed(_ sender: Any) {
        fromPicker.isHidden = false
        fromBtn.isHidden = true
        valueTextField.isHidden = true
        fromLabel.isHidden = true
        toLabel.isHidden = true
        toBtn.isHidden = true
        convertBtn.isHidden = true
        answerLabel.isHidden = true
    }
    
    @IBAction func toBtnPressed(_ sender: Any) {
        toPicker.isHidden = false
        fromBtn.isHidden = true
        valueTextField.isHidden = true
        fromLabel.isHidden = true
        toLabel.isHidden = true
        toBtn.isHidden = true
        convertBtn.isHidden = true
        answerLabel.isHidden = true
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencies[row]
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            fromBtn.setTitle(currencies[row], for: UIControlState.normal)
            fromPicker.isHidden = true
            fromBtn.isHidden = false
            valueTextField.isHidden = false
            fromLabel.isHidden = false
            toLabel.isHidden = false
            toBtn.isHidden = false
            convertBtn.isHidden = false
        } else {
            toBtn.setTitle(currencies[row], for: UIControlState.normal)
            toPicker.isHidden = true
            fromBtn.isHidden = false
            valueTextField.isHidden = false
            fromLabel.isHidden = false
            toLabel.isHidden = false
            toBtn.isHidden = false
            convertBtn.isHidden = false
        }
    }
    
    func convert(number: Double, multiplier: Double) -> Double {
        let conNum = Double(number) * multiplier
        return conNum
    }
    
    @IBAction func convertBtnPressed(_ sender: Any) {
        let from = fromBtn.title(for: .normal)
        let to = toBtn.title(for: .normal)
        answerLabel.isHidden = false
        let numStr = (valueTextField.text)
        var num1: Double?
        if numStr != nil {
            num1 = Double(numStr!)
            if num1 != nil {
                if from == "British Pounds" && to == "American Dollars" {
                    var num2 = convert(number: num1!, multiplier: GBPtoDOL)
                    num2 = Double(round(num2*100)/100)
                    answerLabel.text = "\(num2) Dollars"
                } else if from == "American Dollars" && to == "British Pounds" {
                    var num2 = convert(number: num1!, multiplier: 1 / GBPtoDOL)
                    num2 = Double(round(num2*100)/100)
                    answerLabel.text = "\(num2) Pounds"
                } else if from == "British Pounds" && to == "Euros" {
                    var num2 = convert(number: num1!, multiplier: GBPtoEUR)
                    num2 = Double(round(num2*100)/100)
                    answerLabel.text = "\(num2) Euros"
                } else if from == "Euros" && to == "British Pounds" {
                    var num2 = convert(number: num1!, multiplier: 1 / GBPtoEUR)
                    num2 = Double(round(num2*100)/100)
                    answerLabel.text = "\(num2) Pounds"
                } else if from == "American Dollars" && to == "Euros" {
                    var num2 = convert(number: num1!, multiplier: DOLtoEUR)
                    num2 = Double(round(num2*100)/100)
                    answerLabel.text = "\(num2) Euros"
                } else if from == "Euros" && to == "American Dollars" {
                    var num2 = convert(number: num1!, multiplier: 1 / DOLtoEUR)
                    num2 = Double(round(num2*100)/100)
                    answerLabel.text = "\(num2) Dollars"
                } else {
                    answerLabel.text = "No change"
                }
            } else {
                answerLabel.text = "Enter a value"
            }
        } else {
            answerLabel.text = "Enter a value"
        }
    }
    
    
}
