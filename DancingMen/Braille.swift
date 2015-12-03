//
//  Braille.swift
//  DancingMen
//
//  Created by Melanie Freeman on 11/3/15.
//  Copyright (c) 2015 TG. All rights reserved.
//

import Foundation

struct Braille: FontProtocol {
    let name = "Swell Braille"
    let title = "Braille"
    let size: Float = 50
    let flavorText = "Braille is a tactile writing system used by people who are blind and low vision. It is traditionally written with embossed paper. Braille-users can read computer screens and other electronic supports thanks to refreshable braille displays. Braille is named after its creator, Frenchman Louis Braille, who lost his eyesight due to a childhood accident."
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    func transform(textArray: [Character]) -> [Character] {
        return textArray
    }
}
