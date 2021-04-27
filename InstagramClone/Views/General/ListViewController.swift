//
//  ListViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

class ListViewController: UIViewController {

    private let data: [UserRelationship]
    private let tableHeight: CGFloat = 60.0
    
    private lazy var tableView = UITableView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = tableHeight
        $0.delegate = self
        $0.dataSource = self
        $0.register(UserFollowTableViewCell.self, forCellReuseIdentifier: UserFollowTableViewCell.identifier)
    }
    
    init(data: [UserRelationship]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }

    
    private func setup() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserFollowTableViewCell.identifier, for: indexPath) as! UserFollowTableViewCell
        cell.configure(with: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //Go to profile of selected cell
        let model = data[indexPath.row]
    }
}

extension ListViewController: UserFollowTableViewCellDelegate {
    func didTapFollowUnfollowButton(model: UserRelationship) {
        switch model.state {
        case .following:
            //unfollow from firebase
        break
        case .notFollowing:
            //follow from firebase
            break
        }
    }
}
