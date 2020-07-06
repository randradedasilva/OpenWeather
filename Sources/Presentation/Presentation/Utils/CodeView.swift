//
//  CodeView.swift
//  OpenWeather
//
//  Created by Rodrigo Andrade on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

protocol CodeView {
    func buildHierarchy()
    func buildConstraints()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildHierarchy()
        buildConstraints()
    }
}

