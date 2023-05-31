//
//  ViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit
import CoreLocation
import MapKit
import Firebase
//comment out for CAM for simulator
//import CoreML
//import Vision
import FloatingPanel
import SideMenu

//var placeholders
var XXX = [PollutionConditionModel]()
var YYY = [WeatherModelFutureValues]()
var la = 0
var bffText = ""
var NURFUERJETZTLATITUDE = 0.0
var DASAUCHFUERJETZTLONGITUDE = 0.0


class ViewController: UIViewController, MenuControllerDelegate {
    
    
    private var sideMenu: SideMenuNavigationController?
//    let wikipediaURl = "https://en.wikipedia.org/w/api.php"
//    let wikipediaURL = "https://en.wikipedia.org/w/api.php?action=query&list=search&srwhat=text&srsearch=Barberton+daisy&format=json"
    //responsible for API stuff
    var apiManager = APIManager()
    //responsible for getting hold of the current GPS location of the phone
    let locationManager = CLLocationManager()
    var previousLocation: CLLocation?
    var directionsArray: [MKDirections] = []
    //circle around annotation!!
//    var circles = [MKCircle]()
    var annotation = [MKPointAnnotation]()

    
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addAnnotationButton: UIButton!
    
    
    @IBOutlet weak var removeAnnotationButton: UIButton!
//    @IBOutlet weak var chatButton: UIButton!

    @IBOutlet weak var sideMenuButton: UIButton!
    
    
    
    @IBOutlet weak var searchCityButton: UIButton!
    
    
    
//    //comment out for CAM for simulator
//    let imagePicker = UIImagePickerController()
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    
    
    @IBAction func searchCityButtonPressed(_ sender: UIButton) {
        apiManager.fetchWeather(cityName: NURAUSPROBIEREN)
    }
    
    
    
    @IBAction func didTapMenuButton(){
        present(sideMenu!, animated: true)
    }
    
    
    func didSelectMenuItem(named: SideMenuItem) {
        
        sideMenu?.dismiss(animated: false, completion: nil)
            
            title = named.rawValue
            
            switch named {
            case .standardMapView:
                mapView.mapType = .standard
            case .mapView2D:
                mapView.mapType = .satellite
            case .mapView3D:
                let distance: CLLocationDistance = 800
                let pitch: CGFloat = 400
                let heading = 45.0
                //comment out for CAM for simulator
//                var camera: MKMapCamera?

                mapView.mapType = .satelliteFlyover

                //comment out for CAM for simulator
//                camera = MKMapCamera(lookingAtCenter: mapView.centerCoordinate, fromDistance: distance, pitch: pitch, heading: heading)
//                mapView.camera = camera!
            case .directions:
                //if no direction has been clicked yet and is displayed, direction shows
                if directionsArray.count == 0 {
                    getDirections()
                } else {
                    //otherwise remove the direction that the user has requested. So he has clicked a second time on direction
                    mapView.overlays.forEach {
                        if ($0 is MKPolyline) {
                            mapView.removeOverlay($0)
                        }
                    }
                    directionsArray = []
                }
            case .chat:
                performSegue(withIdentifier: Constants.chatSegue, sender: self)
            case .profile:
                performSegue(withIdentifier: Constants.loginSegue, sender: self)
            case .stockkarte:
                performSegue(withIdentifier: "ViewControllerToFlyerBuilder", sender: self)
            case .info:
                performSegue(withIdentifier: Constants.infoViewSegue, sender: self)
            }



    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        navigationController?.hidesBarsOnTap = true
        
        let menu = MenuController(with: SideMenuItem.allCases)
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        sideMenu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        
        //slide menu
//        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
        
        
        mapView.delegate = self
        //start the app with the satellite view
        mapView.mapType = .satellite
        
        
        
        
        let panel = FloatingPanelController()
        panel.set(contentViewController: FloatingPanelViewController())
        panel.addPanel(toParent: self)
        
        
        
        
        
        checkLocationServices()
        apiManager.delegate = self
        searchTextField.delegate = self
        searchTextField.placeholder = "Go to city"
        
        //YYYYYYYYY Button nicht mehr sichtbar
//        self.usersLocationButton.isHidden = true
//        checkLogin()
        
        
//        //comment out for CAM for simulator
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = .camera
        
        
        addAnnotationButton.layer.cornerRadius = 0.5 * addAnnotationButton.bounds.size.width
//        addAnnotationButton.rendering
        removeAnnotationButton.layer.cornerRadius = 0.5 * removeAnnotationButton.bounds.size.width
        sideMenuButton.layer.cornerRadius = 0.5 * sideMenuButton.bounds.size.width
        searchCityButton.layer.cornerRadius = 0.5 * searchCityButton.bounds.size.width
        

    }
    
    
    //stuff I tried with login
//    func checkLogin() {
//        if((Auth.auth().currentUser?.email) == nil){
//            self.addAnnotationButton.isHidden = true
//            self.removeAnnotationButton.isHidden = true
//            self.chatButton.isHidden = true
//        } else {
//            self.addAnnotationButton.isHidden = false
//            self.removeAnnotationButton.isHidden = false
//            self.chatButton.isHidden = false
//        }
//    }
    
    
//    @IBAction func buttonToWikiFlowerInfo(_ sender: UIButton) {
//        self.requestInfoFromWikipedia(flowerName: "sunflower")
//    }
    
    
//    @IBAction func bffButtonPressed(_ sender: UIButton) {
//        searchTextField.sendActions(for: UIControl.Event.editingChanged)
////        todo hier noch was machen. sieht mir unsicher aus
//        bffText = searchTextField.text!
//        if bffText != "" {
//
//            searchTextField.text = ""
//            searchTextField.endEditing(true)
////            self.performSegue(withIdentifier: "ViewControllerToWikiFlowerPageViewController", sender: self)
//
////            let ja = WikiFlowersPageViewController()
////            ja.requestInfoFromWikipedia(flowerName: bffText)
////            let ja = WikiFlowersPageViewController()
////            ja.requestInfoFromWikipedia(flowerName: bffText)
////            self.performSegue(withIdentifier: "ViewControllerToWikiFlowerPageViewController", sender: self)
//        }
//
//
//    }
    
    


    

    @IBAction func setAnnotationButtonClicked(_ sender: UIButton) {
        if NURAUSPROBIEREN != "" {
            setAnnotaion(title: NURAUSPROBIEREN)
//            NURAUSPROBIEREN = ""
        }
    }
    
    
    
    
    func setAnnotaion(title: String){
        let newLocation = MKPointAnnotation()
        newLocation.coordinate = mapView.centerCoordinate
        newLocation.title = title
        
        //circle around annotation!!
//        let circle = MKCircle(center: newLocation.coordinate, radius: 123)
//        circles.append(circle)
        //circle around annotation!!
//                mapView.removeOverlay(circle)
        self.annotation.append(newLocation)
        //update the view on the map with the new annotation
        mapView.addAnnotation(newLocation)
        
        
        //circle around annotation!!
//        mapView.addOverlay(circle)
        
    
//        mapView.removeOverlay(circle)
    }
    
    
    
    @IBAction func deleteAnnotationButtonClicked(_ sender: UIButton) {
        mapView.removeAnnotations(mapView.selectedAnnotations)


        //stuff I tried removing certain circles
//        mapView.removeOverlay(circle)
        
        
//        if circles.count > 0 {
            
            
//            mapView.removeOverlay(circles.last as! MKOverlay)
        
        
//            mapView.removeOverlay(circles.last!)
//        }
        
        
        
//        mapView.removeOverlay(circles[0])
//        mapView.removeOverlays(mapView.overlays)
//        mapView.removeOverlay(mapView.overlays as! MKOverlay)
//        mapView.overrideUserInterfaceStyle
//        mapView.removeOverlay(circles.last!)
//        if mapView.selectedAnnotations != [] {
//            mapView.removeAnnotations(mapView.selectedAnnotations)
//            mapView.removeOverlay(circles.last!)
//        }
//        mapView.removeAnnotations(mapView.selectedAnnotations)
//        if circles.count != 0 {
//            mapView.removeOverlay(circles.last!)
//        }

        //        mapView.removeOverlay(MKOverlay.)
        //        mapView.removeOverlay(<#T##overlay: MKOverlay##MKOverlay#>)
        //        mapView.removeOverlay(mapView.selectedAnnotations as! MKOverlay)

        //        mapView.removeOverlays(mapView.overlays)
        //        mapView.removeOverlay(mapView.
        //        mapView.removeOverlays(mapView.selectedAnnotations)

    }
    
    
    

    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            //Show alert letting the user know they have to turn this on.
        }
    }
    
    //once we have the authorization, we can do the stuff on the map regarding location
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            startTrackingUserLocation()
        case .denied:
            //Show alert instructing them how to turn on permissions
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            //Show an alert letting them know what's up
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
    
    func startTrackingUserLocation() {
        //shows the little blue dot on the map where the user currently is
        mapView.showsUserLocation = true
        centerViewOnUserLocation()
        locationManager.startUpdatingLocation()
        previousLocation = getCenterLocation(for: mapView)
    }
    
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    
    func getDirections() {
        guard let location = locationManager.location?.coordinate else {
            //nform user we don't have their current location
            return
        }
        
        let request = createDirectionsRequest(from: location)
        let directions = MKDirections(request: request)
        
        //pass new direction we just created and delete old one
        resetMapView(withNew: directions)
        
        //calculate directions
        directions.calculate { [unowned self] (response, error) in
            //andle error if needed
            guard let response = response else { return } //TODO: Show response not available in an alert
            
            //array of routes because we said requestAlternateRoutes = true down there
            for route in response.routes {
                self.mapView.addOverlay(route.polyline)
                self.mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
            }
        }
    }
    
    func createDirectionsRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request {
        let destionationCoordinate      = getCenterLocation(for: mapView).coordinate
        let startingLocation            = MKPlacemark(coordinate: coordinate)
        //center of the map where our pin is
        let destination                 = MKPlacemark(coordinate: destionationCoordinate)
        
        let request                     = MKDirections.Request()
        request.source                  = MKMapItem(placemark: startingLocation)
        request.destination             = MKMapItem(placemark: destination)
        //transportType can be selected here
        request.transportType           = .automobile
        //if it should show alternate routes
        request.requestsAlternateRoutes = false
        
        return request
    }
    
    //removes all existing overlays if user clicks on new directions button
    func resetMapView(withNew directions: MKDirections) {
        //        mapView.removeOverlays(mapView.overlays)
        directionsArray.append(directions)
        let _  = directionsArray.map {$0.cancel()}
    }
}


//MARK: - MKMapViewDelegate

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        //center of the map
        let center = getCenterLocation(for: mapView)
        let geoCoder = CLGeocoder()
        
        //makes sure previousLocation is not nil
        guard let previousLocation = self.previousLocation else { return }
        guard center.distance(from: previousLocation) > 50 else { return }
        //old location to new location
        self.previousLocation = center
        //cancel request so we don't have a bunch of stacked up
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(center) { [weak self] (placemarks, error) in
            guard let self = self else { return }
            
            //check for error
            if let _ = error {
                //Show alert informing the user
                return
            }
            //make sure we have a placemark
            guard let placemark = placemarks?.first else {
                //Show alert informing the user
                return
            }
            
            //set up address
            //Additional street-level information for the placemark. if name gets awkward leave string empty
            let streetNumber = placemark.subThoroughfare ?? ""
            //The street address associated with the placemark. if name gets awkward leave string empty
            let streetName = placemark.thoroughfare ?? ""
            let cityName = placemark.administrativeArea ?? ""
            
            //Activate this, so that the values are automatically updated where the "mouse" indicates, then the button for updating can also be omitted

            //api button
//            var NURFUERJETZTLATITUDE = mapView.centerCoordinate.latitude
//            var DASAUCHFUERJETZTLONGITUDE = mapView.centerCoordinate.longitude
//            self.apiManager.fetchWeather(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
            NURFUERJETZTLATITUDE = mapView.centerCoordinate.latitude
            DASAUCHFUERJETZTLONGITUDE = mapView.centerCoordinate.longitude

            let streetNameForFloatingPanel = "\(cityName), \(streetName) \(streetNumber)"
            NotificationCenter.default.post(name: Notification.Name("streetnameUpdate"), object: streetNameForFloatingPanel)

            
        }
    }
    
    
    //circle around annotation!!
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if la == 0 {
        if overlay.isKind(of: MKCircle.self){
            let circleRenderer = MKCircleRenderer(overlay: overlay)
            circleRenderer.fillColor = UIColor.red.withAlphaComponent(0.1)
            circleRenderer.strokeColor = UIColor.red
            circleRenderer.lineWidth = 1
            la += 1
            return circleRenderer
        }} else if la == 1 || la == 2 {
            if overlay.isKind(of: MKCircle.self){
                let circleRenderer = MKCircleRenderer(overlay: overlay)
                circleRenderer.fillColor = UIColor.blue.withAlphaComponent(0.1)
                circleRenderer.strokeColor = UIColor.blue
                circleRenderer.lineWidth = 1
                la += 1
                return circleRenderer
            }} else {
                if overlay.isKind(of: MKCircle.self){
                    let circleRenderer = MKCircleRenderer(overlay: overlay)
                    circleRenderer.fillColor = UIColor.green.withAlphaComponent(0.1)
                    circleRenderer.strokeColor = UIColor.green
                    circleRenderer.lineWidth = 1
                    return circleRenderer
                }}
        
        
        
        
        if overlay.isKind(of: MKPolyline.self){
            let polylineRenderer = MKPolylineRenderer(overlay: overlay)
            polylineRenderer.strokeColor = UIColor.blue
            polylineRenderer.lineWidth = 2
            return polylineRenderer
        }
        
        return MKOverlayRenderer(overlay: overlay)
    }
    
}
//MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    // When user press the return key in keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismisses the keyboard
        searchTextField.endEditing(true)
        return true
    }
    
    //use searchTextField to get weather for the entered city
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            apiManager.fetchWeather(cityName: city)
            
        }
        
        //empty searchfield after user used it
//        searchTextField.text = ""
//        self.centerViewOnUserLocation(lon: YYY[0].lon, lat: YYY[0].lat)
    }
    
}

//MARK: - APIManagerDelegate

extension ViewController: APIManagerDelegate {
    
    
    func didUpdateFutureWeather(_ apiManager: APIManager, weather: [WeatherModelFutureValues]){
        
                YYY = weather
        
    }
    //von APIManager kommen die Werte hier rüber zum anzeigen
    func didUpdateWeather(_ apiManager: APIManager, weather: WeatherConditionModel){
        DispatchQueue.main.async {
            
            
//            if self.searchTextField.text != "" {
            if NURAUSPROBIEREN != "" {
                self.centerViewOnSearchedLocation(lon: weather.lon, lat: weather.lat)
            }
//                self.searchTextField.text = ""
//            }

        }
    }
    
    func didUpdatePollution(_ apiManager: APIManager, pollution: PollutionConditionModel){
        DispatchQueue.main.async {
        }
    }
    
    func didUpdatePollutionForecast(_ apiManager: APIManager, pollution: [PollutionConditionModel]){
        XXX = pollution
    }
    
    //error handling is only printed to the console, because it comes from APIManager and the user does not need to see this error message
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

//MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //in locations is an array with the last locations
        if let location = locations.last {
            //stopped location tracking
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            NURFUERJETZTLATITUDE = location.coordinate.latitude
            DASAUCHFUERJETZTLONGITUDE = location.coordinate.longitude
            //get weather data from coordinates
            apiManager.fetchWeather(latitude: lat, longitude: lon)
//            apiManager.fetchFutureWeather(latitude: lat, longitude: lon)
            mapView.showsUserLocation = true
            //zoom in on user's current location
//            centerViewOnUserLocation()
        }
    }
    
    //zoom in on user's current location
    func centerViewOnUserLocation() {
        //if we have location and it is not nil
        if let location = locationManager.location?.coordinate {
            //we create a region, MK = Map Kit, center = users location and how much we want it to zoomed in in meters
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
            mapView.setRegion(region, animated: false)
        }
    }

    //    zoom in on user's search for a city
    public func centerViewOnSearchedLocation(lon: Double, lat: Double){
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        let region = MKCoordinateRegion.init(center: location, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: false)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}



//extension UIButton {
//    func applyDesingViewController() {
//        self.backgroundColor = .clear
//        self.layer.cornerRadius = 0.5 * self.bounds.size.width
////        self.backgroundColor = .systemBackground
//        self.layer.borderWidth = 3
//        self.layer.borderColor = UIColor.black.cgColor
//    }
//}

