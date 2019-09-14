//
//  HouseTableViewCell.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import UIKit
import SDWebImage


class HouseTableViewCell: UITableViewCell {

    @IBOutlet weak var img_houselist: UIImageView!
    @IBOutlet weak var lbl_price: UILabel!
    @IBOutlet weak var lbl_address: UILabel!
    @IBOutlet weak var lbl_sqft: UILabel!
    @IBOutlet weak var lbl_rooms: UILabel!
    @IBOutlet weak var view_houselistcell: UIView!
    @IBOutlet weak var view_pice: UIView!
    @IBOutlet weak var img_location: UIImageView!
    
    var delegate : HouseActionDelegate?

    
    
    var house: HouseVO? {
        didSet {
            if let house = house {
                
              //  let posterString = "https://image.tmdb.org/t/p/w500\(house.posterPath ?? "")"
                
                img_houselist.sd_setImage(with: URL(string: house.houseImageUrl ?? ""), placeholderImage: UIImage(named: "placeholder"))
                lbl_address.text = house.address ?? "West Minster, London"
                lbl_price.text = "$ \(house.price ?? "12,000")"
                lbl_sqft.text = house.squareFeet ?? "3200 sqft"
                lbl_rooms.text = "4 rooms"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        
        initGestureRecognizer()

        
        
        view_houselistcell.layer.cornerRadius = 10
        view_pice.layer.cornerRadius = 20
        img_location.layer.cornerRadius = img_location.frame.height/2
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initGestureRecognizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onclickViewDetail))
        img_houselist.isUserInteractionEnabled = true
        img_houselist.addGestureRecognizer(tapGesture)
    }
    
    @objc func onclickViewDetail(){
        delegate?.onHouseClick(objHouse: house ?? HouseVO())
    }
    
}
