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
                            return try document.data(as: Project.self)
                            
                            
                        } catch {
                            print(error.localizedDescription)
                        }
                        return nil
                    }
                }
            }
    }
    
    func addProject(_ project: Project) {
        do {
            let _ = try db.collection("projects").addDocument(from: project)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateProject(_ project: Project) {
        if let projectId = project.id {
            do {
                try db.collection("projects").document(projectId).setData(from: project)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteProject(at index: Int) {
        deleteProject(projects[index])
    }
    
    func deleteProject(_ project: Project) {
        if let projectId = project.id {
            db.collection("projects").document(projectId).delete { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
