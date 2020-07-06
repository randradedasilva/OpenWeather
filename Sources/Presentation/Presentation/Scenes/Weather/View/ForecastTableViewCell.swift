//
//  WeatherTableViewCell.swift
//  OpenWeather
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Foundation
import UIKit
import Reusable
import SDWebImage

class ForecastTableViewCell: UITableViewCell, CodeView, Reusable {
    
    // MARK: - Inits
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init: coder has not been implemented")
    }
    
    // MARK: - Private Properties
    
    private let cityNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    }()
    
    private let conditionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    private let temperatureMinLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    private let temperatureMaxLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        return label
        
    }()
    
    private let mainImage: UIImageView = {
        var mainImage = UIImageView()
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.contentMode = UIView.ContentMode.scaleAspectFit
        return mainImage
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        return stackView
    }()
    
    // MARK: - Internal Methods
    
    internal func buildHierarchy() {
        addSubview(temperatureMinLabel)
        addSubview(temperatureMaxLabel)
        addSubview(conditionLabel)
        addSubview(mainImage)
        
    }
    
    internal func buildConstraints() {
        
        temperatureMinLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20).isActive = true
        temperatureMinLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        temperatureMinLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        
        temperatureMaxLabel.leftAnchor.constraint(equalTo: self.temperatureMinLabel.leftAnchor,constant: -60).isActive = true
        temperatureMaxLabel.bottomAnchor.constraint(equalTo: self.temperatureMinLabel.bottomAnchor).isActive = true
        temperatureMaxLabel.topAnchor.constraint(equalTo: self.temperatureMinLabel.topAnchor).isActive = true
        
        conditionLabel.leftAnchor.constraint(equalTo: self.mainImage.rightAnchor,constant: 20).isActive = true
        conditionLabel.bottomAnchor.constraint(equalTo: self.temperatureMinLabel.bottomAnchor).isActive = true
        conditionLabel.topAnchor.constraint(equalTo: self.temperatureMinLabel.topAnchor).isActive = true
        
        mainImage.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        mainImage.bottomAnchor.constraint(equalTo: self.temperatureMinLabel.bottomAnchor).isActive = true
        mainImage.topAnchor.constraint(equalTo: self.temperatureMinLabel.topAnchor,constant: 5).isActive = true
        
    }
    
    //MARK: Public Methods
    
    func configure(with cellModel:ForecastTableViewCellViewModel) {
        conditionLabel.text = cellModel.condition
        temperatureMaxLabel.text = cellModel.temperatureMax
        temperatureMinLabel.text = cellModel.temperatureMin
        
        let url = URL(string: "http://openweathermap.org/img/wn/\(cellModel.icon ?? "")@2x.png")
        mainImage.sd_setImage(with: url)
    }
}
