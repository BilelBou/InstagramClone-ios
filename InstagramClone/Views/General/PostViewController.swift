//
//  PostViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

class PostViewController: UIViewController {

    private let model: UserPost?
    
    private lazy var tableView = UITableView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    init(model: UserPost?) {
        self.model = model
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func setup() {
        view.addSubview(tableView)
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
