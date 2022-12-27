//
//  NewNoteViewController.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

class NewNoteViewController: UIViewController {

    private let titleLabel = UILabel(text: "Новая заметка", font:  .robotoMedium22(), textColor: .specialBlack)
    
    private let titleNoteLabel = UILabel(text: "Название заметки", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    public let titleNoteTextField = BrownTextField()
    
    private let detailsNoteLabel = UILabel(text: "Подробно", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    public let detailsNoteTextField = BrownTextField()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Сохранить", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialGreen
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var noteModel = NoteModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(titleNoteLabel)
        view.addSubview(titleNoteTextField)
        view.addSubview(detailsNoteLabel)
        view.addSubview(detailsNoteTextField)
        view.addSubview(saveButton)
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
    private func setModel() {
        noteModel.noteName = getTitleTextFieldText()
        noteModel.noteDetail = getDetailsNoteTextFieldText()
    }
    
    private func saveModel() {
        let text = getTitleTextFieldText()
        let count = text.filter { $0.isNumber || $0.isLetter }.count

        if count != 0 {
            RealmManager.shared.saveNoteModel(noteModel)
            presentSimpleAlert(title: "Успешно", message: nil)
        } else {
            presentSimpleAlert(title: "Ошибка", message: "Заполните все поля")
        }
    }
    
    private func getTitleTextFieldText() -> String {
        guard let text = titleNoteTextField.text else { return "" }
        return text
    }
    
    private func getDetailsNoteTextFieldText() -> String {
        guard let text = detailsNoteTextField.text else { return "" }
        return text
    }
}


//MARK: - setConstraints

extension NewNoteViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            titleNoteLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            titleNoteLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            titleNoteTextField.topAnchor.constraint(equalTo: titleNoteLabel.bottomAnchor, constant: 3),
            titleNoteTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            titleNoteTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            titleNoteTextField.heightAnchor.constraint(equalToConstant: 40),
            
            detailsNoteLabel.topAnchor.constraint(equalTo: titleNoteTextField.bottomAnchor, constant: 16),
            detailsNoteLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            
            detailsNoteTextField.topAnchor.constraint(equalTo: detailsNoteLabel.bottomAnchor, constant: 3),
            detailsNoteTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 14),
            detailsNoteTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -14),
            detailsNoteTextField.heightAnchor.constraint(equalToConstant: 100),
            
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
