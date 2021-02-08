//
//  PokemonListTableViewCell.swift
//  PokemonApp
//
//  Created by Tiago Flores on 06/02/2021.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {

    private var presenter: PokemonDetailPresenterProtocol?
    var imageDownloader = ImageDownloader()
    
    private (set) lazy var titleTextLabel: UILabel = {
        let titleTextLabel = UILabel()
        titleTextLabel.numberOfLines = 0
        titleTextLabel.lineBreakMode = .byWordWrapping
        titleTextLabel.textColor = UIColor.black
        return titleTextLabel
    }()
    

    private (set) lazy var pokemonImageView: UIImageView = {
        let pokemonImageView = UIImageView()
        pokemonImageView.layer.cornerRadius = pokemonImageView.frame.width / 2
        pokemonImageView.clipsToBounds = true
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.backgroundColor = .white
        return pokemonImageView
    }()
    
   
    private (set) lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        let spacerView = UIView()
      
        stackView.axis  = .horizontal
        stackView.distribution  = .fill
        stackView.alignment = .top
        //stackView.spacing   = 8
       
  
        contentView.addSubview(stackView)
        return stackView
    }()
        

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configureViews(){
        self.accessoryType = .disclosureIndicator
        backgroundColor = .white
        configureStackViewLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with cellPresenter: PokemonDetailPresenterProtocol) {
        presenter = cellPresenter
        presenter?.fetchPokemonData { [weak self] result in
            guard let self = self else {
                return
            }
            let sprite = result.sprites.frontDefault
            self.imageDownloader.downloadImage(from: sprite, toImageView: self.pokemonImageView)
        }
    
        pokemonImageView.isHidden = false
        titleTextLabel.text = cellPresenter.pokemonEntry.name
        horizontalStackView.layoutIfNeeded()
        self.layoutIfNeeded()
    }
    
    
    private func configureStackViewLayout() {
        titleTextLabel.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
           
        ])
        
        horizontalStackView.addArrangedSubview(pokemonImageView)
        horizontalStackView.addArrangedSubview(titleTextLabel)
        horizontalStackView.layoutIfNeeded()
        
        let titleHeightConstraint = titleTextLabel.heightAnchor.constraint(equalTo: horizontalStackView.heightAnchor)
        titleHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        titleHeightConstraint.isActive = true
        let imageWidthConstraint = pokemonImageView.widthAnchor.constraint(equalToConstant: 100)
        imageWidthConstraint.priority = UILayoutPriority(rawValue: 999)
        imageWidthConstraint.isActive = true
    }
}
