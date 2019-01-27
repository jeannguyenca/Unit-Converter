//
//  ViewController.swift
//  Unit Converter
//
//  Created by Truong Huong Giang Nguyen on 1/21/19.
//  Copyright © 2019 Jean Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var temperatureRange: TemperatureRange!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperaturePicker: UIPickerView!
    @IBOutlet weak var temperatureSegmentedControlOutlent: UISegmentedControl!
    
    var isCelcius = true
        
    let unitConverter = UnitConverter()
    
    let userDefaultsLastRowKey = "defaultPickerRow"
    let userDefaultsLastOption = "defaultSegment"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        temperaturePicker.delegate = self
        
        //defaultPickerRow
        let defaultPickerRow = initialPickerRow()
        temperaturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        
        //default pickerView
        pickerView(temperaturePicker, didSelectRow: defaultPickerRow, inComponent: 0)
        
        //default segment
        let defaultSegment = initialSegment()
        temperatureSegmentedControlOutlent.selectedSegmentIndex = defaultSegment
        
    }
    
    
    //calculate saved row or choose default row
    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    //save selected row
    func saveSelectedRow(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    
    //choose default segment
    func initialSegment() -> Int {
        if let savedOption = UserDefaults.standard.object(forKey: userDefaultsLastOption) as? Int{
            return savedOption
        }
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }
    
    //save selected segment
    func saveSelectedSegment(option: Int) {
        let defaults = UserDefaults.standard
        defaults.set(option, forKey: userDefaultsLastOption)
        defaults.synchronize()
    }
    
    func displayConvertedTemperatureForRow(row: Int) {
        let value = temperatureRange.values[row]
        if(isCelcius) {
            temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: value))°F"
        } else {
            temperatureLabel.text = "\(unitConverter.degreesCelcius(degreesFarenheit: value))°C"
        }
    }
    
    //UIsegmentControl
    @IBAction func temperatureSegmentedControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            isCelcius = false;
        case 1:
            isCelcius = true;
        default:
            break;
        }
        temperaturePicker.reloadAllComponents()
        displayConvertedTemperatureForRow(row: initialPickerRow())
        saveSelectedSegment(option: sender.selectedSegmentIndex)
    }
    
}



extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (isCelcius) {
            return "\(temperatureRange.values[row])°C"
        } else {
            return "\(temperatureRange.values[row])°F"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
        
    }
    
}

