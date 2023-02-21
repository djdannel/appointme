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
        
        business2.business_id = generateID()
        business2.service = "plumbing"
        business2.picture = UIImage(named: "plumbing")!.pngData()
        business2.business_name = "Frank's Fast Plumbing"
        business2.address = "Vehicle-based"
        business2.phone = "(123)-456-7890"
        
        business3.business_id = generateID()
        business3.service = "roofing"
        business3.picture = UIImage(named: "roofing")!.pngData()
        business3.business_name = "Tony's Top Roofing"
        business3.address = "123 8th Street"
        business3.phone = "123-456-7890"
        
        do { try context.save() } catch {}
    }
    
    static func deleteSampleBusinesses() {
        context.delete(business1)
        context.delete(business2)
        context.delete(business3)
        
        do { try context.save() } catch {}
    }
    
    private static func generateID() -> String {
        var number = String()
        for _ in 1...6 {
            number += "\(Int.random(in: 1...9))"
        }
        return number
    }
}
