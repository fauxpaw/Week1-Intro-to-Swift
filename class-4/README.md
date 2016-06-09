#Week 1 - Class 4
##Homework
* Download starter project; create individual files for each class / protocol you created yesterday
* In HomeViewController find `tableView:numberOfRowsInSection:` function and return using `Store` return number of objects it should display
* In HomeViewController find `configureCell:` implement it by first getting an object from `Store` for `indexPath.row` and set the `cell.textLabel.text` to item.itemDescription
* In HomeViewController find `tableView:commitEditingStyle…` Use `Store` to remove object for `indexPath.row`
* In NewItemViewController find `saveButtonSelected:` function and create item using description variable. Add the item to the `Store`
* Add save function to `ObjectStoreProtocol`. Provide default implementation for simply writing array of objects to the filesystem
* **Bonus**:
  * Create Additions file and extend String and NSURL. String: archivePath -> String; NSURL: documentsDirectory -> NSURL and archiveURL -> NSURL
  * Conform your Model class to `NSCoding` protocol and implement required methods
  * Modify Store `init {}` method to unarchive first. If `nil,` initialize objects array
  * Test your app

###Reading Assignment
* Swift Programming Guide
  * Enums
  * Properties
  * Methods
  * Error Handling
  * Generics
  * [Functional Programming](https://www.raywenderlich.com/82599/swift-functional-programming-tutorial)
  * [Protocol Oriented Programming](https://developer.apple.com/videos/play/wwdc2015/408/)

##Other Resources
* [Reading Assignments](../../Resources/ra-grading-standard/)
* [Grading Rubrics](../../Resources/)
* [Lecture Resources](lecture/)
* [Lecture Slides](https://www.icloud.com/keynote/000U6vesUJwxPXIHFk2bnURYw#Week1_Day4)
