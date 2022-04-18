//
//  homeVC.swift
//  2dec
//
//  Created by Vamsi krishna on 02/12/21.
//

import UIKit

class homeVC: UIViewController {
    
    var names = ["java","python","javascript","xcode","angular","reactjs"]
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(UINib(nibName: "animalCell", bundle: .main), forCellReuseIdentifier: "animalCell")
        
    }
    
    
    
    @IBAction func didTap(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
        
    }
    
}


extension homeVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 126
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "animalCell") as! animalCell
        
        let name = names[indexPath.row]
        
        cell.animalImage.image = UIImage(named: name)
        cell.titleLabel.text = name
        
        return cell
        
    }
    
    
    
    
    
}
