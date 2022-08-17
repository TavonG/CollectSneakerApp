//
//  ViewController.swift
//  CollectSneakerApp
//
//  Created by Tavon Gibbs on 8/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x:0, y:0, width: 300, height:70))
        button.setTitle("Present", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let splitVC = UISplitViewController(style: .doubleColumn)
        
        let secondVC = UIViewController()
        secondVC.title = "home"
        secondVC.view.backgroundColor = .systemBlue
        
        splitVC.viewControllers = [
            UINavigationController(rootViewController: MenuController(style: .plain)),
            UINavigationController(rootViewController: secondVC)
            
        ]
        
        present(splitVC, animated: true)
    }
    
}

class MenuController: UITableViewController {
    
    override init(style: UITableView.Style) {
        super.init(style: style)
        title = "Menu"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Option \(indexPath.row)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

