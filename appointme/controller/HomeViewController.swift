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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var businesses = [business]().self
    var filterData: [business]!
    var businessIdxPath = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        businessView.delegate = self
        businessView.dataSource = self
        businessView.separatorStyle = .none
        
        searchBar.backgroundImage = UIImage()
        
        SampleBusinesses.createSampleBusinesses()
        getBusinesses()
    }
    
    private func getBusinesses() {
        do {
            businesses = try context.fetch(business.fetchRequest())
            businesses.sort(by: {$0.rating > $1.rating})
            filterData = businesses
            businessView.reloadData()
        }
        catch {}
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBusinessView" {
            let businessVC = segue.destination as! BusinessViewController
            businessVC.business = businesses[businessIdxPath]
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        businessIdxPath = indexPath.row
        self.performSegue(withIdentifier: "goToBusinessView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = businessView.dequeueReusableCell(withIdentifier: "businessCell") as! BusinessCell
        let a_business = filterData[indexPath.row]
        cell.businessImg.image = UIImage(data: a_business.picture!)
        cell.businessLbl.text = a_business.business_name
        cell.businessCatImg.image = SampleBusinesses.determineCategoryImage(category: a_business.service!)
        cell.businessLocLbl.text = a_business.city! + ", " + a_business.state!
        cell.businessRtgLbl.text = String(a_business.rating)
        
        return cell
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterData = []
        if searchText == "" { filterData = businesses }
        for business in businesses {
            if business.business_name!.lowercased().contains(searchText.lowercased()) {
                filterData.append(business)
            }
        }
        self.businessView.reloadData()
    }
}
