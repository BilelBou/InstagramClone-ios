//
//  LikedViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 25/04/2021.
//

import UIKit

class LikedViewController: UIViewController {
    
    private lazy var tableView = UITableView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let noNotificationsView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Activity"
        configureStyleAndLayout()
    }
    
    private func configureStyleAndLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

}

extension LikedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
