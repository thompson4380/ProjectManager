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
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(task: Task) {
        
        self.task = task
        
        $task
            .map { task in
                task.isDone ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellables)  // Management things
        
        
        
        $task
            .dropFirst()
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .sink { task in
                self.taskRepository.updateTask(task)
            }
            .store(in: &cancellables)
        
    }
    
    func addTaskToDatabase() {
        taskRepository.addTask(self.task)
        
    }
    
    
}
