//
//  LinkDetailController.swift
//  Nasa Api Tests
//
//  Created by Chrystian on 31/10/18.
//  Copyright © 2018 Chrystian Salgado. All rights reserved.
//

import UIKit

class LinkDetailController: UIViewController {
    
    @IBOutlet weak var ivDesImage: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    
    var nasaApodObj: ApodObjModel!
    var selectedApi: NasaFeedModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40, height: 40)
        activityIndicator.color = .blue
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        guard let _selectedApi = selectedApi else { return }
        
        getData(selected: _selectedApi.apiType) { (data) in
            if let apodObj = data as? ApodObjModel {
                self.nasaApodObj = apodObj
                if let image = self.nasaApodObj.hdurl {
                    self.ivDesImage.image = UIImage().getImage(from: image)
                }
                
                self.lbTitle.text = self.nasaApodObj.title
                
                if let explanation = self.nasaApodObj.explanation {
                    self.lbDescription.text = explanation
                }
            }
            activityIndicator.stopAnimating()
        }
    }
    
    private func getData(selected api: AvailableApis, completionHandler: @escaping (Any?) -> Void) {
        NetworkManager().getDataFromApi(api: api) { (data, error) in
            
            if let _data = data {
                completionHandler(_data)
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func actionBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIImage {
    
    func getImage(from url: String) -> UIImage? {
        guard let imageURL = URL(string: url) else { return nil }
        
        do {
            return UIImage(data: try Data(contentsOf: imageURL))
            
        } catch {
            return nil
        }
    }
}
