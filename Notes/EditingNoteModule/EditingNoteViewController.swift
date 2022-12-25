//
//  EditingNoteViewController.swift
//  Notes
//
//  Created by Павел Яковенко on 25.12.2022.
//

import UIKit

class EditingNoteViewController: UIViewController {

//    private let editingTitleTextField: UITextField = {
//        let textField = UITextField()
//
//
//        textField.
//        return textField
//    }()
    
    private let titleLabel = UILabel(text: "Редактирование заметки", font:  .robotoMedium22(), textColor: .specialBlack)
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let editingTitleLabel = UILabel(text: "Название заметки", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    private let editingTitleTextField = BrownTextField()
    
    private let editingDetailsLabel = UILabel(text: "Подробно", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    private let editingDetailsTextField = BrownTextField()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .red
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(editingTitleLabel)
        view.addSubview(editingTitleTextField)
        view.addSubview(editingDetailsLabel)
        view.addSubview(editingDetailsTextField)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
}

//MARK: - setConstraints

extension EditingNoteViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
        
            editingTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            editingTitleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            editingTitleTextField.topAnchor.constraint(equalTo: editingTitleLabel.bottomAnchor, constant: 3),
            editingTitleTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            editingTitleTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            editingTitleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            editingDetailsLabel.topAnchor.constraint(equalTo: editingTitleTextField.bottomAnchor, constant: 16),
            editingDetailsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            editingDetailsTextField.topAnchor.constraint(equalTo: editingDetailsLabel.bottomAnchor, constant: 3),
            editingDetailsTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            editingDetailsTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            editingDetailsTextField.heightAnchor.constraint(equalToConstant: 100)
        
        
        ])
    }
}
