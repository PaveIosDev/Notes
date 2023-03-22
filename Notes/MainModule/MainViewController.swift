//
//  MainViewController.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

protocol TableViewProtocol: AnyObject {
    func deleteNote(model: NoteModel, index: Int)
}

class MainViewController: UIViewController{


//    private let titleLabel = UILabel(text: "Заметки", font: .robotoBold24(), textColor: .specialBlack)
    weak var mainDelegate: TableViewProtocol?
    private let idTableView = "idTableView"

    private var notesArray = [NoteModel]()

//    public let tableView = TableView()
    private var noteArray = [NoteModel]()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.register(NoteTableViewCell.self, forCellReuseIdentifier: "idTableView")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getNotes()
        updateArrayNotes()
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
        setDelegates()
        setNavigationBar()

        getNotes()
        updateArrayNotes()
    }

    private func setupViews() {
        
        view.backgroundColor = .specialBackground
//        view.addSubview(titleLabel)

        view.addSubview(tableView)
    }

    private func setDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
        mainDelegate = self
    }
    
    private func setNavigationBar() {
        navigationItem.title = "Мои заметки"
        
//        navigationItem.searchController = searchController
        
        let addNewNote = createCustomButton(selector: #selector(addNewNoteTapped))
        navigationItem.rightBarButtonItem = addNewNote
    }
    
//    private func setupSearchController() {
//        searchController.searchBar.placeholder = "Search"
//        searchController.obscuresBackgroundDuringPresentation = false
//    }
    
    @objc private func addNewNoteTapped() {
        let newNoteViewController = NewNoteViewController()
        navigationController?.pushViewController(newNoteViewController, animated: true)
    }
    
    private func getNotes() {
        let resultArray = RealmManager.shared.getResultsNoteModel()
        noteArray = resultArray.map{$0}
        tableView.reloadData()
    }
    
    private func updateArrayNotes() {
        setNotesArray(array: noteArray)
        tableView.reloadData()
    }
    
    public func setNotesArray(array: [NoteModel]) {
        notesArray = array
    }
    
}

// MARK: - TableViewProtocol

extension MainViewController: TableViewProtocol {
    
    func deleteNote(model: NoteModel, index: Int) {
        RealmManager.shared.deleteNoteModel(model)
        noteArray.remove(at: index)
        setNotesArray(array: noteArray)
        tableView.reloadData()
    }
}

//MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTableView, for: indexPath) as? NoteTableViewCell else {
            return UITableViewCell()
        }
        let noteModel = notesArray[indexPath.row]
        cell.configure(model: noteModel)
        cell.noteCellDelegate = mainDelegate as? NoteCellProtocol
        return cell
    }
}

//MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editingNoteViewController = EditingNoteViewController()
        let note = noteArray[indexPath.row]
        editingNoteViewController.editingNote = note
        editingNoteViewController.title = note.noteName
        navigationController?.pushViewController(editingNoteViewController, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "") { _, _, _ in
            let deleteModel = self.notesArray[indexPath.row]
            self.mainDelegate?.deleteNote(model: deleteModel, index: indexPath.row)
        }

        action.backgroundColor = .specialBackground
        action.image = UIImage(named: "Delete")

        return UISwipeActionsConfiguration(actions: [action])
    }
}


//MARK: - setConstraints

extension MainViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
//            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo:  view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
}

// MARK: - NoteCellProtocol

extension MainViewController: NoteCellProtocol {

    func editingButtonTapped(model: NoteModel) {
        print("editingButtonTapped")
        let editingNoteViewController = EditingNoteViewController()
        editingNoteViewController.modalPresentationStyle = .fullScreen
        editingNoteViewController.setNoteModel(model)
        present(editingNoteViewController, animated: true)
    }
}
