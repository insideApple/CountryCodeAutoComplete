//
//  ViewController.swift
//  CountryCodeAutoComplete
//
//  Created by Vivek on 21/02/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var topTextField: UITextField!
    @IBOutlet var midTextField: UITextField!
    @IBOutlet var bottomTextField: UITextField!
    var countryArray : [CountryModel]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        countryArray = [CountryModel]()
        setUpTextField()
    }

    func setUpTextField(){
        
        if let path = Bundle.main.path(forResource: "countrycode", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! NSDictionary
                
                if let jsonArray = jsonResult.object(forKey: "country_code") as? [NSDictionary] {
                    // do stuff
                    for dict in jsonArray{
                        let countryModel = CountryModel.init(dict: dict)
                        countryArray.append(countryModel!)
                    }
                }
            } catch {
                // handle error
            }
        }
        
        // Top TextField
        let dropDownTop = VPAutoComplete()
        dropDownTop.dataSource = countryArray
        dropDownTop.onTextField = topTextField // Your TextField
        dropDownTop.onView = self.view // ViewController's View
        dropDownTop.isFilterByName = true
        //        dropDownTop.textFieldView = self.topTextField // If There is custom view you used for textfield
        dropDownTop.show { (str, index) in
            print("string : \(str) and Index : \(index)")
            let country : CountryModel = self.countryArray[index]
            self.topTextField.text = "\(String(describing: country.countryCode!)) \(String(describing: country.countryName!))"
        }
        
        
        let dropDownMid = VPAutoComplete()
        dropDownMid.dataSource = countryArray
        dropDownMid.onTextField = midTextField // Your TextField
        dropDownMid.onView = self.view // ViewController's View
        dropDownMid.textFieldView = self.midTextField
        dropDownMid.show { (str, index) in
            print("string : \(str) and Index : \(index)")
            self.midTextField.text = str
        }
        
        let dropDownBottom = VPAutoComplete()
        dropDownBottom.dataSource = countryArray
        dropDownBottom.onTextField = bottomTextField // Your TextField
        dropDownBottom.onView = self.view // ViewController's View
        dropDownBottom.textFieldView = self.bottomTextField
        dropDownBottom.show { (str, index) in
            print("string : \(str) and Index : \(index)")
            self.bottomTextField.text = str
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

