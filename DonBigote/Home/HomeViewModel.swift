//
//  HomeViewModel.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 23/01/26.
//

import Foundation
import UIKit


class HomeViewModel {
    private var store: DonBigotes.Store?
    
    var storeName: String {
        store?.name ?? ""
    }
    
    var storeSlogan: String {
        store?.slogan ?? ""
    }
    
    var storeDescription: String {
        store?.description ?? ""
    }
    
    var logoUrl: String {
        store?.logo ?? ""
    }
    
    var branches: [DonBigotes.Branch] {
        store?.branches ?? []
    }
    
    var branchCount: Int {
        branches.count
    }
    
    var viewBranchesButtonTitle: String {
        "Ver Sucursales"
    }
    
    init() {
        loadStoreData()
    }
    
    private func loadStoreData() {
        guard let url = Bundle.main.url(forResource: "don_bigotes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let response = try? JSONDecoder().decode(DonBigotes.self, from: data)
        else { return }
        
        store = response.store
    }
    
    func loadLogo(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: logoUrl) else {
            completion(UIImage(systemName: "cat.circle.fill"))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(UIImage(systemName: "cat.circle.fill"))
                }
            }
        }.resume()
    }
    
}
