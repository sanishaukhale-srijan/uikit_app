//
//  ViewModel.swift
//  sample
//
//  Created by Sanish Aukhale on 23/02/23.
//

import Foundation

class ViewModel{
    var apiManager = APIManager()
    @Published var fact: FactModel = FactModel(id: "", text: "Click to load Facts")
    func fetchFact()  {
      
   
    }
}
