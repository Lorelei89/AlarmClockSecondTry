//
//  FirstViewController.swift
//  AlarmClockSecondTry
//
//  Created by Sabina Buruiana on 3/23/17.
//  Copyright © 2017 Sabina Buruiana. All rights reserved.
//


import UIKit
import Alamofire


class FirstViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var alarms = [AlarmModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarButtons()
        setupBarsColor()
        registerAlarmCell()
        getDataFromApi()
    }

    //MARK: - Api Request
    func getDataFromApi () {
        guard let url = URL(string: apiUrlEndPoint) else {return}
        let headers: HTTPHeaders = [
            "x-token": "c2136c02-11f3-4357-bd87-2c2ce9ccbf18",
            "Accept": "application/json"
        ]
        Alamofire.request(url , headers: headers).responseJSON { [weak weakSelf = self] (response) in
            if let json = response.result.value as? [[String: AnyObject]] {
                weakSelf?.writeAlarmsToArray(json: json)
            }
        }
    }
    
    func writeAlarmsToArray (json: [[String: AnyObject]]) {
        for alarm in json {
            guard let id = alarm["id"] as? Int else {return}
            guard let hour = alarm["hour"] as? Int else {return}
            guard let minute = alarm["minutes"] as? Int else {return}
            guard let label = alarm["label"] as? String else {return}
            guard let enabled = alarm["enabled"] as? Bool else {return}
            guard let token = alarm["token"] as? String else {return}
            let alarmObject = AlarmModel(id:id, hour: hour, minutes: minute, label: label, enabled: enabled, token: token)
            self.alarms.append(alarmObject)
        }
    }
    
    
    // MARK: - Setup Bars
    func setupBarsColor () {
        self.navigationController?.navigationBar.barTintColor = barColor
        self.tabBarController?.tabBar.barTintColor = barColor
        self.tabBarController?.tabBar.tintColor = UIColor.orange
    }
    
    
    func setupNavigationBarButtons() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(FirstViewController.addButtonAction))
        addButton.tintColor = UIColor.orange
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    
    func addButtonAction () {
        let editButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector (FirstViewController.editButtonAction))
        editButton.tintColor = UIColor.orange
        self.navigationItem.leftBarButtonItem = editButton
        print("Press Add Button!")
    }
    
    func editButtonAction () {
        print("Press Edit Button!")
    }
    
    //MARK: - Register Cell
    func registerAlarmCell () {
        let nib = UINib(nibName: AlarmCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: AlarmCell.reuseIdentifier)
    }
    
}

// MARK: - TableView Data Source
extension FirstViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlarmCell.reuseIdentifier, for: indexPath) as! AlarmTableViewCell
        let alarmObject = alarms[indexPath.row]
        let hour =  String(alarmObject.hour)
        let minute = String(alarmObject.minutes)
        cell.timeLabel.text = hour + ":" + minute
        cell.alarmNameLabel.text = alarmObject.label
        cell.switchOutlet.setOn(alarmObject.enabled, animated: true)
        return cell
    }
}

// MARK: - TableView Delegate
extension FirstViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}



