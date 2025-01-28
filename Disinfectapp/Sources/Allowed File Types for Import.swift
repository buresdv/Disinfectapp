//
//  Allowed File Types for Import.swift
//  Disinfectapp
//
//  Created by David Bureš - P on 28.01.2025.
//

import Foundation
import UniformTypeIdentifiers

extension UTType
{
    static let allowedTypesForImport: [UTType] = [.application, .executable]
}
