//
//  TaskCellView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 05.01.21.
//

import SwiftUI

struct TaskCellView: View {
    
    @ObservedObject var taskDetailViewModel: TaskDetailViewModel
    
    var body: some View {
        
        HStack {
            Image(systemName: taskDetailViewModel.completionStateIconName)
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskDetailViewModel.task.isDone.toggle()
                }
            
            VStack(alignment: .leading) {
                Text(taskDetailViewModel.task.taskName)
                Text(taskDetailViewModel.task.taskResponsible)
                Text(taskDetailViewModel.task.dueDateAsString)
                
                
            }
        }
        
        
        
        
    }
}


