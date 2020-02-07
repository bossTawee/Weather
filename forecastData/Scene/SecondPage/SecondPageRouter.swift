//
//  SecondPageRouter.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

protocol SecondPageRouterDataStore: class {
    
}

protocol SecondPageRouterDataDestintion: class {
    var cityData: String { get set }
}

class SecondPageRouter {
    
    private weak var dataStore: SecondPageRouterDataStore?
    weak var dataDestination: SecondPageRouterDataDestintion?
    weak var viewController: SecondPageViewController?

    init(viewController: SecondPageViewController,
         dataSource: SecondPageRouterDataStore,
         dataDestination: SecondPageRouterDataDestintion) {
        
        self.viewController = viewController
        self.dataStore = dataSource
        self.dataDestination = dataDestination
    }
    
}
