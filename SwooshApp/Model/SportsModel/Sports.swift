//
//  Sports.swift
//  SwooshApp
//
//  Created by Ma7rous on 2/23/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//

import Foundation

// MARK: - Sports
struct Sports: Codable {
    let sports: [Sport]?
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String?
    let strFormat: StrFormat?
    let strSportThumb: String?
    let strSportIconGreen: String?
    let strSportDescription: String?
}

enum StrFormat: String, Codable {
    case eventSport = "EventSport"
    case teamvsTeam = "TeamvsTeam"
}
