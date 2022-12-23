//
//  RealmManager.swift
//  Notes
//
//  Created by Павел Яковенко on 23.12.2022.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func saveNoteModel(_ model: NoteModel) {
        try! realm.write {
            realm.add(model)
        }
    }
}


//try! realm.write {
//    realm.add(todo)
//}
