//
//  SampleBusinesses.swift
//  appointme
//
//  Created by Daniel Alvarez on 2/20/23.
//

import Foundation
import UIKit

class SampleBusinesses {
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let business1 = business(context: context)
    static let business2 = business(context: context)
    static let business3 = business(context: context)
    static let appointment1 = appointment(context: context)
    static let appointment2 = appointment(context: context)
    static let appointment3 = appointment(context: context)
    static let appointment4 = appointment(context: context)
    static let appointment5 = appointment(context: context)
    static let appointment6 = appointment(context: context)
    static let dateFormatter = DateFormatter()
    static let timeFormatter = DateFormatter()
    
    static func createSampleBusinesses() {
        dateFormatter.dateFormat = "MM/dd/yy HH:mm:ss"
        business1.business_id = generateID()
        business1.service = "pet"
        business1.picture = UIImage(named: "grooming")!.pngData()
        business1.business_name = "Martha's Pet Grooming"
        business1.address = "123 8th Street"
        business1.phone = "123-456-7890"
        business1.city = "Miami"
        business1.state = "FL"
        business1.desc = "This is the description for Martha's Pet Grooming. We do a lot of pet grooming stuff for all types of doggos and puppers!"
        business1.rating = 5.0
        
        appointment1.appt_id = generateID()
        appointment1.date = dateFormatter.date(from: "03/05/2023 11:00:00")
        appointment1.business_id = business1.business_id
        appointment1.at_cust_home = false
        appointment1.business = business1
        
        appointment2.appt_id = generateID()
        appointment2.date = dateFormatter.date(from: "03/05/2023 14:00:00")
        appointment2.business_id = business1.business_id
        appointment2.at_cust_home = false
        appointment2.business = business1
        
        appointment3.appt_id = generateID()
        appointment3.date = dateFormatter.date(from: "03/05/2023 17:00:00")
        appointment3.business_id = business1.business_id
        appointment3.at_cust_home = false
        appointment3.business = business1
        
        business1.addToAppointment(NSSet(objects: appointment1, appointment2, appointment3))
        
        business2.business_id = generateID()
        business2.service = "house"
        business2.picture = UIImage(named: "plumbing")!.pngData()
        business2.business_name = "Frank's Fast Plumbing"
        business2.address = "On-the-go"
        business2.phone = "(123)-456-7890"
        business2.city = "Homestead"
        business2.state = "FL"
        business2.desc = "This is the description for Frank's Fast Plumbing. If you have a leak, a clog, or anything wrong with your home plumbing, Frank's Fast Plumbing is here for you!"
        business2.rating = 4.8
        
        appointment4.appt_id = generateID()
        appointment4.date = dateFormatter.date(from: "03/05/2023 14:30:00")
        appointment4.business_id = business2.business_id
        appointment4.at_cust_home = false
        appointment4.business = business2
        
        business2.addToAppointment(NSSet(objects: appointment4, appointment5, appointment6))
        
        business3.business_id = generateID()
        business3.service = "house"
        business3.picture = UIImage(named: "roofing")!.pngData()
        business3.business_name = "Roger's Roofing"
        business3.address = "On-the-go"
        business3.phone = "(123)-456-7890"
        business3.city = "Hialeah"
        business3.state = "FL"
        business3.desc = "This is the description for Roger's Roofing. Want to install solar panels? Redo your roof? I'm the man!"
        business3.rating = 4.9
        
        
        do { try context.save() } catch {}
    }
    
    static func deleteSampleBusinesses() {
        context.delete(business1)
        context.delete(business2)
        context.delete(business3)
        
        do { try context.save() } catch {}
    }
    
    static func determineCategoryImage(category: String) -> UIImage {
        var image = UIImage()
        switch category {
        case "pet":
            image = UIImage(named: "pet")!
            break
        case "house":
            image = UIImage(named: "house")!
            break
        default:
            image = UIImage(named: "placeholder")!
        }
        return image
    }
    
    static func generateID() -> String {
        var number = String()
        for _ in 1...6 {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }

}
