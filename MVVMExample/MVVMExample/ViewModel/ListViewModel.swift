//
//  ListViewModel.swift
//  MVVMExample
//
//  Created by MOBILE MAC1 on 8/8/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit
import SwiftyJSON

let usersAPIUrl = "https://jsonplaceholder.typicode.com/users"


//1 Custom Delegate for View Model Data interaction
protocol ListViewModeldelegate {
  func sendResponse(responseObject:JSON)
  func sendError(errorMessage:NSError)
}

class ListViewModel: NSObject {

  var user: UserModel!
  var dataArray:NSMutableArray = []
  var listViewModelDelegate:ListViewModeldelegate?
  
  func getUserList(){
    
    let url = NSURL(string: usersAPIUrl)
    NetworkLayer.getRequest(urlString: url! as URL, Parameter: nil) { (response, error) in
     
      if error == nil {
        
        self.dataArray = self.parseDataIntoUserModel(response: response!)
        self.listViewModelDelegate?.sendResponse(responseObject: response!)
      }
      else{
        
        self.listViewModelDelegate?.sendError(errorMessage: error!)
      }
    }
    
  }
  
  
  //2 User Defind Method
  func parseDataIntoUserModel(response:JSON) -> NSMutableArray {
    
    let responseArray:NSMutableArray = []
    for index in 0..<response.arrayValue.count {
      
      user = UserModel()
      user.name = response[index]["name"].string
      responseArray.add(user)
    }
    return responseArray;
  }
  
  func getUserObjForIndex(index: Int) -> UserModel {
    
    var userObj = UserModel()
    userObj = self.dataArray[index] as! UserModel
    return userObj
  }
  
  func getCountOfUserList() -> Int {
    return self.dataArray.count
  }
  
}


