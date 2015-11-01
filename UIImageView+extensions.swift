extension UIImageView {
    // Function to load UIImage by `link`
    // `filter` is closure to modify original UIImage before set to UIImageView,  
    // by default is nil that mean - set original image
    func downloadedFrom(link:String, filter: (UIImage? -> UIImage!)? = nil) {
        guard let url = NSURL(string: link) else {
            return
        }
        NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: {
            data, _, error in
                guard let data = data where error == nil else {
                    return
                }
                dispatch_async(dispatch_get_main_queue()) {
                    self.image = filter != nil ?
                        filter!(UIImage(data: data)) :
                        UIImage(data: data)
                }
            }
        ).resume()
    }
}
