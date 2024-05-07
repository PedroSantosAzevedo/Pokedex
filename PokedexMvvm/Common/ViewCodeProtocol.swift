//
//  ViewCodeProtocol.swift
//  PokedexMvvm
//
//  Created by Pedro Azevedo on 07/05/24.
//

import Foundation
import UIKit

protocol ViewCodeProtocol {
    
    func setupView()
    func setupConstraints()
    func setupHierarchy()
}

extension ViewCodeProtocol{    
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
}
