//
//  Task.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    
    @DocumentID var id: String?
    var projectId: String
    var taskName: String
    var taskComment: String
    var taskResponsible: String
    var isDone: Bool
    
}
