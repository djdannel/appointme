//
//  business+CoreDataProperties.swift
//  appointme
//
//  Created by Daniel Alvarez on 2/20/23.
//
//

import Foundation
import CoreData


extension business {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<business> {
        return NSFetchRequest<business>(entityName: "Business")
    }

    @NSManaged public var address: String?
    @NSManaged public var business_id: String?
    @NSManaged public var business_name: String?
    @NSManaged public var password: String?
    @NSManaged public var phone: String?
    @NSManaged public var picture: Data?
    @NSManaged public var username: String?
    @NSManaged public var zip: String?
    @NSManaged public var appointment: NSSet?

}

// MARK: Generated accessors for appointment
extension business {

    @objc(addAppointmentObject:)
    @NSManaged public func addToAppointment(_ value: appointment)

    @objc(removeAppointmentObject:)
    @NSManaged public func removeFromAppointment(_ value: appointment)

    @objc(addAppointment:)
    @NSManaged public func addToAppointment(_ values: NSSet)

    @objc(removeAppointment:)
    @NSManaged public func removeFromAppointment(_ values: NSSet)

}

extension business : Identifiable {

}
