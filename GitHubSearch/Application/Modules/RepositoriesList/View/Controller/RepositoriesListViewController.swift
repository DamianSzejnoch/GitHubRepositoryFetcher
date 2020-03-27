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
import FacebookShare

class RepositoriesListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private weak var loadingView: UIActivityIndicatorView!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var emptyListMessage: UILabel!
    
    //MARK: - Public
    var actions: RepositoriesListCoordinatorActions?
    
    // MARK: - Private
    private let disposeBag = DisposeBag()
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
        self.tableView.keyboardDismissMode = .onDrag
        self.loadingView.isHidden = true
        tableView.register(RepositoryCellTableViewCell.nib, forCellReuseIdentifier: RepositoryCellTableViewCell.key)
        searchBar.delegate = self
        searchBar.placeholder = NSLocalizedString("Search Repositories", comment: "")
        searchBar.barStyle = .black
        searchBar.searchTextField.accessibilityIdentifier = AccessibilityIdentifier.searchField
    }
    
    private func viewModelBindings() {
        viewModel.items.asObservable()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [weak self] _ in
                self?.viewModel.loadingType.accept(.loaded)
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)
        viewModel.loadingType.asObservable()
            .subscribe(onNext: { [weak self] type in
                guard let self = self else { return }
                switch type {
                case .none:
                    self.loadingView.isHidden = true
                    self.emptyListMessage.isHidden = false
                    self.searchBar.showsCancelButton = false
                case .loading:
                    self.loadingView.isHidden = false
                    self.emptyListMessage.isHidden = true
                case .loaded:
                    self.loadingView.isHidden = true
                    self.searchBar.showsCancelButton = true
                    self.emptyListMessage.isHidden = true
                }
            }).disposed(by: disposeBag)
        
        viewModel.error.asObservable().subscribe(onNext: { [weak self] error in
            guard let self = self else { return }
            self.showAnAlert(alert: "", message: error?.localizedDescription ?? "", actionTitle: "OK", actionStyle: .default, controller: self)
        }).disposed(by: disposeBag)
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
        viewModel.loadingType.accept(.loading)
        viewModel.cancelSearch()
        guard let searchText = searchBar.text, !searchText.isEmpty else { return }
        viewModel.search(query: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.cancelSearch()
        viewModel.loadingType.accept(.none)
        tableView.reloadData()
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
        repositoryCell.prepareForReuse()
        repositoryCell.output(model: viewModel.items.value[indexPath.row])
        return repositoryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL(string: viewModel.items.value[indexPath.row].url) else { return }
        UIApplication.shared.open(url)
    }
}

extension RepositoriesListViewController: UITableViewDelegate {}


