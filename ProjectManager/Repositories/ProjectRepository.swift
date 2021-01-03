//
//  ProjectRepository.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import Foundation
import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

class ProjectRepository: ObservableObject {
    
    let db = Firestore.firestore()
    
    @Published var projects = [Project]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        print("Loading projects")
        db.collection("projects")
            .addSnapshotListener { (querrySnapshot, error) in
                if let querrySnapshot = querrySnapshot {
                    self.projects = querrySnapshot.documents.compactMap{ document in
                        do {
                            let x = try document.data(as: Project.self)
                            
                            return x
                        } catch {
                            print(error.localizedDescription)
                        }
                        return nil
                    }
                }
            }
    }
    
}
