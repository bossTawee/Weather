//
//  FirstPageForcastConfiguration.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

extension FirstPageForcastViewController: FirstPageForcastInteractorOutput {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        router?.passDataToNextScene(for: segue)
    }
}

extension FirstPageForcastInteractor: FirstPageForcastViewControllerOutput,
FirstPageForcastRouterDataDestination, FirstPageForcastRouterDataStore {}

class FirstPageForcastConfiguration {

    static let sharedInstant = FirstPageForcastConfiguration()
    
    func configuration(viewController: FirstPageForcastViewController) {
        
        let interator = FirstPageForcastInteractor()
        interator.output = viewController
        let router = FirstPageForcastRouter(viewController: viewController, dataSource: interator, dataDestination: interator)
        viewController.output = interator
        viewController.router = router
    }
    
}
