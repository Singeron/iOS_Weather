

import UIKit

class AllCitiesCell: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel! // вывели название в ячейку
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
