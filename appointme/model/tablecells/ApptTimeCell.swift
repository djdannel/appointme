//
//  ApptTimeCell.swift
//  appointme
//
//  Created by Daniel Alvarez on 3/2/23.
//

import UIKit

class ApptTimeCell: UITableViewCell {

    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var apptTimeView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
