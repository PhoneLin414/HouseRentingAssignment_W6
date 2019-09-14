//
//  ViewController.swift
//  HouseRentingAssignment_W6
//
//  Created by SC414 on 9/14/19.
//  Copyright © 2019 phonelin. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {

    @IBOutlet weak var houseTableView: UITableView!
    @IBOutlet weak var viewSearch: UIView!
    
     var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        houseTableView.delegate = self
        houseTableView.dataSource = self
        
        viewSearch.layer.borderWidth = 1
        viewSearch.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        viewSearch.layer.cornerRadius = 10
        
        houseTableView.registerForCell(strID: String(describing: HouseTableViewCell.self))
        
         getHouseList()
        
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        houseTableView.addSubview(refreshControl)

        
    }

    @objc func onRefresh() {
        getHouseList()
    }
    
    private func getHouseList(){
        
        self.showProgress(message: "Loading")
        HouseModel.shared().apiGetHouseList(success: {
            self.hideProgress()
            self.refreshControl.endRefreshing()
            self.houseTableView.reloadData()
            
            
        }) {(err) in
            
            self.hideProgress()
            self.refreshControl.endRefreshing()
            print(err)
            
        }
        
    }

}


extension ViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HouseTableViewCell.self), for: indexPath) as! HouseTableViewCell
        cell.house = HouseModel.shared().houseRespone.data?[indexPath.row] ?? HouseVO()
//        cell.delegate = self
        
        return cell
    }
    
    
    
    
    
}


extension ViewController : UITableViewDelegate{
    
    
    
}

extension ViewController : NVActivityIndicatorViewable {
    
    func  showProgress(message : String) {
        startAnimating(CGSize(width: 30, height: 30), message: message, messageFont: nil, type: NVActivityIndicatorType.lineScale)
    }
    
    
    func hideProgress() {
        stopAnimating()
    }
    
}

extension ViewController : HouseActionDelegate{
    
    func onHouseClick(objHouse: HouseVO) {
        
        let storboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storboard.instantiateViewController(withIdentifier: String(describing: HouseDetailViewController.self)) as! HouseDetailViewController
        vc.house = objHouse
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
}
