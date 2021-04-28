//
//  LikedViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 25/04/2021.
//

import UIKit

class LikedViewController: UIViewController {
    
    private var rowHeight: CGFloat = 60
    
    private lazy var tableView = UITableView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
        $0.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        $0.delegate = self
        $0.dataSource = self
        $0.isHidden = false
        $0.rowHeight = 60
    }
    
    private lazy var spinner = UIActivityIndicatorView(style: .large)..{
        $0.hidesWhenStopped = true
        $0.tintColor = .label
    }
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    private var models = [UserNotification]()

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNotifications()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Activity"
        view.addSubview(spinner)
        //spinner.startAnimating()
        view.addSubview(tableView)
        //configureStyleAndLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        spinner.center = view.center
    }
    
    private func addNoNotificationsView() {
        tableView.isHidden = true
        view.addSubview(tableView)
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.frame.width/2, height: view.frame.width/4)
        noNotificationsView.center = view.center
    }
    
    private func fetchNotifications() {
        for x in 0...100 {
            let post = UserPost(id: "", postType: .photo, thumbnailImage: URL(string: "https://google.com")!, postURL:  URL(string: "https://google.com")!, caption: nil, likeCount: [], comments: [], createdDate: Date(), taggedUsers: [])
            let model = UserNotification(type: x % 2 == 0 ?.like(post: post) : .follow(state: .following), text: "Hello World!", user: User(username: "Joe", name: (first: "", last: ""), birthDate: Date(), bio: "", gender: .male, counts: UserCount(followers: 1, following: 1, posts: 1), joinDate: Date(), profilePhoto: URL(string: "https://google.com")!))
            models.append(model)
        }
    }
    
//    private func configureStyleAndLayout() {
//        view.addSubview(noNotificationsView)
//        view.addSubview(tableView)
//        view.addSubview(spinner)
//        spinner.startAnimating()
//
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//    }

}

extension LikedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type {
        case .like(_):
            //like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identifier, for: indexPath) as! NotificationLikeEventTableViewCell
            cell.configure(with: model)
            cell.delegate = self
            return cell
        case .follow:
            //follpw cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier, for: indexPath) as! NotificationFollowEventTableViewCell
            cell.configure(with: model)
            cell.delegate = self
            return cell
        }
    }
}

extension LikedViewController: NotificationLikeEventTableViewCellDelegate {
    func didTapPostButton(model: UserNotification) {
        
        switch model.type {
        case .like(let post):
            let postVC = PostViewController(model: post)
            postVC.title = post.postType.rawValue
            postVC.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(postVC, animated: true)
        case .follow(_):
            fatalError("Dev Issue: Should never get called!")
        }
        //Open the post
    }
}

extension LikedViewController: NotificationFollowEventTableViewCellDelegate {
    func didTapFollowUnFollowButton(model: UserNotification) {
        // perform datebase update
        print("Tapped button")
    }
}
