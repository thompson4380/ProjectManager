//
//  TaskDetailViewModel.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import Foundation
import Combine

class TaskDetailViewModel: ObservableObject, Identifiable {
    
    @Published var taskRepository = TaskRepository(projectId: "YFQ2tDCHIRxwoa30f6oK")
    @Published var task: Task
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(task: Task) {
        
        self.task = task
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
                
                // TODO: implement Update function
                // self.taskRepository.updateTask(task)
            }
            .store(in: &cancellables)
        
    }
    
    func addTaskToDatabase() {
        taskRepository.addTask(self.task)
        
    }
    
    
}
