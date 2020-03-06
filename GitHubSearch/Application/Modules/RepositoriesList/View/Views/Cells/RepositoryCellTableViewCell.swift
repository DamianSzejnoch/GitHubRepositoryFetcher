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
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Methods
    func output(model: RepositoryModel) {
        repositoryName.text = model.name
        repositoryLanguage.text = model.language
    }
}
