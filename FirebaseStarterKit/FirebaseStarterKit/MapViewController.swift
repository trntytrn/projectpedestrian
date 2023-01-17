/*
 * Copyright 2016 Google Inc. All rights reserved.
 *
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this
 * file except in compliance with the License. You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under
 * the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
 * ANY KIND, either express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
 */

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var button:UIButton!


  // [START maps_ios_current_place_declare_params]
  var locationManager: CLLocationManager!
  var currentLocation: CLLocation?
  var placesClient: GMSPlacesClient!
  var preciseLocationZoomLevel: Float = 15.0
  var approximateLocationZoomLevel: Float = 10.0
  // [END maps_ios_current_place_declare_params]

  // [START maps_ios_current_place_places_params]
  // An array to hold the list of likely places.
  var likelyPlaces: [GMSPlace] = []

  // The currently selected place.
  var selectedPlace: GMSPlace?
  // [END maps_ios_current_place_places_params]

  // [START maps_ios_current_place_unwindtomain]
  // Update the map once the user has made their selection.
  @IBAction func unwindToMain(segue: UIStoryboardSegue) {
    // Clear the map.
    mapView.clear()

    // Add a marker to the map.
    if let place = selectedPlace {
      let marker = GMSMarker(position: place.coordinate)
      marker.title = selectedPlace?.name
      marker.snippet = selectedPlace?.formattedAddress
      marker.map = mapView
    }

    listLikelyPlaces()
  }
  // [END maps_ios_current_place_unwindtomain]

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // [START maps_ios_current_place_init_params]
    // Initialize the location manager.
    locationManager = CLLocationManager()
    locationManager.desiredAccuracy = kCLLocationAccuracyBest
    locationManager.requestWhenInUseAuthorization()
    locationManager.distanceFilter = 50
    locationManager.startUpdatingLocation()
    locationManager.delegate = self

    placesClient = GMSPlacesClient.shared()
    // [END maps_ios_current_place_init_params]
      
    // [START maps_ios_current_place_create_a_map]
    // A default location to use when location permission is not granted.
    let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
    
    // Create a map.
    let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                          longitude: defaultLocation.coordinate.longitude,
                                          zoom: 15)
    mapView = GMSMapView.map(withFrame: view.bounds, camera: camera)
    mapView.settings.myLocationButton = true
    mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    mapView.isMyLocationEnabled = true

    // Add the map to the view, hide it until we've got a location update.
    // [END maps_ios_current_place_create_a_map]
   

  }
    @IBAction func openHome(sender: AnyObject) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"HomeViewController")
            self.present(vc, animated: true, completion: nil);
    }

  // [START maps_ios_current_place_list_likely_places]
  // Populate the array with the list of likely places.
  func listLikelyPlaces() {
    // Clean up from previous sessions.
    likelyPlaces.removeAll()

    let placeFields: GMSPlaceField = [.name, .coordinate]
    placesClient.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: placeFields) { (placeLikelihoods, error) in
      guard error == nil else {
        // TODO: Handle the error.
        print("Current Place error: \(error!.localizedDescription)")
        return
      }

      guard let placeLikelihoods = placeLikelihoods else {
        print("No places found.")
        return
      }
      
      // Get likely places and add to the list.
      for likelihood in placeLikelihoods {
        let place = likelihood.place
        self.likelyPlaces.append(place)
      }
    }
  }
  // [END maps_ios_current_place_list_likely_places]

  // [START maps_ios_current_place_segue]
  // Prepare the segue.
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "segueToSelect" {
      if let nextViewController = segue.destination as? PlacesViewController {
        nextViewController.likelyPlaces = likelyPlaces
      }
    }
  }
  // [END maps_ios_current_place_segue]
}

// [START maps_ios_current_place_location_manager_delegate]
// Delegates to handle events for the location manager.
extension MapViewController: CLLocationManagerDelegate {

  // Handle incoming location events.
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location: CLLocation = locations.last!
    print("Location: \(location)")

    let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                          longitude: location.coordinate.longitude,
                                          zoom: 15)

    if mapView.isHidden {
      mapView.isHidden = false
      mapView.camera = camera
    } else {
      mapView.animate(to: camera)
    }

    listLikelyPlaces()
  }

 
  
  // Handle location manager errors.
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    locationManager.stopUpdatingLocation()
    print("Error: \(error)")
  }
    
    
}
// [END maps_ios_current_place_location_manager_delegate]

extension MapViewController {
    @IBAction func unwindHome(segue: UIStoryboardSegue) {
    }
  }
  
