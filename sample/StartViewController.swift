//
//  StartViewController.swift
//  sample
//
//  Created by Sanish Aukhale on 21/02/23.
//

import UIKit

class StartViewController: UIViewController{
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var progressIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad()  {
        loadData()
        super.viewDidLoad()
        
        
    }
    
    private var fact: FactModel? {
        didSet{
            guard let fact = fact else {return}
            labelText.text = "\(fact.text)"
            labelText.isHidden = false
            progressIndicator.isHidden = true
        }
    }
    
    @IBAction func buttonAction(_ sender: Any)  {
        nextButton.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        
    }
    
    private var dataTask: URLSessionDataTask?
    
    @objc private func loadData()  {
        progressIndicator.isHidden = false
        labelText.isHidden = true
        progressIndicator.startAnimating()
        guard let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en") else {
            return
        }
        dataTask?.cancel()
        dataTask = URLSession.shared.dataTask(with: url){
            data,responds, error in
            guard let data = data else { return }
            if let decodedResponse = try? JSONDecoder().decode(FactModel.self, from: data) {
                DispatchQueue.main.async {
                    self.fact = decodedResponse
                }
            }
        }
        
        dataTask?.resume()
        
    }
    
    
}
