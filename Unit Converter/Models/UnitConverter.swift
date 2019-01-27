//
//  UnitConverter.swift
//  Unit Converter
//
//  Created by Truong Huong Giang Nguyen on 1/21/19.
//  Copyright © 2019 Jean Nguyen. All rights reserved.
//

import Foundation

class UnitConverter {
    func degreesFarenheit(degreesCelcius: Int) -> Int {
        return Int(1.8 * Float(degreesCelcius) + 32.0)
    }
    func degreesCelcius(degreesFarenheit: Int) -> Int {
        return Int((Float(degreesFarenheit) - 32.0) * 5.0/9.0)
    }
}
