//
//  appointment+CoreDataProperties.swift
//  appointme
//
//  Created by Daniel Alvarez on 2/20/23.
//
//

import Foundation
import CoreData


extension appointment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<appointment> {
        return NSFetchRequest<appointment>(entityName: "Appointment")
    }

    @NSManaged public var appt_date: Date?
    @NSManaged public var appt_id: String?
    @NSManaged public var business_id: String?
    @NSManaged public var customer_id: String?
    @NSManaged public var requests: String?
    @NSManaged public var business: business?
    @NSManaged public var customer: customer?

}

extension appointment : Identifiable {

}
