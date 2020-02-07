//
//  FirstPageForcastRouter.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

protocol FirstPageForcastRouterDataStore: class {
    var cityData: String { get }
}
protocol FirstPageForcastRouterDataDestination: class {
    
}

class FirstPageForcastRouter {
    
    private weak var dataStore: FirstPageForcastRouterDataStore?
    weak var dataDestination: FirstPageForcastRouterDataDestination?
    weak var viewController: FirstPageForcastViewController?
    
    init(viewController: FirstPageForcastViewController, dataSource: FirstPageForcastRouterDataStore, dataDestination: FirstPageForcastRouterDataDestination) {
        
        self.viewController = viewController
        self.dataStore = dataSource
        self.dataDestination = dataDestination
    }
    
    func navigateToNextScenes(scenes: String) {
        
        viewController?.performSegue(withIdentifier: scenes, sender: viewController)
    }
    
    func passDataToNextScene(for segue: UIStoryboardSegue) {
        
        guard let segueIdentifier = segue.identifier else {
            return
        }
        
        switch segueIdentifier {
        case SegueIdentifiers.secoundPage :
            
            passDataTosecoundPageScene(for: segue)
        default:
    
            return
        }
    }
    
    func passDataTosecoundPageScene(for segue: UIStoryboardSegue) {
        
        if let vc = segue.destination as? SecondPageViewController {
            vc.router?.dataDestination?.cityData = dataStore?.cityData ?? ""
        }
    }
    
    
}
