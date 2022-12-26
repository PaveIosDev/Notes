//
//  NoteModel.swift
//  Notes
//
//  Created by Павел Яковенко on 22.12.2022.
//

import RealmSwift

class NoteModel: Object {
    @Persisted var noteName: String = "Unknown"
    @Persisted var noteDetail: String = "Unknown"
}
