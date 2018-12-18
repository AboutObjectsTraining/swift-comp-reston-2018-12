import UIKit

class ReadingListController: UITableViewController
{
    @IBOutlet var dataSource: DataSource!
    
    
    // MARK: - Unwind segues
    
    @IBAction func done(segue: UIStoryboardSegue) {
        // TODO: sync UI and save
    }
    
    @IBAction func cancel(segue: UIStoryboardSegue) {
        // Intentionally left blank ;-)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            let indexPath = tableView.indexPathForSelectedRow,
            let controller = segue.destination as? BookDetailController else { return }
     
        controller.book = dataSource.book(at: indexPath)
    }
}




// MARK: - UITableViewDataSource
//extension ReadingListController
//{
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 100
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Book")
//
//        cell?.textLabel?.text = "Row \(indexPath.row + 1)"
//
//        return cell!
//    }
//
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        var cell = tableView.dequeueReusableCell(withIdentifier: "Book Things")
//
//        if cell == nil {
//            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Book Things")
//            cell?.textLabel?.text = "Row \(indexPath.row + 1)"
//        }
//
//        guard let unwrappedCell = cell else {
//            fatalError("Unable to create a cell")
//        }
//
//        return unwrappedCell
//    }
//}
