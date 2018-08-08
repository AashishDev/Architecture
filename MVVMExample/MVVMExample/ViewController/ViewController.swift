//
//  ViewController.swift
//  MVVMExample
//
//  Created by MOBILE MAC1 on 8/8/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, ListViewModeldelegate {

  @IBOutlet var listTable: UITableView!
  private let tableDataSource = ListTableDataSource()
  var tableDataArray:NSMutableArray = []
  
  //ViewModel Intialization
  var listViewModel: ListViewModel!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    listViewModel = ListViewModel()
    listViewModel.listViewModelDelegate = self
    listViewModel.getUserList()
  }
  
  //MARK: Table Configuration Method **********************
  func configureListingTable(){
    
    listTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    tableDataSource.listViewModel = listViewModel
    listTable.dataSource = tableDataSource
    listTable.delegate = tableDataSource
  }
  
  
  //2 ListViewModel Delegate Method
  func sendResponse(responseObject:JSON) {

    if listViewModel.getCountOfUserList() > 0 {
     
      configureListingTable()
      DispatchQueue.main.async {
        self.listTable.reloadData()
      }
      
    }
  }
  
  func sendError(errorMessage:NSError) {
    
    print("Error is \(errorMessage.localizedDescription)")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

