//
//  NoteTableViewCell.swift
//  Notes
//
//  Created by Павел Яковенко on 22.12.2022.
//

import UIKit

protocol NoteCellProtocol: AnyObject {
    func editingButtonTapped(model: NoteModel)
}

class NoteTableViewCell: UITableViewCell {
    
    private let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleNoteLabel = UILabel(text: "title", font: .robotoMedium14(), textColor: .black)
    
    private let textNoteLabel = UILabel(text: "text", font: .robotoMedium12(), textColor: .specialBlack)
    
//    private lazy var editingButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(named: "Edit"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
//        return button
//    }()

    weak var noteCellDelegate: NoteCellProtocol?
    
    private var noteModel = NoteModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
//        selectionStyle = .none
        backgroundColor = .clear
        addSubview(cellView)
        addSubview(titleNoteLabel)
        addSubview(textNoteLabel)
    }
    
    public func configure(model: NoteModel) {
        titleNoteLabel.text = model.noteName
        textNoteLabel.text = model.noteDetail
    }

//    public func refreshLables(model: NoteModel) {
//        titleNoteLabel.text = model.noteName
//        textNoteLabel.text = model.noteDetail
//    }
}

//MARK: - setConstraints

extension NoteTableViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 3),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -3),
            
            titleNoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            titleNoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            textNoteLabel.topAnchor.constraint(equalTo: titleNoteLabel.bottomAnchor, constant: 15),
            textNoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25)
        ])
    }
}
