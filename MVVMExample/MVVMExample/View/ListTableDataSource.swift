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
  var listViewModel = ListViewModel()
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //listViewModel = ListViewModel()
    print(listViewModel)
    if listViewModel.getCountOfUserList() > 0 {
      
      print(listViewModel.getCountOfUserList())
      return listViewModel.getCountOfUserList()
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell:UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell?)!
    //listViewModel = ListViewModel()
    user = listViewModel.getUserObjForIndex(index: indexPath.row)
    cell.textLabel?.text = user.name
    cell.detailTextLabel?.text = user.email
    return cell
  }
}
