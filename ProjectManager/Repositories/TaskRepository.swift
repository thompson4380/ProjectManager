//
//  TaskRepository.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import Foundation
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init(projectId: String) {
        loadData(projectId: projectId)
    }
    
    func loadData(projectId: String) {
        print("Loading Tasks for Project: \(projectId)")
        db.collection("tasks")
            .addSnapshotListener { (querrySnapshot, error) in
                if let querrySnapshot = querrySnapshot {
                    self.tasks = querrySnapshot.documents.compactMap { document in
                        
                        do {
                            return try document.data(as: Task.self)
                        } catch {
                            print(error.localizedDescription)
                        }
                        return nil
                        
                    }
                }
            }
    }
    
    
    
    
}
