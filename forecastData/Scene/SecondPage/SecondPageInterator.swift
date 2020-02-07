//
//  SecondPageInterator.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

protocol SecondPageInteratorOuput {
    
    func presentDataForcast7DayAgo(response: SecondPageModels.Response)
    func presentDataForcast7DayAgoFail(response: SecondPageModels.ResponseFail)
}

protocol SecondPageInteratorInput {
    
    func getDataForcast7DayAgo(request: SecondPageModels.Request)
}

protocol SecondPageInteratorDataStore {
    
}

protocol SecondPageInteratorDataDestination {
    
    var cityData: String { get set }
}


class SecondPageInterator: SecondPageInteratorInput,
SecondPageInteratorDataStore, SecondPageInteratorDataDestination {

    var output: SecondPageInteratorOuput?
    var cityData: String = ""
    var worker: SecondPageWorker?
    
    func getDataForcast7DayAgo(request: SecondPageModels.Request) {
        //debug
        cityData = request.city
        if cityData == "Hua Hin" {
             cityData = "Hua%20Hin"
        }
        SecondPageWorker.getDataForcast7DayAgo(provice: cityData) { (result, error) in
            if error == "" {
                print("data: \(result)")
                let data = ForcastModels.ForcastCity.deserialize(data: result)
                let response = SecondPageModels.Response(data: data)
                self.output?.presentDataForcast7DayAgo(response: response)
                return
            }
            print("error: \(error)")
            let response = SecondPageModels.ResponseFail(error: error)
            self.output?.presentDataForcast7DayAgoFail(response: response)
        }
    }
}
