//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 24/04/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {
    
    private lazy var feedTableView = UITableView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
        $0.register(FeedTableViewCell.self, forCellReuseIdentifier: FeedTableViewCell().identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotLogged()
    }
    
    private func handleNotLogged() {
        //Check auth
        if Auth.auth().currentUser == nil {
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: true, completion: nil)
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell().identifier, for: indexPath) as! FeedTableViewCell
        return cell
    }
}
