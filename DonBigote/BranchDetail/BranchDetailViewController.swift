//
//  BranchDetailViewController.swift
//  DonBigote
//
//  Created by Eduardo Cruz on 24/01/26.
//

import UIKit
import MapKit

class BranchDetailViewController: UIViewController {

    private let viewModel: BranchDetailViewModel
    
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
    
    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.clipsToBounds = true
        return map
    }()
    
    private lazy var addressTitleLabel: UILabel = {
        createTitleLabel(text: "Dirección")
    }()
    
    private lazy var addressLabel: UILabel = {
        createValueLabel()
    }()
    
    private lazy var phoneTitleLabel: UILabel = {
        createTitleLabel(text: "Teléfono")
    }()
    
    private lazy var phoneLabel: UILabel = {
        createValueLabel()
    }()
    
    private lazy var hoursTitleLabel: UILabel = {
        createTitleLabel(text: "Horarios")
    }()
    
    private lazy var weekdaysLabel: UILabel = {
        createValueLabel()
    }()
    
    private lazy var saturdayLabel: UILabel = {
        createValueLabel()
    }()
    
    private lazy var sundayLabel: UILabel = {
        createValueLabel()
    }()
    
    private lazy var servicesTitleLabel: UILabel = {
        createTitleLabel(text: "Servicios")
    }()
    
    private lazy var servicesLabel: UILabel = {
        let label = createValueLabel()
        return label
    }()
    
    init(branch: DonBigotes.Branch) {
        self.viewModel = BranchDetailViewModel(branch: branch)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureUI()
        configureMap()
    }
    
    private func createTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func createValueLabel() -> UILabel {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(mapView)
        contentView.addSubview(addressTitleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(phoneTitleLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(hoursTitleLabel)
        contentView.addSubview(weekdaysLabel)
        contentView.addSubview(saturdayLabel)
        contentView.addSubview(sundayLabel)
        contentView.addSubview(servicesTitleLabel)
        contentView.addSubview(servicesLabel)
        
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
            
            mapView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 350),
            
            addressTitleLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 24),
            addressTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            addressLabel.topAnchor.constraint(equalTo: addressTitleLabel.bottomAnchor, constant: 4),
            addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            phoneTitleLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            phoneTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            phoneTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            phoneLabel.topAnchor.constraint(equalTo: phoneTitleLabel.bottomAnchor, constant: 4),
            phoneLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            hoursTitleLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 20),
            hoursTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            hoursTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            weekdaysLabel.topAnchor.constraint(equalTo: hoursTitleLabel.bottomAnchor, constant: 4),
            weekdaysLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weekdaysLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            saturdayLabel.topAnchor.constraint(equalTo: weekdaysLabel.bottomAnchor, constant: 4),
            saturdayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            saturdayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            sundayLabel.topAnchor.constraint(equalTo: saturdayLabel.bottomAnchor, constant: 4),
            sundayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sundayLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            servicesTitleLabel.topAnchor.constraint(equalTo: sundayLabel.bottomAnchor, constant: 20),
            servicesTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            servicesTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            servicesLabel.topAnchor.constraint(equalTo: servicesTitleLabel.bottomAnchor, constant: 4),
            servicesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            servicesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            servicesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
    private func configureUI() {
        addressLabel.text = viewModel.address
        phoneLabel.text = viewModel.phone
        weekdaysLabel.text = "Lun - Vie: \(viewModel.weekdaysHours)"
        saturdayLabel.text = "Sábado: \(viewModel.saturdayHours)"
        sundayLabel.text = "Domingo: \(viewModel.sundayHours)"
        servicesLabel.text = viewModel.servicesFormatted
    }
    
    private func configureMap() {
        let coordinate = viewModel.coordinate
        let region = MKCoordinateRegion(
            center: coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000
        )
        mapView.setRegion(region, animated: false)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = viewModel.branchName
        mapView.addAnnotation(annotation)
    }

}
