import UIKit
import ReadingListModel

class BookDetailController: UITableViewController
{
    var book: Book?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    // MARK: - Unwind Segues
    @IBAction func cancel(segue: UIStoryboardSegue) {
        // Intentionally left blank ;-)
    }
}
