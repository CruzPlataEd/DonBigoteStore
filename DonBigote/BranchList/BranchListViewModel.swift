//
//  BranchListViewModel.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 24/01/26.
//

import Foundation

class BranchListViewModel{
    
    private var branches: [DonBigotes.Branch]
    private var filteredBranches: [DonBigotes.Branch] = []
    private var isFiltering = false
    
    let title = "Sucursales"
    let cellIdentifier = "branch-cell"
    
    var branchCount: Int {
        isFiltering ? filteredBranches.count : branches.count
    }
    
    init(branches: [DonBigotes.Branch]) {
        self.branches = branches
    }
    
    func branch(at indexPath: IndexPath) -> DonBigotes.Branch {
        isFiltering ? filteredBranches[indexPath.row] : branches[indexPath.row]
    }
    
    func filterBranches(with searchText: String) {
        if searchText.isEmpty {
            isFiltering = false
            filteredBranches = []
        } else {
            isFiltering = true
            let lowercasedSearch = searchText.lowercased()
            filteredBranches = branches.filter { branch in
                branch.name.lowercased().contains(lowercasedSearch) ||
                branch.address.lowercased().contains(lowercasedSearch)
            }
        }
    }
    
    
}
