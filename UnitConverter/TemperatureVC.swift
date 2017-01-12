//
//  TemperatureVC.swift
//  UnitConverter
//
//  Created by Nick on 12/01/2017.
//  Copyright © 2017 Nick Bell. All rights reserved.
//

import UIKit

class TemperatureVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    @IBOutlet weak var fromBtn: UIButton!
    @IBOutlet weak var toBtn: UIButton!
    @IBOutlet weak var convertBtn: UIButton!
    @IBOutlet weak var fromPicker: UIPickerView!
    @IBOutlet weak var toPicker: UIPickerView!
    @IBOutlet weak var answerLabel: UILabel!
    
    let temperatures = ["Celcius", "Fahrenheit", "Kelvin"]
    
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

    @IBAction func backBtnPressed(_ sender: Any) {
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
        return temperatures.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return temperatures[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1) {
            fromBtn.setTitle(temperatures[row], for: UIControlState.normal)
            fromPicker.isHidden = true
            fromBtn.isHidden = false
            valueTextField.isHidden = false
            fromLabel.isHidden = false
            toLabel.isHidden = false
            toBtn.isHidden = false
            convertBtn.isHidden = false
        } else {
            toBtn.setTitle(temperatures[row], for: UIControlState.normal)
            toPicker.isHidden = true
            fromBtn.isHidden = false
            valueTextField.isHidden = false
            fromLabel.isHidden = false
            toLabel.isHidden = false
            toBtn.isHidden = false
            convertBtn.isHidden = false
        }
    }
    
    func convertC2F(number: Double) -> Double {
        let conNum = (number * 1.8) + 32
        return conNum
    }
    
    func convertF2C(number: Double) -> Double {
        let conNum = (number - 32) / 1.8
        return conNum
    }
    
    func convertC2K(number: Double) -> Double {
        let conNum = number + 273.15
        return conNum
    }
    
    func convertK2C(number: Double) -> Double {
        let conNum = number - 273.15
        return conNum
    }
    
    func convertF2K(number: Double) -> Double {
        let num1 = convertF2C(number: number)
        let conNum = convertC2K(number: num1)
        return conNum
    }
    
    func convertK2F(number: Double) -> Double {
        let num1 = convertK2C(number: number)
        let conNum = convertC2F(number: num1)
        return conNum
    }

    
    @IBAction func convertButton(_ sender: Any) {
        let from = fromBtn.title(for: .normal)
        let to = toBtn.title(for: .normal)
        answerLabel.isHidden = false
        let numStr = (valueTextField.text)
        var num1: Double?
        if numStr != nil {
            num1 = Double(numStr!)
            if num1 != nil {
                if from == "Celcius" && to == "Fahrenheit" {
                    let num2 = convertC2F(number: num1!)
                    answerLabel.text = "\(num2) Fahrenheit"
                } else if from == "Fahrenheit" && to == "Celcius" {
                    let num2 = convertF2C(number: num1!)
                    answerLabel.text = "\(num2) Celsius"
                } else if from == "Fahrenheit" && to == "Kelvin" {
                    let num2 = convertF2K(number: num1!)
                    answerLabel.text = "\(num2) Kelvin"
                } else if from == "Kelvin" && to == "Fahrenheit" {
                    let num2 = convertK2F(number: num1!)
                    answerLabel.text = "\(num2) Fahrenheit"
                } else if from == "Celcius" && to == "Kelvin" {
                    let num2 = convertC2K(number: num1!)
                    answerLabel.text = "\(num2) Kelvin"
                } else if from == "Kelvin" && to == "Celcius" {
                    let num2 = convertK2C(number: num1!)
                    answerLabel.text = "\(num2) Celcius"
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
