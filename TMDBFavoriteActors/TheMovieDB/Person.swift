
import UIKit

import CoreData

class Person : NSManagedObject {
	
	struct Keys {
		static let Name = "name"
		static let ProfilePath = "profile_path"
		static let Movies = "movies"
		static let ID = "id"
	}
	
	@NSManaged var name: String
	@NSManaged var id: NSNumber
	@NSManaged var imagePath: String?
	@NSManaged var movies: [Movie]
	
	override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
		super.init(entity: entity, insertIntoManagedObjectContext: context)
	}
	
	
	init(dictionary: [String : AnyObject], context: NSManagedObjectContext) {
		let entity =  NSEntityDescription.entityForName("Person", inManagedObjectContext: context)!
		super.init(entity: entity,insertIntoManagedObjectContext: context)
		name = dictionary[Keys.Name] as! String
		id = dictionary[Keys.ID] as! Int
		imagePath = dictionary[Keys.ProfilePath] as? String
	}
	
	var image: UIImage? {
		get {
			return TheMovieDB.Caches.imageCache.imageWithIdentifier(imagePath)
		}
		
		set {
			TheMovieDB.Caches.imageCache.storeImage(image, withIdentifier: imagePath!)
		}
	}
}