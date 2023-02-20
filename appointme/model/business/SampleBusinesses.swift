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
        business1.picture = UIImage(named: "placeholder")!.pngData()
        business1.business_name = "Business 1"
        
        business2.business_id = generateID()
        business2.picture = UIImage(named: "placeholder")!.pngData()
        business2.business_name = "Business 2"
        
        business3.business_id = generateID()
        business3.picture = UIImage(named: "placeholder")!.pngData()
        business3.business_name = "Business 3"
        
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
