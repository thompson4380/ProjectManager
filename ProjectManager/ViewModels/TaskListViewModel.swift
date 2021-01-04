//
//  TaskListViewModel.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    
    @Published var taskRespository = TaskRepository(projectId: "YFQ2tDCHIRxwoa30f6oK")
    
    @Published var taskCellViewModels = [TaskDetailViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        taskRespository.$tasks
            .map { tasks in
                tasks.map { task in
                    TaskDetailViewModel(task: task)
                }
            }
            .assign(to: \.taskCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    
    
}
