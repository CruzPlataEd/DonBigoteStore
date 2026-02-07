//
//  HomeViewController.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 23/01/26.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    private let viewModel = HomeViewModel()
    
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sloganLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .justified
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var viewBranchesButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .large
        config.imagePadding = 8
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(viewBranchesTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureUI()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(logoImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(sloganLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(viewBranchesButton)
        
        let contentViewHeight = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeight.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentViewHeight,
            
            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 120),
            logoImageView.heightAnchor.constraint(equalToConstant: 120),
            
            nameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            sloganLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            sloganLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            sloganLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: sloganLabel.bottomAnchor, constant: 24),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            viewBranchesButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 40),
            viewBranchesButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            viewBranchesButton.widthAnchor.constraint(equalToConstant: 220),
            viewBranchesButton.heightAnchor.constraint(equalToConstant: 50),
            viewBranchesButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    private func configureUI() {
        nameLabel.text = viewModel.storeName
        sloganLabel.text = viewModel.storeSlogan
        descriptionLabel.text = viewModel.storeDescription
        viewBranchesButton.setTitle(viewModel.viewBranchesButtonTitle, for: .normal)
        
        viewModel.loadLogo { [weak self] image in
            self?.logoImageView.image = image
        }
    }
    
    @objc private func viewBranchesTapped() {
        let branchListVC = BranchListTableViewController(list: viewModel.branches)
        navigationController?.pushViewController(branchListVC, animated: true)
    }
}
