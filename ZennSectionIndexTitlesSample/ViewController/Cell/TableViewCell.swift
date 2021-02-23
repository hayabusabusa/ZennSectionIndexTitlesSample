//
//  TableViewCell.swift
//  ZennSectionIndexTitlesSample
//
//  Created by Shunya Yamada on 2021/02/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: IBOutlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    // MARK: Properties
    
    static let rowHeight: CGFloat = 40
    static let reuseIdentifier: String = "TableViewCell"
    static let nib: UINib = UINib(nibName: "TableViewCell", bundle: nil)
    
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Configurations
    
    func configureCell(title: String) {
        titleLabel.text = title
    }
}
