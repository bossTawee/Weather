//
//  SecondPageConfiguration.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

extension SecondPageViewController: SecondPageInteratorOuput {}

extension SecondPageInterator: SecondPageViewControllerOutput, SecondPageRouterDataDestintion, SecondPageRouterDataStore {}

class SecondPageConfiguration {

    static let sharedInstant = SecondPageConfiguration()
    
    func configuration(viewController: SecondPageViewController) {
        
        let interator = SecondPageInterator()
        interator.output = viewController
        let router = SecondPageRouter(viewController: viewController, dataSource: interator, dataDestination: interator)
        viewController.output = interator
        viewController.router = router
    }
}
