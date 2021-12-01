//
//  MapViewController.swift
//  peddler
//
//  Created by User on 29.11.2021.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var Map: MKMapView!
    override func viewDidLoad() {
        
        let africaSos = MKPointAnnotation()
        africaSos.title = "Africa assistance"
        africaSos.coordinate = CLLocationCoordinate2D(latitude: 36.8492352, longitude: 10.1979002)
        let esprit = MKPointAnnotation()
        esprit.title = "Esprit"
        esprit.coordinate = CLLocationCoordinate2D(latitude: 36.898943, longitude: 10.189758)
        Map.addAnnotation(africaSos)
        Map.addAnnotation(esprit)
                // Do any additional setup after loading the view.
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else {return nil}
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        }else{
            annotationView!.annotation = annotation
        }
        return annotationView
    }
    
}
        

      

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


