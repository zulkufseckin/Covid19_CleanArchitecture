//
//  CountryListViewController.swift
//  covid19
//
//  Created by Z.Seckin on 3.11.2021.
//

import UIKit

protocol CountryListDisplayLogic: AnyObject {
    func displayCountryList(viewModel: CountryList.Fetch.ViewModel)
    func displayError()
}

final class CountryListViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet var tableView: UITableView!
    
    var interactor: CountryListBusinessLogic?
    var router: (CountryListRoutingLogic & CountryListDataPassing)?
    private var items: [CountryTableViewCell.ViewModel] = []
    
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
        let interactor = CountryListInteractor()
        let presenter = CountryListPresenter()
        let router = CountryListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Countries"
        
        interactor?.fetchCountryList(request: CountryList.Fetch.Request())
        setupViews()
    }
    
    func setupViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNib(CountryTableViewCell.self)
    }
}

extension CountryListViewController: CountryListDisplayLogic {
    
    func displayCountryList(viewModel: CountryList.Fetch.ViewModel) {
        items = viewModel.items
        tableView.reloadData()
    }
    
    func displayError() {
        showAlert()
    }
    
}

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountryTableViewCell = tableView.dequeueCell(indexPath: indexPath)
        cell.viewModel = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        router?.routeToCountryDetail(country: items[indexPath.row].name)
    }
}
