//
//  MainViewController.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

class MainViewController: UIViewController {

    private let titleLabel = UILabel(text: "Заметки", font: .robotoBold24(), textColor: .specialBlack)
    
    private lazy var addNoteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(addNoteButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public let tableView = TableView()
    private var noteArray = [NoteModel]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNotes()
        updateArrayNotes()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
        
        getNotes()
        updateArrayNotes()
    }

    private func setupViews() {
        title = "Заметки"
        
//        let navVC = UINavigationController(rootViewController: MainViewController())
//        navVC.modalPresentationStyle = .fullScreen
//        self.present(navVC, animated: true)
        
        view.backgroundColor = .specialBackground
        view.addSubview(titleLabel)
        view.addSubview(tableView)
        view.addSubview(addNoteButton)

    }
    
    private func setDelegates() {
        tableView.mainDelegate = self
    }
    
    @objc private func addNoteButtonTapped() {
//        let navVC = UINavigationController(rootViewController: NewNoteViewController())
//        navVC.modalPresentationStyle = .fullScreen
//        self.present(navVC, animated: true)
        
        let newNoteViewController = NewNoteViewController()
        newNoteViewController.modalPresentationStyle = .fullScreen
        present(newNoteViewController, animated: true)
    }
    
    private func getNotes() {
        let resultArray = RealmManager.shared.getResultsNoteModel()
        noteArray = resultArray.map{$0}
        tableView.reloadData()
    }
    
    private func updateArrayNotes() {
        tableView.setNotesArray(array: noteArray)
        tableView.reloadData()
    }
}

// MARK: - TableViewProtocol

extension MainViewController: TableViewProtocol {
    
    func deleteNote(model: NoteModel, index: Int) {
        RealmManager.shared.deleteNoteModel(model)
        noteArray.remove(at: index)
        tableView.setNotesArray(array: noteArray)
        tableView.reloadData()
    }
}

// MARK: - NoteCellProtocol

extension MainViewController: NoteCellProtocol {
  
    func editingButtonTapped(model: NoteModel) {
        print("editingButtonTapped")
//        let editingNoteViewController = EditingNoteViewController()
//        editingNoteViewController.modalPresentationStyle = .fullScreen
//        editingNoteViewController.setNoteModel(model)
//        present(editingNoteViewController, animated: true)
    }
}

//MARK: - setConstraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            addNoteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            addNoteButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            addNoteButton.heightAnchor.constraint(equalToConstant: 25),
            addNoteButton.widthAnchor.constraint(equalToConstant: 25),
            
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}
