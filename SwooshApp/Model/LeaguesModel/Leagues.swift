//
//  Leagues.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/28/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import Foundation
// MARK: - Leagues
struct Leagues: Codable {
    let countrys: [League]?
}

// MARK: - League
struct League: Codable {
    let idLeague: String?
    let strSport: String?
    let strLeague: String?
    let strLeagueAlternate: String?
    let strCountry: String?
    let strYoutube: String?
    let strBadge:String?
    
}
