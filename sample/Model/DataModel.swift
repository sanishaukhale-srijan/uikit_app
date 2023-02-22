//
//  DataModel.swift
//  sample
//
//  Created by Sanish Aukhale on 21/02/23.
//

import Foundation


struct FactModel: Decodable {
    let id,text: String
    
    enum CodingKeys: String, CodingKey {
        case id, text
    }
    
}
