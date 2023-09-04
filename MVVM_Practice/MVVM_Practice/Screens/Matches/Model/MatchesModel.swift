//
//  MatchesModel.swift
//  MVVM_Practice
//
//  Created by Adarsh Singh on 04/09/23.
//

import Foundation



struct Matches: Decodable{
    
    var data: [AboutMatch]
}

struct AboutMatch: Decodable{
    
    let name: String
    let matchType: String?
    let venue: String!
    let status: String!
    let teamInfo: [TeamInfo]
    let score: [Score]
    
}

struct TeamInfo: Decodable{
    
    let name: String
    let img: String
}

struct Score: Decodable{
    
    let r: Int
    let w: Int
    let o: Float
    let inning: String
}
