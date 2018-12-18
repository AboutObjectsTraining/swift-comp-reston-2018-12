import UIKit
import ReadingListModel

class DataSource: NSObject
{
    @IBOutlet var store: ReadingListStore!
    
    lazy var readingList = store.fetchedReadingList
    
    func book(at indexPath: IndexPath) -> Book {
        return readingList.books[indexPath.row]
    }
}

extension DataSource: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book") else {
            fatalError("Unable to find prototype cell named 'Book' in storyboard")
        }
        
        let book = readingList.books[indexPath.row]
        
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year ?? "----")  \(book.author?.fullName ?? "Unknown")"
        
        return cell
    }
 }
