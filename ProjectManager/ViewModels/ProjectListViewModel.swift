//
//  ProjectListViewModel.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import Foundation
import Combine

class ProjectListViewModel: ObservableObject {
    
    @Published var projectRepository = ProjectRepository()
    @Published var projectCellViewModels = [ProjectDetailViewModel]()
    
    
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        
        projectRepository.$projects
            .map { projects in
                projects.map { project in
                    
                    ProjectDetailViewModel(project: project)
                }
            }
            .assign(to: \.projectCellViewModels, on: self)
            .store(in: &cancellables)
    }
    
    func addProject(project: Project) {
        projectRepository.addProject(project)
    }
    
  
    func deleteProject(at index: Int) {
        projectRepository.deleteProject(at: index)
    }
    
}
