//
//  BranchListTableViewController.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 24/01/26.
//

import UIKit

class BranchListTableViewController: UITableViewController {

    let viewModel: BranchListViewModel
    private let searchController = UISearchController(searchResultsController: nil)
    
    init(list: [DonBigotes.Branch]){
        viewModel = BranchListViewModel(branches: list)
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureSearchController()
    }
    
    private func setupView() {
        title = viewModel.title
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: viewModel.cellIdentifier)
    }
    
    private func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar sucursal"
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.branchCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath)
        let branch = viewModel.branch(at: indexPath)
        
        var config = cell.defaultContentConfiguration()
        config.text = branch.name
        config.secondaryText = branch.address
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let branch = viewModel.branch(at: indexPath)
        let detailVC = BranchDetailViewController(branch: branch)
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

extension BranchListTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        viewModel.filterBranches(with: searchText)
        tableView.reloadData()
    }
}

// MARK: - UISearchBarDelegate
extension BranchListTableViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        viewModel.filterBranches(with: "")
        tableView.reloadData()
    }
}
