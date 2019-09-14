//
//  houseModel.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import Foundation

class HouseModel{
    
    class func shared() -> HouseModel{
        
        return sharedHouseModel
        
    }
    
    private static var sharedHouseModel : HouseModel = {
        
        let houseModel = HouseModel()
        
        return houseModel
        
    }()
    
    var houseRespone : HouseResponse = HouseResponse()
    
    func apiGetHouseList(success : @escaping () -> Void, failure : @escaping (String) -> Void){
        
        NetworkClient.shared().getData(success: {(data) in
            guard let data = data as? Data else {return}
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self.houseRespone = try
                    decoder.decode(HouseResponse.self, from: data)
                success()
                
            }catch let jsonError {
                
                failure(jsonError.localizedDescription)
                
            }
            
        }){(err) in
            
            
            
        }
        
    }
    
}
