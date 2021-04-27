//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 25/04/2021.
//

import UIKit

struct SettingCellModel {
    let title: String
    let handler: (() -> Void)
}

final class SettingsViewController: UIViewController {
    
    private lazy var tableView = UITableView(frame: .zero, style: .grouped)..{
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.backgroundColor = .systemBackground
        $0.delegate = self
        $0.dataSource = self
    }
    
    private var data = [[SettingCellModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureStyleAndLayout()
        configureModels()
        // Do any additional setup after loading the view.
    }
    
    private func configureStyleAndLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
        
    }
    
    private func configureModels() {
        data.append([
            SettingCellModel(title: "Edit profile") { [weak self] in
                self!.didTapEditProfile()
        },
            SettingCellModel(title: "Invite friends") { [weak self] in
                self!.didTapInviteFriends()
        },
            SettingCellModel(title: "Save Original Posts") { [weak self] in
            self!.didTapSaveOriginalPosts()
        }
        ])
        
        data.append([
            SettingCellModel(title: "Terms of service") { [weak self] in
                self!.didTapTerms()
        },
            SettingCellModel(title: "Privacy policy") { [weak self] in
                self!.didTapPrivacy()
        },
            SettingCellModel(title: "Help / Feedback") { [weak self] in
                self!.didTapHelp()
        }
        ])
        
        data.append([
            SettingCellModel(title: "Log Out") { [weak self] in
                self!.didTapLogOut()
        }
        ])
    }
    
    private func didTapEditProfile() {
        let vc = EditProfileViewController()
        vc.title = "Edit Profile"
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        navVC.navigationBar.tintColor = .label
        navVC.navigationBar.isTranslucent = false
        present(navVC, animated: true)
    }
    
    private func didTapInviteFriends() {
        
    }
    
    private func didTapSaveOriginalPosts() {
        
    }
    
    private func didTapTerms() {
        
    }
    
    private func didTapPrivacy() {
        
    }
    
    private func didTapHelp() {
        
    }
    
    
    private func didTapLogOut() {
        let actionSheet = UIAlertController(title: "Log Out", message: "Are you sure you want to log out?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { _ in
            AuthManager.shared.logOut { (success) in
                DispatchQueue.main.async {
                    if success {
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    } else {
                        fatalError("Could not log out user")
                    }
                }
            }
        }))
        actionSheet.popoverPresentationController?.sourceView = tableView
        actionSheet.popoverPresentationController?.sourceRect = tableView.bounds
        present(actionSheet, animated: true, completion: nil)
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .systemBackground
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        data[indexPath.section][indexPath.row].handler()
    }
}
