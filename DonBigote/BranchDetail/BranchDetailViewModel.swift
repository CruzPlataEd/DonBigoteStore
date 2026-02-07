//
//  BranchDetailViewModel.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 24/01/26.
//

import Foundation
import CoreLocation

class BranchDetailViewModel {
    
    private let branch: DonBigotes.Branch
    
    var branchName: String { branch.name }
    var address: String { branch.address }
    var phone: String { branch.phone }
    var services: [String] { branch.services }
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: branch.location.latitude,
            longitude: branch.location.longitude
        )
    }
    
    var weekdaysHours: String {
        branch.openingHour.weekdays.close
    }
    
    var saturdayHours: String {
        branch.openingHour.saturday.close
    }
    
    var sundayHours: String {
        branch.openingHour.sunday?.close ?? "Cerrado"
    }
    
    var servicesFormatted: String {
        services.joined(separator: ", ")
    }
    
    init(branch: DonBigotes.Branch) {
        self.branch = branch
    }
}
