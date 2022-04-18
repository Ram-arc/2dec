//
//  signupVC.swift
//  2dec
//
//  Created by Vamsi krishna on 02/12/21.
//

import UIKit

class signupVC: UIViewController {
    
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var countrySelect: UITextField!
    @IBOutlet weak var birthDay: UITextField!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var signUser: UITextField!
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    let datePicker = UIDatePicker()
    
    let pickerView = UIPickerView()
    
    let countries = ["india","germany","france","usa","italy"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        createPicker()
        
        viewPicker()
        
        
        
        
        
        
        
    }
    
    
    @IBAction func didTap(_ sender: Any) {
        
        
        
        navigationController?.popViewController(animated: true)
        
        
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
            self.present(alert, animated: true)
        }

    
    
        
        
        func isValidEmail(testStr:String) -> Bool {
                let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
                
                let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
                return emailTest.evaluate(with: testStr)
            }

    func isPhoneNumberValid(_ phoneNumber: String) -> Bool {
            let phoneRegex = "\\+?1?\\s?[2-9][0-9]{2}\\s?[2-9][0-9]{2}\\s?[0-9]{4}"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phoneNumber)
        }
        
        
    
    
    
    @IBAction func signTap(_ sender: Any) {
        
        let email = isValidEmail(testStr: signUser.text!)
       
        
        if email == true{

        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let home = story.instantiateViewController(identifier: "loginVC") as! loginVC
        
        UserDefaults.standard.setValue(signUser.text, forKey: "myKey")
        
        
        navigationController?.pushViewController(home, animated: true)
        }
        
        else{
            showAlert(title: "error", message: "email is not valid. please try again")
            
        }
        
        
        
        
    }
    
    func viewPicker(){
        
        
        
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        countrySelect.inputView = pickerView
        
        countrySelect.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(btncancel))
        toolbar.setItems([cancelBtn], animated: true)
        
        
        
    }
    
    
    
    func createPicker(){
        
        birthDay.textAlignment = .center
        
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(btnPress))
        
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(btncancel))
        toolbar.setItems([doneBtn,cancelBtn], animated: true)
        
        birthDay.inputAccessoryView = toolbar
        
        birthDay.inputView = datePicker
        
        datePicker.datePickerMode = .date
        
        
    }
    
    @objc func btnPress(){
        
        let formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        birthDay.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        
        
    }
    
    @objc func btncancel(){
        self.view.endEditing(true)
        
    }
    
}


extension signupVC : UIPickerViewDelegate , UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countrySelect.text = countries[row]
        countrySelect.resignFirstResponder()
    }
    
    
    
    
    
}
