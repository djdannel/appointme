//
//  customer+CoreDataProperties.swift
//  appointme
//
//  Created by Daniel Alvarez on 3/4/23.
//
//

import Foundation
import CoreData


extension customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<customer> {
        return NSFetchRequest<customer>(entityName: "Customer")
    }

    @NSManaged public var address: String?
    @NSManaged public var customer_id: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var appointment: NSSet?

}

// MARK: Generated accessors for appointment
extension customer {

    @objc(addAppointmentObject:)
    @NSManaged public func addToAppointment(_ value: appointment)

    @objc(removeAppointmentObject:)
    @NSManaged public func removeFromAppointment(_ value: appointment)

    @objc(addAppointment:)
    @NSManaged public func addToAppointment(_ values: NSSet)

    @objc(removeAppointment:)
    @NSManaged public func removeFromAppointment(_ values: NSSet)

}

extension customer : Identifiable {

}
