//
//  SecondPageWorker.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SecondPageWorker {
    
    func test() {
        print("hello")
    }
    
    static func getDataForcast7DayAgo(provice: String, completion: @escaping(_ result: JSON, _ error: String) -> ()){
        print("get"+provice)
        let url = "\(BaseUrl.baseUrl)/forecast/daily?q=\(provice)&cnt=10\(BaseUrl.appId)"
        Alamofire.request(url).responseJSON { (response) in
            
            let statusCode = response.response?.statusCode ?? 0
            switch response.result {
            case .success(let result) :
                
                if statusCode == 200 {
                    
                    let json = JSON(result)
                    print(json)
                    completion(json, "")
                } else {
                    
                    completion("",response.error?.localizedDescription ?? "error_default_message")
                }
            case .failure(let error) :
                
                completion("",error.localizedDescription)
            }
        }
    }
}
