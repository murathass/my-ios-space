//
//  ViewController.swift
//  Travel Map book
//
//  Created by Murat Has on 22.09.2017.
//  Copyright © 2017 biotek. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import CoreData

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    @IBOutlet weak var placeNameTF: UITextField!
    @IBOutlet weak var noteTF: UITextField!
    
    var choosenLatitude  = Double()
    var choosenLongitude = Double()
    
    var selectedTitle = ""
    var selectedSubTitle = ""
    var selectedLatitude:Double = 0
    var selectedLongitude:Double = 0
    
    var requestCLLocation = CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MapVC.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        
        if selectedTitle != "" {
            placeNameTF.text = selectedTitle
            noteTF.text = selectedSubTitle
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = selectedLatitude
            annotation.coordinate.longitude = selectedLongitude
            annotation.title = selectedTitle
            annotation.subtitle = selectedSubTitle
            self.mapView.addAnnotation(annotation)
            
        }
        
        self.mapView.delegate = self
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(MapVC.choosePoint(gestureRecognizer:)))
        gesture.minimumPressDuration = 1.5
        self.mapView.addGestureRecognizer(gesture)
        
    }
    
    
    
    func choosePoint(gestureRecognizer : UILongPressGestureRecognizer ){
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = gestureRecognizer.location(in: self.mapView)
            let choosenCoordinates = self.mapView.convert(touchPoint, toCoordinateFrom: self.mapView)
            
            self.choosenLatitude = choosenCoordinates.latitude
            self.choosenLongitude = choosenCoordinates.longitude
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = choosenCoordinates
            annotation.title = self.placeNameTF.text
            annotation.subtitle = self.noteTF.text
            self.mapView.addAnnotation(annotation)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        
        // Konuma Zoom Yapan Kısım
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        //Kullanıcının oluşturdugu sistemden gelen bir anatotaion ise bişey yapmıyoruz
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseID = "myAnnotation"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseID) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseID)
            pinView?.canShowCallout = true
            pinView?.pinTintColor = UIColor.black
            
            let button = UIButton(type: UIButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        }else{
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
    
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl)
    {
        if selectedLatitude != 0 {
            if selectedLongitude != 0 {
                self.requestCLLocation = CLLocation(latitude: selectedLatitude, longitude: selectedLongitude)
            }
        }
        
        CLGeocoder().reverseGeocodeLocation(requestCLLocation) { (placemarks, error) in
            if let placemark = placemarks {
                
                if placemark.count > 0 {
                    
                    let newPlacemark = MKPlacemark(placemark: placemark[0])
                    let item = MKMapItem(placemark: newPlacemark)
                    item.name = self.selectedTitle
                    
                    let launchOptions = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                    item.openInMaps(launchOptions: launchOptions)
                    
                }
                
                
            }
            
        }
    }
    
    @IBAction func saved(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newPlace = NSEntityDescription.insertNewObject(forEntityName: "Place", into: context)
        
        newPlace.setValue(self.placeNameTF.text, forKey: "title")
        newPlace.setValue(self.noteTF.text, forKey: "subtitle")
        newPlace.setValue(choosenLatitude, forKey: "latitude")
        newPlace.setValue(choosenLongitude, forKey: "longitude")
        
        do{
            try context.save()
            print("saved")
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PlaceReflesh"), object: nil)
            self.navigationController?.popViewController(animated: true)
 
        }catch{
            print("error")
        }
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
}

