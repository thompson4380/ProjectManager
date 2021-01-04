//
//  ProjectCellView.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 04.01.21.
//

import SwiftUI

struct ProjectCellView: View {
    
    @ObservedObject var projectCellViewModel: ProjectDetailViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(projectCellViewModel.project.projectName)
                .bold()
            Text("PM: \(projectCellViewModel.project.projectManager)")
            Text("Finished: 2/4")
            Text("Due: 23.01.2021")
            
        }
        
    }
}




//
//struct ProjectCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProjectCellVi
//    }
//}
