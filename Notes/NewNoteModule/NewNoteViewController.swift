//
//  NewNoteViewController.swift
//  Notes
//
//  Created by Павел Яковенко on 21.12.2022.
//

import UIKit

class NewNoteViewController: UIViewController {

    private let titleLabel = UILabel(text: " Новая заметка", font:  .robotoMedium22(), textColor: .specialBlack)
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleNoteLabel = UILabel(text: "Название", font: .robotoMedium14(), textColor: .specialLightBrown)
    
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
    }

    @objc private func closeButtonTapped() {
        dismiss(animated: true)
        print("closeButtonTapped")
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
            titleNoteLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25)
        
        ])
    }

}
