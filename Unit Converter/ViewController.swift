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
    
    @IBOutlet weak var temperatureSegmentedControl: UISegmentedControl!
    
    let unitConverter = UnitConverter()
    
    let userDefaultsLastRowKey = "defaultCelciusPickerRow"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        temperaturePicker.delegate = self
        
        //defaultPickerRow
        let defaultPickerRow = initialPickerRow()
        temperaturePicker.selectRow(defaultPickerRow, inComponent: 0, animated: true)
        
        //default pickerView
        pickerView(temperaturePicker, didSelectRow: defaultPickerRow, inComponent: 0)
        
//        temperaturePicker.reloadAllComponents()
    }
    
    //calculate saved row or choose default row
    func initialPickerRow() -> Int {
        if let savedRow = UserDefaults.standard.object(forKey: userDefaultsLastRowKey) as? Int{
            return savedRow
        }
        return temperaturePicker.numberOfRows(inComponent: 0) / 2
    }

    func saveSelectedRow(row: Int) {
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: userDefaultsLastRowKey)
        defaults.synchronize()
    }
    
    func displayConvertedTemperatureForRow(row: Int) {
        let celciusValue = temperatureRange.values[row]
        temperatureLabel.text = "\(unitConverter.degreesFarenheit(degreesCelcius: celciusValue))°F"
    }
    
}

extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(temperatureRange.values[row])°C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        displayConvertedTemperatureForRow(row: row)
        saveSelectedRow(row: row)
        
    }
    
}

