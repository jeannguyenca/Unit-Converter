//
//  TemperatureRange.swift
//  Unit Converter
//
//  Created by Truong Huong Giang Nguyen on 1/21/19.
//  Copyright © 2019 Jean Nguyen. All rights reserved.
//

import UIKit
import Foundation


class TemperatureRange: NSObject, UIPickerViewDataSource {
    let values = (-100...100).map { $0 } //$0: closure --> need check on this

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
}
