//
//  FirstPageForcastInteractor.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

protocol FirstPageForcastInteractorInput {
    
    func settingDataToSecondPage(city: String)
}
protocol FirstPageForcastInteractorOutput {
    
}
protocol FirstPageForcastInteractorDataDestination {
    
}
protocol FirstPageForcastInteractorDataStore {
    
    var cityData: String { get }
}

class FirstPageForcastInteractor: FirstPageForcastInteractorInput,
FirstPageForcastInteractorDataStore, FirstPageForcastInteractorDataDestination {

    var output: FirstPageForcastInteractorOutput?
    var cityData: String = ""
    
    func settingDataToSecondPage(city: String) {
        
        cityData = city
    }
    
}
