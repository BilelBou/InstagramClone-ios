//
//  FormTableViewCell.swift
//  InstagramClone
//
//  Created by Bilel Bouricha on 26/04/2021.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didUpdateField updatedModel: EditProfileFormModel)
}

class FormTableViewCell: UITableViewCell {
    public let identifier = "FormTableViewCell"
    public weak var delegate: FormTableViewCellDelegate?
    
    private var model: EditProfileFormModel?
    
    private lazy var formLabel = UILabel()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var field = UITextField()..{
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.returnKeyType = .done
        $0.delegate = self
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        selectionStyle = .none
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        NSLayoutConstraint.activate([
            formLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            formLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin._20),
            formLabel.widthAnchor.constraint(equalToConstant: 80),
            
            field.topAnchor.constraint(equalTo: contentView.topAnchor),
            field.leadingAnchor.constraint(equalTo: formLabel.trailingAnchor, constant: Margin._40),
        ])
    }
    
    public func configure(with model: EditProfileFormModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
}

extension FormTableViewCell: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        model?.value = textField.text
        guard let model = model else {
            return true
        }
        delegate?.formTableViewCell(self, didUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
}
