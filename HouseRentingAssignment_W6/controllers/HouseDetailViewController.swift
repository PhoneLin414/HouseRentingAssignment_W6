//
//  HouseDetailViewController.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {
    
    
    @IBOutlet weak var btn_location: UIImageView!
    @IBOutlet weak var btnBookNow: UIButton!
    @IBOutlet weak var btnAddFavourite: UIButton!
    
    var house: HouseVO?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnAddFavourite.layer.cornerRadius = 5
        btnBookNow.layer.cornerRadius = 5
        
         btn_location.layer.cornerRadius = btn_location.frame.height/2

    }
  

}
