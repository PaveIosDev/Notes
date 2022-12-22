//
//  NoteModel.swift
//  Notes
//
//  Created by Павел Яковенко on 22.12.2022.
//

import RealmSwift
import Foundation

class NoteModel: Object {
//    @Persisted var noteDate: Date
    @Persisted var noteName: String = "Unknown"
    @Persisted var noteDetail: String = "Unknown"
}
