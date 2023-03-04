//
//  CustomerInfoViewController.swift
//  appointme
//
//  Created by Daniel Alvarez on 3/4/23.
//

import UIKit

class CustomerInfoViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var appointment: appointment!
    let timeFormatter = DateFormatter()
    let dayFormatter = DateFormatter()
    var apptTime = ""
    var apptDay = ""

    @IBOutlet weak var apptInfoLbl: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var reqsField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayApptInfo()
    }
    
    @IBAction func scheduleBtnPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Schedule Appointment", message: "Please make sure the information above is correct, then proceed.", preferredStyle: .actionSheet)
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view //to set the source of your alert
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
            popoverController.permittedArrowDirections = [] //to hide the arrow of any particular direction
        }

        let confirmAction = UIAlertAction (title: "Confirm", style: .default ) { [self] alertAction in
            setAppointment(createCustomer())
            // dismiss to homepage
            let home = self.view.window!.rootViewController
            home!.dismiss(animated: true, completion: nil)
            home!.present(createSuccessAlert(), animated: true, completion: nil)
        }

        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel ) {  alertAction in
            
        }

        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func createCustomer() -> customer {
        let theCustomer = customer(context: context)
        theCustomer.customer_id = SampleBusinesses.generateID()
        theCustomer.name = nameField.text
        theCustomer.phone = phoneField.text
        theCustomer.address = addressField.text
        
        return theCustomer
    }
    
    private func setAppointment(_ theCustomer: customer) {
        appointment.customer_id = theCustomer.customer_id
        appointment.customer = theCustomer
        appointment.requests = reqsField.text
        
        do { try context.save() } catch {}
    }
    
    private func createSuccessAlert() -> UIAlertController {
        let alert = UIAlertController(title: "Alert", message: "Success! Your appointment has been scheduled.", preferredStyle: .alert)
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = self.view //to set the source of your alert
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0) // you can set this as per your requirement.
            popoverController.permittedArrowDirections = [] //to hide the arrow of any particular direction
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { alertAction in }
        alert.addAction(okAction)
        
        return alert
    }
    
    private func displayApptInfo() {
        timeFormatter.dateFormat = "hh:mm a"
        dayFormatter.dateFormat = "MM/dd/yy"
        apptTime = timeFormatter.string(from: appointment.date!)
        apptDay = dayFormatter.string(from: appointment.date!)
        
        apptInfoLbl.text = "Appointment with \(appointment.business!.business_name!) at \(apptTime) on \(apptDay)"
    }
    
    
    
}
