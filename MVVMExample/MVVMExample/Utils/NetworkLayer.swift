//
//  NetworkLayer.swift
//  MVVMExample
//
//  Created by MOBILE MAC1 on 8/8/18.
//  Copyright © 2018 MOBILE MAC1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkLayer: NSObject {

  static func getRequest(urlString: URL?, Parameter:NSDictionary?, completion: @escaping (_ serverResponse: JSON?,_ error:NSError?)->()){
    
    // let parameters: Parameters = ["foo": "bar"]
    //let headers = ["Authorization": "123456"]
    Alamofire.request(urlString!, parameters:nil, headers: nil).responseJSON { response in
      
      if(response.result.value != nil){
        let serverResponse = JSON(response.result.value!)
        print("Array value is \(serverResponse.arrayValue)")
       
        completion(serverResponse, nil)
      }
      else{
        completion(nil, response.result.error as NSError?)
      }
    }
    
  }
}
