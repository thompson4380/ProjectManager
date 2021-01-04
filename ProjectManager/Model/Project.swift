//
//  Project.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Project: Codable, Identifiable {
    
    @DocumentID var id: String?
    var projectName: String
    var projectManager: String
    
}

extension Project {
    
    var isValid: Bool {
        !projectManager.isEmpty && !projectName.isEmpty
    }
}
