//
//  ViewModel.swift
//  NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/1/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var schools: [NycSchool]?
    let manager: ServiceManaging

    init(manager: ServiceManaging = ServiceManager()) {
        self.manager = manager
        fetchSchools()
    }
    
    func fetchSchools() {
       
        manager.fetch { result in
            self.schools = try? result.get()
        }
    }
}
