//
//  loginVC.swift
//  2dec
//
//  Created by Vamsi krishna on 02/12/21.
//

import UIKit

class loginVC: UIViewController {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var signupButton: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        user.text = UserDefaults.standard.object(forKey: "myKey") as? String
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTap(_ sender: Any) {
        
        
        check()
        
    }
    
    
    
    func check(){
        
        let checkUser = user.text ?? ""
        //let checkPassword = password.text
        
        if checkUser.isEmpty {
            
            
            
            let box = UIAlertController(title: "error", message: "wrong username or password", preferredStyle: .alert)
            
            box.addAction(UIAlertAction(title: "dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
            
            present(box, animated: true)
            
            return
           
            
            
        }
        
        else {
            
            
           
            
            
            let story = UIStoryboard.init(name: "Main", bundle: nil)
            let home = story.instantiateViewController(identifier: "homeVC") as! homeVC
            
            navigationController?.pushViewController(home, animated: true)
            
            
        }
        
        
        
        
        
    }
    
    
    
    @IBAction func signTap(_ sender: Any) {
        
        let story = UIStoryboard.init(name: "Main", bundle: nil)
        let sign = story.instantiateViewController(identifier: "signupVC") as! signupVC
        
        navigationController?.pushViewController(sign, animated: true)
        
        
        
    }
    
    
    
    
}
