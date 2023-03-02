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
    @IBOutlet weak var businessCatImg: UIImageView!
    @IBOutlet weak var businessDescView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBusinessData()
    }
    
    private func loadBusinessData() {
        businessImg.image = UIImage(data: (business?.picture!)!)
        businessNameLbl.text = business?.business_name
        businessAdrLbl.text = (business?.address)!
        businessPhoneLbl.text = "Phone: " + (business?.phone)!
        businessCatImg.image = SampleBusinesses.determineCategoryImage(category: business!.service!)
        businessDescView.text = business!.desc
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSetAppt" {
            let apptVC = segue.destination as! AppointmentViewController
            apptVC.business = business
        }
    }
}
