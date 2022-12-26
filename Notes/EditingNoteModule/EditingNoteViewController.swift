//
//  EditingNoteViewController.swift
//  Notes
//
//  Created by Павел Яковенко on 25.12.2022.
//

import UIKit

class EditingNoteViewController: UIViewController {

    private let titleLabel = UILabel(text: "Редактирование заметки", font:  .robotoMedium22(), textColor: .specialBlack)
    
    private let editingTitleLabel = UILabel(text: "Название заметки", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    private let editingTitleTextField = BrownTextField()
    
    private let editingDetailsLabel = UILabel(text: "Подробно", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    private let editingDetailsTextField = BrownTextField()
    
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

        setupViews()
        setConstraints()
        loadNoteInfo()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(titleLabel)
        view.addSubview(closeButton)
        view.addSubview(editingTitleLabel)
        view.addSubview(editingTitleTextField)
        view.addSubview(editingDetailsLabel)
        view.addSubview(editingDetailsTextField)
        view.addSubview(saveButton)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setNoteModel(noteModel)
        
        let noteArray = RealmManager.shared.getResultsNoteModel()

        if noteArray.count == 0 {
            RealmManager.shared.updateNoteModel(noteModel)
        } else { return }

        noteModel = NoteModel()
    }
    
    public func setNoteModel(_ model: NoteModel) {
        noteModel = model
        
        guard let titleNote = editingTitleTextField.text,
              let textNote = editingDetailsLabel.text else { return
              }
        
        noteModel.noteName = titleNote
        noteModel.noteDetail = textNote
    }
    
    private func loadNoteInfo() {
        let noteArray = RealmManager.shared.getResultsNoteModel()

        if noteArray.count != 0 {
            editingTitleTextField.text = noteArray[0].noteName
            editingDetailsTextField.text = noteArray[0].noteDetail
        }
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
            editingDetailsTextField.heightAnchor.constraint(equalToConstant: 100),
            
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -120),
            saveButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 55),
            saveButton.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
}
