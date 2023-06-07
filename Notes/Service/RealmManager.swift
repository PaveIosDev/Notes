//
//  RealmManager.swift
//  Notes
//
//  Created by Павел Яковенко on 23.12.2022.
//

import RealmSwift
import Foundation

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let realm = try! Realm()
    
    func getResultsNoteModel() -> Results<NoteModel> {
        realm.objects(NoteModel.self)
    }
    
    func saveNoteModel(_ model: NoteModel) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func deleteNoteModel(_ model: NoteModel) {
        try! realm.write {
            realm.delete(model)
        }
    }
    
    func updateNoteModel(_ model: NoteModel) {
        guard let note = realm.objects(NoteModel.self)
            .filter("date = %@", model.date)
            .first
        else { return }
        try! realm.write {
            note.noteName = model.noteName
            note.noteDetail = model.noteDetail
        }
    }
}
