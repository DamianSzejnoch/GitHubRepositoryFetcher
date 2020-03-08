//
//  RepositoryCellTableViewCell.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 06/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit

class RepositoryCellTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryLanguage: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var repositoryImage: UIImageView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        repositoryImage.image = UIImage()
        repositoryName.text = ""
        repositoryLanguage.text = ""
        score.text = ""
    }
    
    // MARK: - Methods
    func output(model: RepositoryModel) {
        repositoryName.text = model.name
        repositoryLanguage.text = model.language
        score.text = model.stars
        guard let url = URL(string: model.imageURL) else { return }
        repositoryImage.load(url: url)
    }
}
