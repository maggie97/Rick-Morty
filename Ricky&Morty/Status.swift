//
//  Status.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import Foundation
import SwiftUI

enum Status: String, Codable {
    case Alive, Dead, Unknow
    
    func getColor() -> Color{
        switch self{
        case .Alive:
            return Color.green
        case .Dead:
            return Color.red
        case .Unknow:
            return Color.black
        }
    }
}
