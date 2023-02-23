//
//  ApiManager.swift
//  sample
//
//  Created by Sanish Aukhale on 23/02/23.
//

import Foundation

class APIManager{
    private var dataTask: URLSessionDataTask?
    @Published var fact: FactModel = FactModel(id: "", text: "Click to load Facts")
    
    func getFact() {
        let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en")
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url!){
            data,responds, error in
            guard let data = data else { return }
            if let decodedResponse = try? JSONDecoder().decode(FactModel.self, from: data) {
                DispatchQueue.main.async {
                    self.fact = decodedResponse
                }
            }
        }
        dataTask?.resume()
  
    }
    
}
