//
//  ListTableDataSource.swift
//  MVVMExample
//
//  Created by MOBILE MAC1 on 8/8/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit

class ListTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {

  var user: UserModel!
  
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?)!
    //user = myViewModelObj.getInvoiceObjectForIndex(indexPath.row)
   // cell.textLabel?.text = user.name
  //  cell.detailTextLabel?.text = user.email
    cell.textLabel?.text = "Test"
    return cell
  }
}
