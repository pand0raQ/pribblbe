//author -tag1
//image-  tag 2
//title - tag 3
//desctag-tag 4
import Foundation
import UIKit
import Alamofire


extension String {
    func deleteHTMLTag(_ tag:String) -> String {
        return self.replacingOccurrences(of: "(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
    }
    
    func deleteHTMLTags(_ tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag)
        }
        return mutableString
    }
}

protocol OptionalType {
    associatedtype Wrapped
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType {}

extension Sequence where Iterator.Element: OptionalType {
    func removeNils() -> [Iterator.Element.Wrapped] {
        var result: [Iterator.Element.Wrapped] = []
        for element in self {
            if let element = element.map({ $0 }) {
                result.append(element)
            }
        }
        return result
    }
}
class ShotsData: UITableViewController{
    
        var _imageView = [String]()
        var _title = [String]()
        var _author = [String]()
    var _description = [String]()
    var ifDescEmpty = "-"
    
    
      // let tags: [String] = ["<p>","</p>","<br />"]
    
        override func viewDidLoad() {
        super.viewDidLoad()
                Alamofire.request("https://api.dribbble.com/v1/shots?sort=recent&access_token=5c8e7982292e7a921449d857d5a6c5c2695825c14cae8bdf6b3af2f1484eb08e").responseJSON { response in
           let result = response.result
                    if let descriptionDict = result.value as? [Dictionary <String, AnyObject>]{
                        if let desc = descriptionDict [0] ["description"]{
                            if ((desc as? String) != nil) {
                                                                        //let withoutHTMLString = desc.deleteHTMLTag("p")
                            self._description.append(desc as! String)
                            }
                            else {
                                
                           self._description.append(self.ifDescEmpty)
        print(desc as! String)
                        }
                        }

                        if let desc = descriptionDict [1] ["description"] {
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                           print(desc as! String)
                            }
                        }
                        
                        if let desc = descriptionDict [2] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                             print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [3] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                             print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [4] ["description"] {
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                              print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [5] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                              print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [6] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                               print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [7] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                               print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [8] ["description"] {
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                              print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [9] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                              print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [10] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                               print(desc)
                            }
                        }
                        
                        if let desc = descriptionDict [11] ["description"]{
                            if ((desc as? String) != nil) {
                                //let withoutHTMLString = desc.deleteHTMLTag("p")
                                self._description.append(desc as! String)
                            }
                            else {
                                
                                self._description.append(self.ifDescEmpty)
                               print(desc)
                            }
                        }
                        
 ////////////////////////////////////////////////
                            if let authorDict = result.value as? [Dictionary <String, AnyObject>]{
                        if let autho = authorDict [0] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                    }
                        if let autho = authorDict [1] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [2] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [3] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [4] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [5] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [6] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [7] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [8] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [9] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [10] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
                        if let autho = authorDict [11] ["user"] as? Dictionary <String, AnyObject>{
                            if let author = autho ["username"] as? String {
                                self._author.append(author)
                                
                            }
                        }
/////////////////////// Title
                    if let titleDict = result.value as? [Dictionary <String, AnyObject>]{
                        if let titl = titleDict [0] ["title"] as? String {
                            self._title.append(titl)
                            print(titl)
                        }
                        if let titl = titleDict [1] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [2] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [3] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [4] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [5] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [6] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [7] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [8] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [9] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [10] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                        if let titl = titleDict [11] ["title"] as? String {
                            self._title.append(titl)
                             print(titl)
                        }
                       
                    }
/////////////////////// Images
                    if let imagesDict = result.value as? [Dictionary <String, AnyObject>]{
                        if let images = imagesDict [0] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                    if imgres == "null"{
                                        print("oupsbro")}
                                        else{
                                     if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                }
                            }
                        }
                            
                    }
                        if let images = imagesDict [1] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [2] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [3] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [4] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [5] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [6] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [7] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [8] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [9] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [10] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    }
                                }
                            }
                            
                        }
                        if let images = imagesDict [11] ["images"] as? Dictionary <String, AnyObject>{
                            
                            if let imgres = images["hidpi"] as? String{
                                if imgres == "null"{
                                    print("oupsbro")}
                                else{
                                    if let imgres = images["normal"] as? String{
                                        self._imageView.append(imgres)
                                    
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }

                    self.tableView.reloadData()
        }
        
    }
  override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self._title.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        let descLabel = cell?.viewWithTag(4) as! UILabel
        descLabel.text = _description[indexPath.row]
        
        let titleLabel = cell?.viewWithTag(3) as! UILabel
        titleLabel.text = _title[indexPath.row]
        
        let authorsLabel = cell?.viewWithTag(1) as! UILabel
        authorsLabel.text = _author[indexPath.row]
        
      let Image  = cell?.viewWithTag(2) as! UIImageView
      Image.sd_setImage(with: URL(string: _imageView[indexPath.row]))
        
        return cell!
    }

}

