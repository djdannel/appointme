//
//  AppointmentViewController.swift
//  appointme
//
//  Created by Daniel Alvarez on 3/2/23.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    var business: business?
    var apptIdxPath: Int!
    var appointments = [appointment]()
    var selectedAppts = [appointment]()
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var calenderView: UIDatePicker!
    @IBOutlet weak var noneFoundLbl: UILabel!
    @IBOutlet weak var businessNameLbl: UILabel!
    @IBOutlet weak var timeView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveApptsSetToArray()
        selectApptsByDate(selectedDate: resetTimestamp(date: calenderView.date))
        
        businessNameLbl.text = business!.business_name
        timeView.delegate = self
        timeView.dataSource = self
    }
    
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        selectedAppts = []
        selectApptsByDate(selectedDate: resetTimestamp(date: calenderView.date))
        selectedAppts = selectedAppts.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending})
        
        timeView.reloadData()
    }
    
    @IBAction func dismissModal(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func moveApptsSetToArray() {
        for appt in business!.appointment as! Set<appointment> {
            if (appt.customer_id == "" && appt.date! > Date()) {
                appointments.append(appt)
            }
        }
        appointments = appointments.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending})
    }
    
    private func selectApptsByDate(selectedDate: Date) -> Void {
        var apptDateModified: Date
        var flag = 0
        for appt in appointments {
            apptDateModified = resetTimestamp(date: appt.date!)
            if (apptDateModified == selectedDate) {
                selectedAppts.append(appt)
                flag = 1
            }
        }
        if (flag == 0) { noneFoundLbl.isHidden = false } else { noneFoundLbl.isHidden = true }
    }
    
    private func resetTimestamp(date: Date) -> Date {
        return Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: date)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCustInfo" {
            let custInfoVC = segue.destination as! CustomerInfoViewController
            custInfoVC.appointment = selectedAppts[apptIdxPath]
        }
    }
}

extension AppointmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedAppts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        apptIdxPath = indexPath.row
        self.performSegue(withIdentifier: "goToCustInfo", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeView.dequeueReusableCell(withIdentifier: "apptTimeCell") as! ApptTimeCell
        
        let an_appointment = selectedAppts[indexPath.row]
        dateFormatter.dateFormat = "hh:mm a"
        cell.timeLbl.text = dateFormatter.string(from: an_appointment.date!)
        
        cell.apptTimeView.layer.cornerRadius = 10
        
        return cell
    }
}
