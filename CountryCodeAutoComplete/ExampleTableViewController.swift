//
//  ExampleTableViewController.swift
//  VPAutoComplete
//
//  Created by Vivek on 25/01/18.
//  Copyright © 2018 Vivek. All rights reserved.
//

import UIKit

class ExampleTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var countryArray : [CountryModel]!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        countryArray = [CountryModel]()
        setUpCountryArray()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView()
    }
    
    func setUpCountryArray(){
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension ExampleTableViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ExampleTableViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell")
        
        let textField = cell?.viewWithTag(101) as! UITextField
        textField.placeholder = "Cell \(indexPath.row)"
        textField.clearButtonMode = .whileEditing
        textField.keyboardType = UIKeyboardType.phonePad
        
        // Top TextField
        let dropDown = VPAutoComplete()
        dropDown.dataSource = countryArray
        dropDown.onTextField = textField // Your TextField
//                dropDownTop.textFieldView =  // If There is custom view you used for textfield
        dropDown.show(onTableView: self.tableView, atIndexPath: indexPath) { (str, index) in
            print("string : \(str) and Index : \(index)")
            let country : CountryModel = self.countryArray[index]
            textField.text = "\(String(describing: country.countryCode!)) \(String(describing: country.countryName!))"
        }
        
        
        return cell!
    }
    
}
