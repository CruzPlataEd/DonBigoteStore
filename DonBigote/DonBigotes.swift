//
//  DonBigotes.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 23/01/26.
//

import Foundation

struct DonBigotes: Codable {
    struct OpenClose: Codable {
        let open: String
        let close: String
    }
    
    struct OpeningHour: Codable {
        let weekdays: OpenClose
        let saturday: OpenClose
        let sunday: OpenClose?
    }
    
    struct BranchLocation: Codable {
        let latitude: Double
        let longitude: Double
    }
    
    struct Branch: Codable {
        let id: Int
        let name: String
        let address: String
        let phone: String
        let openingHour: OpeningHour
        let location: BranchLocation
        let services: [String]
        
        private enum CodingKeys: String, CodingKey {
            case id
            case name
            case address
            case phone
            case openingHour = "opening_hours"
            case location
            case services
        }
    }
    struct Store: Codable {
        let name: String
        let slogan: String
        let description: String
        let logo: String
        let branches: [Branch]
        
        private enum CodingKeys: String, CodingKey {
            case name
            case slogan
            case description
            case logo = "logo_url"
            case branches
        }
    }
    let store: Store
    
    
}
