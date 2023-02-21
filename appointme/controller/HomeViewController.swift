//
//  HomeViewController.swift
//  appointme
//
//  Created by Daniel Alvarez on 2/20/23.
//

import UIKit

class HomeViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var businessView: UITableView!
     
    var businesses = [business]().self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        businessView.delegate = self
        businessView.dataSource = self
        businessView.separatorStyle = .none
        
        SampleBusinesses.createSampleBusinesses()
        getBusinesses()
    }
    
    private func getBusinesses() {
        do {
            businesses = try context.fetch(business.fetchRequest())
            businessView.reloadData()
        }
        catch {}
    }
    
    private func determineCategoryImage(category: String) -> UIImage {
        var image = UIImage()
        switch category {
        case "grooming":
            image = UIImage(named: "dog")!
            break
        case "plumbing":
            image = UIImage(named: "pipe")!
            break
        case "roofing":
            image = UIImage(named: "roof")!
            break
        default:
            image = UIImage(named: "placeholder")!
        }
        return image
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return businesses.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessView.dequeueReusableCell(withIdentifier: "businessCell") as! BusinessCell
        let a_business = businesses[indexPath.row]
        cell.businessImg.image = UIImage(data: a_business.picture!)
        cell.businessLbl.text = a_business.business_name
        cell.businessCatImg.image = determineCategoryImage(category: a_business.service!)
        
        return cell
    }
}
