//
//  MarasiError.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

enum MarasiError: String, Error {
    case unabelToComplete = "unable to complete your request. please make sure you have a stable internet connection."
    case invalidResponse = "Invalid response. please please try again."
    case invalidData = "The data recieved from the server was invalid. please try again"
}
