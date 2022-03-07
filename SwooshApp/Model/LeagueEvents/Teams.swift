//
//  Teams.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/3/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import Foundation


// MARK: - Teams
struct Teams: Codable {
    let teams: [Team]
}


//MARK: - Team
struct Team: Codable {
    let idTeam: String?
    let strTeam: String?
    let strTeamBadge: String?
    let strTeamJersey: String?
    let intFormedYear: String?
    let strDescriptionEN: String?
    let strCountry: String?
    let strStadium: String?
    let strStadiumLocation: String?
    let strStadiumThumb: String?
    let strFacebook: String?
    let strWebsite: String?
    let strInstagram: String?
    let strYoutube: String?
}
