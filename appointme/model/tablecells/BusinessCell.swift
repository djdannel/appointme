//
//  BusinessCell.swift
//  appointme
//
//  Created by Daniel Alvarez on 2/20/23.
//

import UIKit

class BusinessCell: UITableViewCell {

    @IBOutlet weak var businessView: UIView!
    @IBOutlet weak var businessImg: UIImageView!
    @IBOutlet weak var businessCatImg: UIImageView!
    @IBOutlet weak var businessLbl: UILabel!
    @IBOutlet weak var businessLocLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
