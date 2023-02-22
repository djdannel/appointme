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
    
    static func createSampleBusinesses() {
        business1.business_id = generateID()
        business1.service = "grooming"
        business1.picture = UIImage(named: "grooming")!.pngData()
        business1.business_name = "Martha's Pet Grooming"
        business1.address = "123 8th Street"
        business1.phone = "123-456-7890"
        business1.city = "Miami"
        business1.state = "FL"
        business1.desc = "This is the description for Martha's Pet Grooming. We do a lot of pet grooming stuff for all types of doggos and puppers!"
        business1.rating = 5.0
        
        business2.business_id = generateID()
        business2.service = "plumbing"
        business2.picture = UIImage(named: "plumbing")!.pngData()
        business2.business_name = "Frank's Fast Plumbing"
        business2.address = "Vehicle-based"
        business2.phone = "(123)-456-7890"
        business2.city = "Homestead"
        business2.state = "FL"
        business2.desc = "This is the description for Frank's Fast Plumbing. If you have a leak, a clog, or anything wrong with your home plumbing, Frank's Fast Plumbing is here for you!"
        business2.rating = 4.8
        
        business3.business_id = generateID()
        business3.service = "roofing"
        business3.picture = UIImage(named: "roofing")!.pngData()
        business3.business_name = "Roger's Roofing"
        business3.address = "Vehicle-based"
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
    
    private static func generateID() -> String {
        var number = String()
        for _ in 1...6 {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }

}
