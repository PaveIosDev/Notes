//
//  TableView.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

class TableView: UITableView {
    
    private let idTableView = "idTableView"
    
    private var notesArray = [NoteModel]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
//        backgroundColor = .red
        register(NoteTableViewCell.self, forCellReuseIdentifier: idTableView)
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
        return cell
    }
}

//MARK: - UITableViewDelegate

extension TableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
}
