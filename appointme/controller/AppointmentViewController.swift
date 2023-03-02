//
//  AppointmentViewController.swift
//  appointme
//
//  Created by Daniel Alvarez on 3/2/23.
//

import UIKit

class AppointmentViewController: UIViewController {
    
    var business: business?
    var appointments = [appointment]()
    var selectedAppts = [appointment]()
    let dateFormatter = DateFormatter()
    
    @IBOutlet weak var calenderView: UIDatePicker!
    @IBOutlet weak var noneFoundLbl: UILabel!
    @IBOutlet weak var timeView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moveApptsSetToArray()
        selectApptsByDate(selectedDate: resetTimestamp(date: calenderView.date))
        
        timeView.delegate = self
        timeView.dataSource = self
    }
    
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        selectedAppts = []
        selectApptsByDate(selectedDate: resetTimestamp(date: calenderView.date))
        selectedAppts = selectedAppts.sorted(by: {$0.date!.compare($1.date!) == .orderedAscending})
        
        timeView.reloadData()
    }
    
    private func moveApptsSetToArray() {
        for appt in business!.appointment as! Set<appointment> {
            appointments.append(appt)
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
}

extension AppointmentViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedAppts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeView.dequeueReusableCell(withIdentifier: "apptTimeCell") as! ApptTimeCell
        let an_appointment = selectedAppts[indexPath.row]
        dateFormatter.dateFormat = "hh:mm"
        cell.timeLbl.text = dateFormatter.string(from: an_appointment.date!)
        
        return cell
    }
}
