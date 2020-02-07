//
//  SecoundPageViewController.swift
//  forecastData
//
//  Created by Sorasak on 12/16/19.
//  Copyright © 2019 Dol2oMo. All rights reserved.
//

import UIKit

protocol SecondPageViewControllerInput {
    
    func presentDataForcast7DayAgo(response: SecondPageModels.Response)
    func presentDataForcast7DayAgoFail(response: SecondPageModels.ResponseFail)
}

protocol SecondPageViewControllerOutput {
    
    func getDataForcast7DayAgo(request: SecondPageModels.Request)
}

class SecondPageViewController: UIViewController, SecondPageViewControllerInput {

    var output: SecondPageViewControllerOutput?
    var router: SecondPageRouter?
    var forcastData: ForcastModels.ForcastCity?
    @IBOutlet weak var myTableView: UITableView!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        SecondPageConfiguration.sharedInstant.configuration(viewController: self)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.getDataForcast()
        configurationCell()
        
    }
    
    func getDataForcast() {
        //debug
        //let request = SecondPageModels.Request()
        let request = SecondPageModels.Request(city: (self.router?.dataDestination!.cityData)!)
        output?.getDataForcast7DayAgo(request: request)
    }
    
    func presentDataForcast7DayAgo(response: SecondPageModels.Response) {
        forcastData = response.data
        myTableView.reloadData()
    }
    
    func presentDataForcast7DayAgoFail(response: SecondPageModels.ResponseFail) {
        
        let alert = UIAlertController(title: "Error", message: response.error, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension SecondPageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configurationCell() {
        myTableView.register(UINib(nibName: UiNib.forcastTableViewCell, bundle: nil), forCellReuseIdentifier: UiNib.forcastTableViewCell)
        //header
        myTableView.register(UINib(nibName: UiNib.textHeaderTableViewCell, bundle: nil), forHeaderFooterViewReuseIdentifier: UiNib.textHeaderTableViewCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let forcastData = self.forcastData {
            return forcastData.list.count
        } else {
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UiNib.forcastTableViewCell, for: indexPath)  as! ForcastTableViewCell
        if let forcastData = self.forcastData {
            
            cell.settingTextWith(data: forcastData.list[indexPath.row].weather[0], speed: forcastData.list[indexPath.row].speed)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: UiNib.textHeaderTableViewCell) as? TextHeaderTableViewCell else {

            return nil
        }

        if let forcastData = self.forcastData {
            //edit
            //headerCell.setData(data: "")
            headerCell.setData(data: forcastData.city.name)
        } else {

        }
        return headerCell
    }
}
