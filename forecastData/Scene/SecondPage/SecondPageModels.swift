//
//  SecondModels.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

enum SecondPageModels {

    struct Request {
        //debug
        //
        let city: String
    }
    
    struct Response {
        
        let data: ForcastModels.ForcastCity
    }
    
    struct ResponseFail {
        
        let error: String
    }
}
