//
//  ViewController.swift
//  ZennSectionIndexTitlesSample
//
//  Created by Shunya Yamada on 2021/02/23.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: IBOutlet

    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Properties
    
    private var searchController: UISearchController = {
        let searchController = UISearchController()
        searchController.showsSearchResultsController = false
        searchController.automaticallyShowsCancelButton = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        return searchController
    }()
    
    private var sections = DataSources.data
    
    /// `sectionIndexTitles` の伸縮アニメーションの ON と OFF を管理するフラグ
    private var isAnimationOn = false
    
    // MARK: Lifecycle
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureObserver()
        configureTableView()
        configureNavigation()
    }
}

// MARK: - Configurations

extension ViewController {
    
    private func configureObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHideNotification), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = TableViewCell.rowHeight
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.reuseIdentifier)
    }
    
    private func configureNavigation() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "オフ", style: .done, target: self, action: #selector(onTapRightBarButtonItem(_:)))
    }
    
    @objc private func onTapRightBarButtonItem(_ sender: UIBarButtonItem) {
        isAnimationOn.toggle()
        sender.title = isAnimationOn ? "オン" : "オフ"
    }
}

// MARK: - Notification Center

extension ViewController {
    
    @objc private func handleKeyboardWillShowNotification(_ notification: Notification?) {
        guard let frame = notification?.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let height = frame.cgRectValue.height
        
        if isAnimationOn {
            // NOTE: ここで指定した `duration` で `sectionIndexTitles` はアニメーションしてくれない
            UIView.animate(withDuration: 0.3) {
                self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
                self.tableView.layoutIfNeeded()
            }
            return
        }
        
        UIView.performWithoutAnimation {
            self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
            self.tableView.layoutIfNeeded()
        }
    }
    
    @objc private func handleKeyboardWillHideNotification() {
        if isAnimationOn {
            // NOTE: ここで指定した `duration` で `sectionIndexTitles` はアニメーションしてくれない
            UIView.animate(withDuration: 0.3) {
                self.tableView.contentInset = .zero
                self.tableView.layoutIfNeeded()
            }
            return
        }
        
        UIView.performWithoutAnimation {
            self.tableView.contentInset = .zero
            self.tableView.layoutIfNeeded()
        }
    }
}

// MARK: - TableView DataSource

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections.map { $0.title }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as! TableViewCell
        cell.configureCell(title: data.name)
        return cell
    }
}

// MARK: - TableView Delegate

extension ViewController: UITableViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        searchController.searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
