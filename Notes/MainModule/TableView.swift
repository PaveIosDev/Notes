//
//  TableView.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

protocol TableViewProtocol: AnyObject {
    func deleteNote(model: NoteModel, index: Int)
}

class TableView: UITableView {
    
    weak var mainDelegate: TableViewProtocol?
    
    private let idTableView = "idTableView"
    
    private var notesArray = [NoteModel]()
    

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(NoteTableViewCell.self, forCellReuseIdentifier: idTableView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        separatorStyle = .none
        bounces = false
        showsVerticalScrollIndicator = false
        delaysContentTouches = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    public func setNotesArray(array: [NoteModel]) {
        notesArray = array
    }
}

//MARK: - UITableViewDataSource

extension TableView: UITableViewDataSource {
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

extension TableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
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
