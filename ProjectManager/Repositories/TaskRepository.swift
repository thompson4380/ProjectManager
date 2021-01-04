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
            .whereField("projectId", isEqualTo: projectId)
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
    
    func addTask(_ task: Task) {
        do {
            let _ = try db.collection("tasks").addDocument(from: task)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func updateTask(_ task: Task) {
        if let taskId = task.id {
            do {
                try db.collection("tasks").document(taskId).setData(from: task)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteTask(at index: Int) {
        deleteTask(tasks[index])
    }
    
    func deleteTask(_ task: Task) {
        if let taskId = task.id {
            db.collection("tasks").document(taskId).delete { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
