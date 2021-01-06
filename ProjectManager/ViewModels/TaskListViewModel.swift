//
//  TaskListViewModel.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    
    @Published var taskRepository: TaskRepository
    @Published var taskDetailViewModels = [TaskDetailViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    

    init(projectId: String) {

        self.taskRepository = TaskRepository(projectId: projectId)
    
        taskRepository.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskDetailViewModel(task: task)
                }
            }
            .assign(to: \.taskDetailViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func addTask(task: Task) {
        taskRepository.addTask(task)
    }
    
    func deleteTask(at index: Int) {
        taskRepository.deleteTask(at: index)
    }
    
  
}
