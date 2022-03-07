//
//  Countries.swift
//  SwooshApp
//
//  Created by Ma7rous on 3/1/22.
//  Copyright © 2022 Ma7rous. All rights reserved.
//
import Foundation

// MARK: - Country
struct Country: Codable {
    let name: Name?
    let flags: Flag?
    
}

// MARK: - CoatOfArms
struct Flag: Codable {
    let png: String?
}

// MARK: - Name
struct Name: Codable {
    let official: String?
}

