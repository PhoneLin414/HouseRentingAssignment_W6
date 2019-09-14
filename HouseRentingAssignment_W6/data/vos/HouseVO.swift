//
//  HouseVO.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import Foundation

struct HouseVO: Codable {
    var id: Double?
    var name : String?
    var houseImageUrl: String?
    var description: String?
    var price: String?
    var address : String?
    var squareFeet : String?
    var latitude : Double?
    var longtitude: Double?
}
