# CountryCodeAutoComplete
AutoComplete textField for Country Code 
It is written in swift 4 and support `UITableView`

## Demo

Project containing Example for implemented it in `ViewController` and `UITableView`.
I used `IQKeyBoardManager` for working with scroll as well

### Examples
A step by step series of examples that tell you have to get a development env running

### For Normal View with name filter
![](https://raw.githubusercontent.com/insideApple/CountryCodeAutoComplete/master/Simulator%20Screen%20Shot%20-%20iPhone%207%20-%202018-02-21%20at%2017.48.59.png)

For `UIViewController`
You can put filter by by paasing `isFilterByName`

```
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
```

### For Normal View with country code filter
![](https://raw.githubusercontent.com/insideApple/CountryCodeAutoComplete/master/Simulator%20Screen%20Shot%20-%20iPhone%207%20-%202018-02-21%20at%2017.49.19.png)

```
        let dropDownTop = VPAutoComplete()
        dropDownTop.dataSource = countryArray
        dropDownTop.onTextField = topTextField // Your TextField
        dropDownTop.onView = self.view // ViewController's View
        //        dropDownTop.textFieldView = self.topTextField // If There is custom view you used for textfield
        dropDownTop.show { (str, index) in
            print("string : \(str) and Index : \(index)")
            let country : CountryModel = self.countryArray[index]
            self.topTextField.text = "\(String(describing: country.countryCode!)) \(String(describing: country.countryName!))"
        }
```
### For Normal View with country code filter
![](https://raw.githubusercontent.com/insideApple/CountryCodeAutoComplete/master/Simulator%20Screen%20Shot%20-%20iPhone%207%20-%202018-02-21%20at%2017.49.58.png)

For `UITableView`


```
        let dropDown = VPAutoComplete()
        dropDown.dataSource = countryArray
        dropDown.onTextField = textField // Your TextField
        dropDown.show(onTableView: self.tableView, atIndexPath: indexPath) { (str, index) in
            print("string : \(str) and Index : \(index)")
            let country : CountryModel = self.countryArray[index]
            textField.text = "\(String(describing: country.countryCode!)) \(String(describing: country.countryName!))"
        }
```

        
### Requirment

Xcode 9 and iOS 11.0
Code is written in swift 4


## Installation

Copy Source folder in Your project and Un-Zip `CountryResources` for getting Countries data and start using.
*Note*
If you not unzip `CountryResources`. It will be crash.

## Author
* **Vivek Padaya**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
