//
//  appointment+CoreDataProperties.swift
//  appointme
//
//  Created by Daniel Alvarez on 3/2/23.
//
//

import Foundation
import CoreData


extension appointment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<appointment> {
        return NSFetchRequest<appointment>(entityName: "Appointment")
    }

    @NSManaged public var appt_id: String?
    @NSManaged public var at_cust_home: Bool
    @NSManaged public var business_id: String?
    @NSManaged public var customer_id: String?
    @NSManaged public var date: Date?
    @NSManaged public var requests: String?
    @NSManaged public var business: business?
    @NSManaged public var customer: customer?

}

extension appointment : Identifiable {

}
