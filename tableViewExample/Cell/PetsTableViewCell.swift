//
//  PetsTableViewCell.swift
//  tableViewExample
//
//  Created by Marcelo Garcia on 17/02/22.
//

import UIKit

class PetsTableViewCell: UITableViewCell {
    @IBOutlet weak var imageCat: UIImageView!
    @IBOutlet weak var labelCat: UILabel!
    @IBOutlet weak var viewCat: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageCat.roundImage()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
