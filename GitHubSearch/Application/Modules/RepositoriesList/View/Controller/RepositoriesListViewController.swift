//
//  RepositoriesListViewController.swift
//  GitHubSearch
//
//  Created by Damian Szejnoch on 05/03/2020.
//  Copyright © 2020 Damian Szejnoch. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class RepositoriesListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private
    let disposeBag = DisposeBag()
    private let viewModel: RepositoriesViewModelType
    
    // MARK: - Inits
    init(viewModel: RepositoriesViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - Methods
    private func setupView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.register(RepositoryCellTableViewCell.nib, forCellReuseIdentifier: RepositoryCellTableViewCell.key)
        searchBar.delegate = self
        searchBar.placeholder = NSLocalizedString("Search Repositories", comment: "")
        searchBar.barStyle = .black
    }
    
    private func viewModelBindings() {
        viewModel.items.asObservable().bind { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
            }.disposed(by: disposeBag)
        viewModel.onViewDidLoad()
    }
    // MARK: - Lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        title = "Repositories List"
        viewModelBindings()
    }
}
extension RepositoriesListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        viewModel.search(query: searchText)
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.cancelSearch()
        searchBar.showsCancelButton = false
    }
}

extension RepositoriesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let repositoryCell = tableView.dequeueReusableCell(withIdentifier: RepositoryCellTableViewCell.key) as? RepositoryCellTableViewCell else {
            fatalError(CellError.shared.showError(cellTitle: RepositoryCellTableViewCell.self, cellID: RepositoryCellTableViewCell.key))
        }
        repositoryCell.output(model: viewModel.items.value[indexPath.row])
        return repositoryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension RepositoriesListViewController: UITableViewDelegate {}


