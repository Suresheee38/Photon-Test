//
//  ContentView.swift
//  NYCSchools
//
//  Created by Suresh kumar Vijayakumar on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.schools ?? [], id: \.dbn) { school in
                NavigationLink {
                    Text(school.overview_paragraph ?? "")
                } label: {
                    Text(school.school_name ?? "")
                }
            }
            .navigationTitle("School")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

protocol ServiceManaging {
    func fetch (completion: @escaping (Result<[NycSchool], Error>) -> ())
}

class ServiceManager: ServiceManaging {
    enum School {
        case list
            var path: String {
                switch self {
                case .list:
                    return "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
            }
        }
    }
    
    func fetch (completion: @escaping (Result<[NycSchool], Error>) -> ()) {
        guard let url = URL(string: School.list.path) else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                completion(Result.failure(error))
                return
            }
            if let data = data, let result = self.decode(data: data) {
                DispatchQueue.main.async {
                    completion(Result.success(result))
                }
            }
        }
        dataTask.resume()
    }
    
    func decode(data: Data) -> [NycSchool]? {
        do {
            let json = try JSONDecoder().decode([NycSchool].self, from: data)
            return json
        } catch {
            print(error)
        }
        return nil
    }
}
