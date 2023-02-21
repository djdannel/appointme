//
//  BusinessViewController.swift
//  appointme
//
//  Created by Daniel Alvarez on 2/20/23.
//

import UIKit

class BusinessViewController: UIViewController {

    var business: business?
    
    @IBOutlet weak var businessImg: UIImageView!
    @IBOutlet weak var businessNameLbl: UILabel!
    @IBOutlet weak var businessAdrLbl: UILabel!
    @IBOutlet weak var businessPhoneLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBusinessData()
    }
    
    private func loadBusinessData() {
        businessImg.image = UIImage(data: (business?.picture!)!)
        businessNameLbl.text = business?.business_name
        businessAdrLbl.text = (business?.address)!
        businessPhoneLbl.text = "Phone: " + (business?.phone)!
    }

}
