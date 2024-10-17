//
//  SettingsViewController.swift
//  SettingsUI
//
//  Created by gokul v on 21/04/24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var models = [Section]()
    
    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("This is Apple settings")
        print("IOS")

        title = "Settings"
        configure()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "house"), style: .done, target: self, action: nil)
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func configure() {
        
        models.append(Section(title: "General", options: [.switchCell(model: SettingSwitchOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemRed, isOn: true))
       ]))
        
        models.append(Section(title: "General", options: [.staticCell(model: SettingsOptions(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink) {
          }),
          .staticCell(model: SettingsOptions(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemBlue) {
          }),
          .staticCell(model: SettingsOptions(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen) {
          }),
          .staticCell(model: SettingsOptions(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange) {
          }),
       ]))
        
        models.append(Section(title: "Information", options: [.staticCell(model: SettingsOptions(title: "Battery", icon: UIImage(systemName: "battery.75"), iconBackgroundColor: .systemPink) {
          }),
          .staticCell(model: SettingsOptions(title: "Storage", icon: UIImage(systemName: "tropicalstorm"), iconBackgroundColor: .systemBlue) {
          }),
          .staticCell(model: SettingsOptions(title: "Updates", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .systemGreen) {
          }),
          .staticCell(model: SettingsOptions(title: "Security", icon: UIImage(systemName: "touchid"), iconBackgroundColor: .systemOrange) {
          }),
       ]))
        
        models.append(Section(title: "Apps", options: [.staticCell(model: SettingsOptions(title: "Safari", icon: UIImage(systemName: "safari"), iconBackgroundColor: .systemPink) {
          }),
          .staticCell(model: SettingsOptions(title: "News", icon: UIImage(systemName: "newspaper"), iconBackgroundColor: .systemBlue) {
          }),
          .staticCell(model: SettingsOptions(title: "Map", icon: UIImage(systemName: "map"), iconBackgroundColor: .systemGreen) {
          }),
          .staticCell(model: SettingsOptions(title: "Game Center", icon: UIImage(systemName: "gamecontroller"), iconBackgroundColor: .systemOrange) {
          }),
       ]))
    }
}
 
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case.staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else {return UITableViewCell()}
            cell.configure(with: model)
            return cell
            
        case.switchCell(let model):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {return UITableViewCell()}
            cell.configure(with: model)
            return cell
        }
    }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PageViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func mobileSettings() {
        print("Mobile")
    }
}
