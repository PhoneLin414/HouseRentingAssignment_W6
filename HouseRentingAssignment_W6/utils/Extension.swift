//
//  Extension.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import Foundation
import UIKit

extension UITableView{
    func registerForCell(strID: String) {
        register(UINib(nibName: strID, bundle: nil), forCellReuseIdentifier: strID)
    }
}
