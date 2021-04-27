//
//  EditProfileViewController.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

struct EditProfileFormModel {
    let label: String
    let placeholder: String
    var value: String?
}

class EditProfileViewController: UIViewController {
    private var models = [[EditProfileFormModel]]()

    private lazy var tableView = UITableView()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(FormTableViewCell.self, forCellReuseIdentifier: FormTableViewCell().identifier)
        $0.tableHeaderView = createTableHeaderView()
        $0.rowHeight = 50
        $0.dataSource = self
        $0.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        configureStyleAndLayout()
        configureNavBar()
    }
    
    private func configureStyleAndLayout() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

        ])
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSave))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(didTapCancel))
    }
    
    private func configureModels() {
        //name, username, bio
        let section1Labels = ["Name", "Username", "Bio"]
        var section1 = [EditProfileFormModel]()
        for label in section1Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)", value: nil)
            section1.append(model)
        }
        models.append(section1)
        
        //email, phone, gender
        let section2Labels = ["Email", "Phone", "Gender"]
        var section2 = [EditProfileFormModel]()
        for label in section2Labels {
            let model = EditProfileFormModel(label: label, placeholder: "Enter \(label)", value: nil)
            section2.append(model)
        }
        models.append(section2)
    }
    
    
    @objc private func didTapSave() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture", message: "Change profile picture", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        present(actionSheet, animated: true)
    }
}

extension EditProfileViewController: UITableViewDelegate, UITableViewDataSource {
    private func createTableHeaderView() -> UIView {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/3).integral)
        let size = header.frame.height/1.5
        let profilePhotoButton = UIButton(frame: CGRect(x: (view.frame.width-size)/2, y: (header.frame.height-size)/2, width: size, height: size))
        header.addSubview(profilePhotoButton)
        profilePhotoButton.layer.masksToBounds = true
        profilePhotoButton.layer.cornerRadius = size/2.0
        profilePhotoButton.tintColor = .label
        profilePhotoButton.addTarget(self, action: #selector(didTapChangeProfilePicture), for: .touchUpInside)
        profilePhotoButton.setBackgroundImage(UIImage(systemName: "person.circle"), for: .normal)
        profilePhotoButton.layer.borderWidth = 1
        profilePhotoButton.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        return header
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FormTableViewCell().identifier, for: indexPath) as! FormTableViewCell
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard section == 1 else {
            return nil
        }
        return "Private Information"
    }
}

extension EditProfileViewController: FormTableViewCellDelegate {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel) {
        print(updatedModel.value ?? "nil")
    }
}
