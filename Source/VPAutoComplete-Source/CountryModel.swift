//
//  CountryModel.swift
//  ItemBI
//
//  Created by Vivek on 10/02/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

class CountryModel: NSObject {
    
    open var countryCode: String?
    open var countryName: String?
    
    open var capital : String?
    open var internetCode: String?
    open var flagIcon: String?
    
    public init?(dict : NSDictionary) {
        
        countryCode = dict.object(forKey: "CountryCode") as? String
        countryName = dict.object(forKey: "CountryName") as? String
        capital = dict.object(forKey: "Capital") as? String
        internetCode = dict.object(forKey: "InternetCode") as? String
        flagIcon = "\(internetCode!.uppercased())-128.png"
    }

    
    
}
