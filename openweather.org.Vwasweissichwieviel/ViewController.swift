//
//  ViewController.swift
//  openweather.org.Vwasweissichwieviel
//
//  Created by Nicolai Kaschta on 24.06.16.
//  Copyright © 2016 Nicolai Kaschta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        connect()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var data = NSMutableData()
    
    @IBOutlet weak var temperatur: UILabel!
    @IBOutlet weak var ort: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var tempmin: UILabel!
    @IBOutlet weak var tempmax: UILabel!
    
    func connect(){
        let url: String = ""
        let nsUrl: NSURL = NSURL(string: url)!
        let request: NSURLRequest = NSURLRequest(URL: nsUrl)
        let nsURLConnection: NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: false)!
        nsURLConnection.start()
    }
    
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        
        let jsonData: NSDictionary
        do {
            jsonData = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            
            
            let main: NSDictionary = jsonData["main"] as! NSDictionary
            let tempKelvin = main["temp"] as! Double
            let tempCelsius = tempKelvin - 273.15
            temperatur.text = (NSString(format: "%.2f", tempCelsius) as String)+" °C" as String
            let tempMinKelvin = main["temp_min"] as! Double
            let tempMinCelsius = tempMinKelvin - 273.15
            tempmin.text = (NSString(format: "%.2f", tempCelsius) as String)+" °C" as String
            let tempMaxKelvin = main["temp_max"] as! Double
            let tempMaxCelsius = tempMaxKelvin - 273.15
            tempmax.text = (NSString(format: "%.2f", tempCelsius) as String)+" °C" as String
            let druck = main["pressure"] as! Double
            ort.text = (NSString(format: "%.0f", druck) as String)+" hPa" as String
            let weather: NSArray = (jsonData["weather"] as? NSArray)!
            let weatherData: NSDictionary = weather[0] as! NSDictionary
            let description = String(weatherData["description"] as! NSString)
            self.condition.text = description
            //let icon = String(weatherData["icon"] as! NSString)
            //let image1 = UIImage(named: icon)
            //self.weatherImage.image = image1
            
        } catch {
            print("Fehler aufgetreten!")
            }
    }
}