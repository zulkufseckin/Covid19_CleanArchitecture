//
//  CountryDetailViewController.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import UIKit
import MapKit

protocol CountryDetailDisplayLogic: AnyObject {
    func displayCountryDetail(viewModel: CountryDetail.Fetch.ViewModel)
    func displayError()
}

final class CountryDetailViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    var bottomSheetViewController: UISheetPresentationController {
        presentationController as! UISheetPresentationController
    }
    
    var mapView = MKMapView()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var flagImageView: UIImageView!
    
    var interactor: CountryDetailBusinessLogic?
    var router: (CountryDetailRoutingLogic & CountryDetailDataPassing)?
    fileprivate var items = [(key: String, value: String)]()
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = CountryDetailInteractor()
        let presenter = CountryDetailPresenter()
        let router = CountryDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bottomSheetViewController.delegate = self
        bottomSheetViewController.selectedDetentIdentifier = .medium
        bottomSheetViewController.prefersGrabberVisible = true
        bottomSheetViewController.detents = [.medium(), .large()]
        
        interactor?.fetchCountryDetail(request: CountryDetail.Fetch.Request())
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(CountryDetailTableViewCell.self)
        
        mapView.mapType = .standard
        mapView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.width)
        tableView.tableFooterView = mapView
        
    }
    
}

extension CountryDetailViewController: CountryDetailDisplayLogic {
    
    func displayCountryDetail(viewModel: CountryDetail.Fetch.ViewModel) {
        flagImageView.sd_setImage(with: URL(string: (viewModel.countryInfo?.flag).stringValue))
        items.append((key: "Country", value: viewModel.country.stringValue))
        items.append((key: "Cases", value: viewModel.cases.stringValue))
        items.append((key: "Today Cases", value: viewModel.todayCases.stringValue))
        items.append((key: "Deaths", value: viewModel.deaths.stringValue))
        items.append((key: "Recovered", value: viewModel.recovered.stringValue))
        setMap(lat: (viewModel.countryInfo?.lat).doubleValue, long: (viewModel.countryInfo?.long).doubleValue)
        tableView.reloadData()
    }
    
    func setMap(lat: Double, long: Double) {
        let latitude: CLLocationDegrees = Double(lat)
        let longitude: CLLocationDegrees = Double(long)
        let span = MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, span: span)
        mapView.setRegion(regionSpan, animated: false)
        mapView.contentMode = .center
        mapView.isUserInteractionEnabled = false
    }
    
    func displayError() {
        showAlert()
    }
    
}

extension CountryDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryDetailTableViewCell = tableView.dequeueCell(indexPath: indexPath)
        let item = items[indexPath.row]
        cell.set(key: item.key, value: item.value)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
