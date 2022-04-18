//
//  animalCell.swift
//  2dec
//
//  Created by Vamsi krishna on 06/12/21.
//

import UIKit

class animalCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
