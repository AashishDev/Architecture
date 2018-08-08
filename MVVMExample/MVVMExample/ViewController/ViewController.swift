//
//  ViewController.swift
//  MVVMExample
//
//  Created by MOBILE MAC1 on 8/8/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var ListTable: UITableView!
  private let tableDataSource = ListTableDataSource()
  var tableDataArray:NSMutableArray = []
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    configureListingTable()
  }
  
  //MARK: Table Configuration Method **********************
  func configureListingTable(){
    
    ListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    ListTable.dataSource = tableDataSource
    ListTable.delegate = tableDataSource
    ListTable.reloadData()
  }
  
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}

