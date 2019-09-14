//
//  HouseResponse.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import Foundation

struct HouseResponse: Codable {
    var code: Int?
    var message: String?
    var data: [HouseVO]?
}
