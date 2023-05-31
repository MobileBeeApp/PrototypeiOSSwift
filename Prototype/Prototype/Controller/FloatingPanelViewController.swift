//
//  FloatingPanelViewController.swift
//  Prototype
//
//  Created by Eugen Puzynin.
//

import UIKit
//comment out for CAM for simulator
//import Vision
import CoreML

//var placeholder
var NURAUSPROBIEREN = ""
class FloatingPanelViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var apiManager = APIManager()
    var observer: NSObjectProtocol?
    
    //comment out for CAM for simulator
//    let imagePicker = UIImagePickerController()
    

    private let labelEAQIValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelUVValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelPM25Value: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelPM10Value: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelNO2Value: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelOValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelSOValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCOValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelNOValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelNHValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
    private let labelTempValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()

    private let labelHumidValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelWindValue: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelStreetName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelStreetNameForWeatherAndPollution: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        // Create a new Attributed String
        let attributedString = NSMutableAttributedString.init(string: " ")
        // Add Underline Style Attribute.
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString
        return label
    }()
    
    private let labelWeatherString: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        // Create a new Attributed String
        let attributedString = NSMutableAttributedString.init(string: " ")
        // Add Underline Style Attribute.
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: 1, range:
            NSRange.init(location: 0, length: attributedString.length));
        label.attributedText = attributedString
        return label
    }()
    
    private let labelCurrentTemp: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentHumidity: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentWindSpeed: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let imageViewCurrentWeatherCondition: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemBlue
        return imageView
    }()
    
    private let labelCurrentUVIndex: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
    
    private let labelButtonBFF: UILabel = {
        let label = UILabel()
        label.text = "Search"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private let labelButtonCamera: UILabel = {
        let label = UILabel()
        label.text = "Camera"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private let labelButtonFutureWeather: UILabel = {
        let label = UILabel()
        label.text = "Tomorrow"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private let labelButtonCurrentWeather: UILabel = {
        let label = UILabel()
        label.text = "Current"
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private let buttonCurrentWeatherAndPollution: UIButton = {
        let button = UIButton()
//        button.setTitle("Show current weather & pollution", for: .normal)
//        button.setImage(UIImage(systemName: "timer")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .default)
        let image = UIImage(systemName: "eye", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonClickedCurrentWeatherAndPollution(_ :)), for: .touchUpInside)
        return button
    }()
    
    private let buttonBFF: UIButton = {
        let button = UIButton()
//        button.setTitle("BFF", for: .normal)
//        button.setImage(UIImage(named: "gear"), for: .normal)
        
//        button.setImage(UIImage(systemName: "leaf.fill")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)

//        button.setBackgroundImage(UIImage(systemName: "map"), for: UIControl.State.normal)
        
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .default)
        let image = UIImage(systemName: "leaf.arrow.triangle.circlepath", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
//        let image = UIImage(systemName: "leaf.fill", withConfiguration: config)?.withTintColor(.black)
//        let image = UIImage(systemName: "leaf.fill", withConfiguration: config)?.withTintColor(UIColor.black)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonClickedBFF(_ :)), for: .touchUpInside)
        return button
    }()
    
    private let buttonFutureWeatherAndPollutionValues: UIButton = {
        let button = UIButton()
//        button.setTitle("Future", for: .normal)
//        button.setImage(UIImage(systemName: "calendar.circle.fill")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .default)
        let image = UIImage(systemName: "calendar.circle.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonClickedFutureWeatherAndPollutionValues(_ :)), for: .touchUpInside)
        return button
    }()
    
    private let buttonCamera: UIButton = {
        let button = UIButton()
//        button.setTitle("Cam", for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 28, weight: .medium, scale: .default)
        let image = UIImage(systemName: "camera.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
//        button.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(buttonClikedCamera(_ :)), for: .touchUpInside)

        return button
    }()
    
    private let buttondeleteTextfield: UIButton = {
        let button = UIButton()
//        button.setTitle("Cam", for: .normal)
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .default)
        let image = UIImage(systemName: "clear.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
//        button.setImage(UIImage(systemName: "camera.fill")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
//        button.backgroundColor = .systemGray
        button.addTarget(self, action: #selector(buttonClickedDeleteTextfield(_ :)), for: .touchUpInside)

        return button
    }()
    
    
    @objc func buttonClickedDeleteTextfield(_ :UIButton) {
        field.text = ""
        NURAUSPROBIEREN = ""
//        a.centerViewOnSearchedLocation(lon: <#T##Double#>, lat: <#T##Double#>)
//        var dash : abcViewController = storyBoard.instantiateViewControllerWithIdentifier("abc") as! abcViewController
//        var a = dash.getXYZ()
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let mapShit = storyBoard.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
//        mapShit.centerViewOnSearchedLocation(lon: 10, lat: 10)
//        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @objc func buttonClikedCamera(_ :UIButton) {
        //comment out for CAM for simulator
//        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func buttonClickedFutureWeatherAndPollutionValues(_ :UIButton) {
////        self.apiManager.fe
////        self.apiManager.fetchWeather(latitude: NURFUERJETZTLATITUDE, longitude: DASAUCHFUERJETZTLONGITUDE)
//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "idFutureWeatherAndPollution") as! APIManagerForPrediction
//        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @objc func buttonClickedCurrentWeatherAndPollution(_ :UIButton) {
        NURAUSPROBIEREN = field.text ?? ""
        DispatchQueue.main.async {
            self.apiManager.fetchWeather(latitude: NURFUERJETZTLATITUDE, longitude: DASAUCHFUERJETZTLONGITUDE)
//            self.apiManager.fetch
//            self.apiManager.fetchPollution(lat: NURFUERJETZTLATITUDE, lon: DASAUCHFUERJETZTLONGITUDE)
//            self.label2.text! = XXX[1].pm2_5String
//            self.label.text! = weather

        }
    }
    
    @objc func buttonClickedBFF(_ :UIButton) {
        field.sendActions(for: UIControl.Event.editingChanged)
//        todo hier noch was machen. sieht mir unsicher aus
        bffText = field.text!
        if bffText != "" {
            field.endEditing(true)
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "idWikiFlower") as! WikiFlowersPageViewController
            self.present(nextViewController, animated:true, completion:nil)
        }
    }
    
    

    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter something here :)"
        field.layer.cornerRadius = 9
        field.backgroundColor = .tertiarySystemBackground
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        field.leftViewMode = .always
        return field
    }()
    
    
    
    
    
    
    
    private let labelCurrentEAQI: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentPM2_5: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentPM10: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
    private let labelCurrentNO2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentO3: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
    private let labelCurrentSO2: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
    private let labelCurrentCO: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentNO: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private let labelCurrentNH3: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    
//    private let tableView: UITableView = {
//        let table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        return table
//    }()
//
    //tableView content
//    var test = ["tableView content"]
    
    
    
    
    
//    override func draw (_ rect: CGRect) {
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 100, y: 200))
//        path.stroke()
//    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        apiManager.delegate = self
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(labelWeatherString)
//        view.addSubview(labelPollutionString)
        view.addSubview(labelCurrentTemp)
        view.addSubview(imageViewCurrentWeatherCondition)
        view.addSubview(labelCurrentHumidity)
        view.addSubview(labelCurrentWindSpeed)
        view.addSubview(labelCurrentUVIndex)
        view.addSubview(field)
        view.addSubview(buttonCurrentWeatherAndPollution)
        view.addSubview(buttonBFF)
        view.addSubview(buttonFutureWeatherAndPollutionValues)
        view.addSubview(buttonCamera)
        view.addSubview(buttondeleteTextfield)
        
        view.addSubview(labelCurrentEAQI)
        view.addSubview(labelCurrentPM2_5)
        view.addSubview(labelCurrentPM10)
        view.addSubview(labelCurrentNO2)
        view.addSubview(labelCurrentO3)
        view.addSubview(labelCurrentSO2)
        view.addSubview(labelCurrentCO)
        view.addSubview(labelCurrentNO)
        view.addSubview(labelCurrentNH3)
        
        view.addSubview(labelStreetName)
        view.addSubview(labelStreetNameForWeatherAndPollution)
        
        view.addSubview(labelButtonBFF)
        view.addSubview(labelButtonCamera)
        view.addSubview(labelButtonFutureWeather)
        view.addSubview(labelButtonCurrentWeather)
        
        
        view.addSubview(labelEAQIValue)
        view.addSubview(labelUVValue)
        view.addSubview(labelPM25Value)
        view.addSubview(labelPM10Value)
        view.addSubview(labelNO2Value)
        view.addSubview(labelOValue)
        view.addSubview(labelSOValue)
        
        view.addSubview(labelCOValue)
        view.addSubview(labelNOValue)
        view.addSubview(labelNHValue)
        
        view.addSubview(labelTempValue)
        view.addSubview(labelHumidValue)
        view.addSubview(labelWindValue)

//        view.addSubview(tableView)
        
//        tableView.delegate = self
//        tableView.dataSource = self
        field.delegate = self
        
        //comment out for CAM for simulator
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = .camera
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("streetnameUpdate"), object: nil, queue: .main, using: { notification in

            guard let object = notification.object as? String else {
                return
            }


            self.labelStreetName.text = object
        })
        
        
    }

    //comment out for CAM for simulator
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let userPickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
//            guard let converetedCIImage = CIImage(image: userPickedImage) else {
//                fatalError("cannot convert to CIImage.")
//            }
//            detect(image: converetedCIImage)
//        }
//        imagePicker.dismiss(animated: true, completion: nil)
//    }
//    func detect(image: CIImage) {
//        guard let model = try? VNCoreMLModel(for: FlowerClassifier().model) else {
//            fatalError("Cannot import model")
//        }
//        let request = VNCoreMLRequest(model: model) { (request, error) in
//            guard let classification = request.results?.first as? VNClassificationObservation else {
//                fatalError("Could not classify image.")
//            }
//            self.field.text = classification.identifier.capitalized
//        }
//        let handler = VNImageRequestHandler(ciImage: image)
//        do {
//            try handler.perform([request])
//        }
//        catch {
//            print(error)
//        }
//    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labelCurrentTemp.sizeToFit()
//        label.frame = CGRect(x: 10, y: 10, width: label.frame.size.width, height: label.frame.size.height)
//        field.frame = CGRect(x: 10, y: 20+label.frame.size.height, width: view.frame.size.width-20, height: 50)
        
    
        
        field.frame = CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: 33)
        
        buttondeleteTextfield.frame = CGRect(x: view.frame.size.width-55, y: 5, width: 44, height: 44)
        
        labelStreetName.frame = CGRect(x: 10, y: 15+33, width: view.frame.size.width, height: 20)

        
        buttonBFF.frame = CGRect(x: 25, y: 25+20+33, width: 50, height: 50)
        buttonBFF.layer.cornerRadius = 0.5 * buttonBFF.bounds.size.width
        labelButtonBFF.frame = CGRect(x: 10 , y: 48+25+20+33, width: 80, height: 20)
        labelButtonBFF.textAlignment = .center
        
        buttonCamera.frame = CGRect(x: view.frame.size.width/2 - 75, y: 25+20+33, width: 50, height: 50)
        buttonCamera.layer.cornerRadius = 0.5 * buttonCamera.bounds.size.width
        labelButtonCamera.frame = CGRect(x: view.frame.size.width/2 - 75 - 15, y: 48+25+20+33, width: 80, height: 20)
        labelButtonCamera.textAlignment = .center
        
        buttonFutureWeatherAndPollutionValues.frame = CGRect(x: (view.frame.size.width/2) + 25, y: 25+20+33, width: 50, height: 50)
        buttonFutureWeatherAndPollutionValues.layer.cornerRadius = 0.5 * buttonFutureWeatherAndPollutionValues.bounds.size.width
        labelButtonFutureWeather.frame = CGRect(x: (view.frame.size.width/2) + 25 - 15, y: 48+25+20+33, width: 80, height: 20)
        labelButtonFutureWeather.textAlignment = .center
        
        buttonCurrentWeatherAndPollution.frame = CGRect(x: view.frame.size.width-75, y: 25+20+33, width: 50, height: 50)
        buttonCurrentWeatherAndPollution.layer.cornerRadius = 0.5 * buttonCurrentWeatherAndPollution.bounds.size.width
        labelButtonCurrentWeather.frame = CGRect(x: view.frame.size.width-75-15, y: 48+25+20+33, width: 80, height: 20)
        labelButtonCurrentWeather.textAlignment = .center


        //Texts for weather and pollutants
        labelCurrentEAQI.frame = CGRect(x: 5, y: 110+25*4, width: 50, height: 15)
        labelCurrentTemp.frame = CGRect(x: 5, y: 130+25*4, width: 150, height: 15)
        
        imageViewCurrentWeatherCondition.frame = CGRect(x: 140, y: 95+33*4, width: 30, height: 30)
        
        
        labelCurrentHumidity.frame = CGRect(x: 5, y: 150+25*4, width: 150, height: 15)
        labelCurrentWindSpeed.frame = CGRect(x: 5, y: 170+25*4, width: 170, height: 15)
        labelCurrentUVIndex.frame = CGRect(x: 5, y: 190+25*4, width: 100, height: 15)

    
        labelCurrentPM2_5.frame = CGRect(x: (view.frame.size.width/2)-10, y: 110+25*4, width: 60, height: 15)
        labelCurrentPM10.frame = CGRect(x: (view.frame.size.width/2)-10, y: 130+25*4, width: 60, height: 15)
        labelCurrentNO2.frame = CGRect(x: (view.frame.size.width/2)-10, y: 150+25*4, width: 60, height: 15)
        labelCurrentO3.frame = CGRect(x: (view.frame.size.width/2)-10, y: 170+25*4, width: 60, height: 15)
        labelCurrentSO2.frame = CGRect(x: (view.frame.size.width/2)-10, y: 190+25*4, width: 60, height: 15)
    
        
        
        //Values for weather and pollutants
        labelEAQIValue.frame = CGRect(x: 110, y: 110+25*4, width: 20, height: 15)
        labelEAQIValue.textAlignment = .right
        
        
        labelTempValue.frame = CGRect(x: 101, y: 130+25*4, width: 40, height: 15)
        labelTempValue.textAlignment = .right
        labelHumidValue.frame = CGRect(x: 99, y: 150+25*4, width: 50, height: 15)
        labelHumidValue.textAlignment = .right
        labelWindValue.frame = CGRect(x: 100, y: 170+25*4, width: 70, height: 15)
        labelWindValue.textAlignment = .right
        
        
        labelUVValue.frame = CGRect(x: 110, y: 190+25*4, width: 20, height: 15)
        labelUVValue.textAlignment = .right
        
        labelPM25Value.frame = CGRect(x: (view.frame.size.width/2)+50, y: 110+25*4, width: 40, height: 15)
        labelPM25Value.textAlignment = .center
        labelPM10Value.frame = CGRect(x: (view.frame.size.width/2)+50, y: 130+25*4, width: 40, height: 15)
        labelPM10Value.textAlignment = .center
        labelNO2Value.frame = CGRect(x: (view.frame.size.width/2)+50, y: 150+25*4, width: 40, height: 15)
        labelNO2Value.textAlignment = .center
        labelOValue.frame = CGRect(x: (view.frame.size.width/2)+50, y: 170+25*4, width: 40, height: 15)
        labelOValue.textAlignment = .center
        labelSOValue.frame = CGRect(x: (view.frame.size.width/2)+50, y: 190+25*4, width: 40, height: 15)
        labelSOValue.textAlignment = .center
        
        
        labelCurrentCO.frame = CGRect(x: view.frame.size.width-75-15, y: 110+25*4, width: 50, height: 15)
        labelCurrentNO.frame = CGRect(x: view.frame.size.width-75-15, y: 130+25*4, width: 50, height: 15)
        labelCurrentNH3.frame = CGRect(x: view.frame.size.width-75-15, y: 150+25*4, width: 50, height: 15)
        
        
        labelCOValue.frame = CGRect(x: view.frame.size.width-50, y: 110+25*4, width: 40, height: 15)
        labelCOValue.textAlignment = .center
        labelNOValue.frame = CGRect(x: view.frame.size.width-50, y: 130+25*4, width: 40, height: 15)
        labelNOValue.textAlignment = .center
        labelNHValue.frame = CGRect(x: view.frame.size.width-50, y: 150+25*4, width: 40, height: 15)
        labelNHValue.textAlignment = .center

        
        labelWeatherString.frame = CGRect(x: 0, y: 85+33*2, width: view.frame.size.width, height: 33)
        labelWeatherString.textAlignment = .center
        labelStreetNameForWeatherAndPollution.frame = CGRect(x: 0, y: 75+33*3, width: view.frame.size.width, height: 20)
        labelStreetNameForWeatherAndPollution.textAlignment = .center
        
        
        
        
        
        
//        labelPollutionString.frame = CGRect(x: 150, y: 20+20+33*2, width: view.frame.size.width-100, height: 33)
        
        

        
        
        
        
        

//        let tableY: CGFloat = field.frame.origin.y+field.frame.size.height+5
//        tableView.frame = CGRect(x: 0, y: tableY, width: view.frame.size.width, height: view.frame.size.height-tableY)
    }
    
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        NURAUSPROBIEREN = field.text ?? ""
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        field.resignFirstResponder()
        if let text = field.text, !text.isEmpty {
            //location stuff
            NURAUSPROBIEREN = text
//            apiManager.fetchWeather(cityName: text)
            
//            DispatchQueue.main.async {
//                self.labelCurrentTemp.text! += (text + " °")
//            }
        }
        return true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //notify map controller pin at selected place
    }
}


//MARK: - APIManagerDelegate

extension FloatingPanelViewController: APIManagerDelegate {

    

    func didUpdateFutureWeather(_ apiManager: APIManager, weather: [WeatherModelFutureValues]){
        
                YYY = weather
        
//            self.temperatureLabel.text = "\(weather.temperatureString)°"
//            self.humidityLabel.text = "\(weather.humidityString) %"
//            self.weatherConditionImageView.image = UIImage(systemName: weather.conditionName)
//            self.windSpeedLabel.text = "\(weather.windSpeedString) km/h"
        
    }
    //from APIManager the values come over here to display
    func didUpdateWeather(_ apiManager: APIManager, weather: WeatherConditionModel){
        DispatchQueue.main.async {
//            if self.field.text != "" {
//                a.centerViewOnSearchedLocation(lon: weather.lon, lat: weather.lat)
////                self.centerViewOnSearchedLocation(lon: weather.lon, lat: weather.lat)
//                self.field.text = ""
//            }
            
//                        if self.field.text != "" {
//                            self.centerViewOnSearchedLocation(lon: weather.lon, lat: weather.lat)
//                            self.field.text = ""
//                        }
        
//            let a = ViewController()
//            self.a.centerViewOnSearchedLocation(lon: weather.lon, lat: weather.lat)
            
            
            
            self.labelWeatherString.text = "Current weather and pollutant concentrations (in µg/m3)"
            self.labelWeatherString.textAlignment = .center
            
            
            if self.labelStreetName.text != "" {
                self.labelStreetNameForWeatherAndPollution.text = ("for " + self.labelStreetName.text!)
                self.labelStreetNameForWeatherAndPollution.textAlignment = .center
            }
            self.labelCurrentTemp.text = "Temperature:"
            self.labelTempValue.text = (weather.temperatureString + " °")


            
            
            self.imageViewCurrentWeatherCondition.image = UIImage(systemName: weather.conditionName)
            
            
            self.labelCurrentHumidity.text = "Humidity:"
            self.labelHumidValue.text = (weather.humidityString + " %")
            
            
            self.labelCurrentWindSpeed.text = "Wind speed:"
            self.labelWindValue.text = (weather.windSpeedString + " km/h")
            
            if (!YYY.isEmpty){
            self.labelCurrentUVIndex.text = "UV Index:"
            self.labelUVValue.text = (YYY[0].uviString)
            if YYY[0].uvi > 11 {
                self.labelUVValue.backgroundColor = UIColor.systemRed
            } else if YYY[0].uvi > 8 {
                self.labelUVValue.backgroundColor = UIColor.systemOrange
            } else if YYY[0].uvi > 6 {
                self.labelUVValue.backgroundColor = UIColor.systemYellow
            } else if YYY[0].uvi > 3 {
                self.labelUVValue.backgroundColor = UIColor.systemGreen
            } else if YYY[0].uvi >= 0 {
                self.labelUVValue.backgroundColor = UIColor.systemTeal
            }}
        }
        }
    
    
    func didUpdatePollution(_ apiManager: APIManager, pollution: PollutionConditionModel){
        DispatchQueue.main.async {

            self.labelCurrentEAQI.text = "EAQI:"
            self.labelEAQIValue.text = (pollution.aqiString)
            if pollution.aqi == 5{
                self.labelEAQIValue.backgroundColor = UIColor.systemRed
            } else if pollution.aqi == 4 {
                self.labelEAQIValue.backgroundColor = UIColor.systemOrange
            } else if pollution.aqi == 3 {
                self.labelEAQIValue.backgroundColor = UIColor.systemYellow
            } else if pollution.aqi == 2 {
                self.labelEAQIValue.backgroundColor = UIColor.systemGreen
            } else if pollution.aqi == 1 {
                self.labelEAQIValue.backgroundColor = UIColor.systemTeal
            }
            
            self.labelCurrentPM2_5.text = "PM2.5:"
            self.labelPM25Value.text = (pollution.pm2_5String)
            if pollution.pm2_5 > 50 {
                self.labelPM25Value.backgroundColor = UIColor.systemRed
            } else if pollution.pm2_5 > 25 {
                self.labelPM25Value.backgroundColor = UIColor.systemOrange
            } else if pollution.pm2_5 > 20 {
                self.labelPM25Value.backgroundColor = UIColor.systemYellow
            } else if pollution.pm2_5 > 10 {
                self.labelPM25Value.backgroundColor = UIColor.systemGreen
            } else if pollution.pm2_5 >= 0 {
                self.labelPM25Value.backgroundColor = UIColor.systemTeal
            }
        
            self.labelCurrentPM10.text = "PM10:"
            self.labelPM10Value.text = (pollution.pm10String)
            if pollution.pm10 > 100 {
                self.labelPM10Value.backgroundColor = UIColor.systemRed
            } else if pollution.pm10 > 50 {
                self.labelPM10Value.backgroundColor = UIColor.systemOrange
            } else if pollution.pm10 > 40 {
                self.labelPM10Value.backgroundColor = UIColor.systemYellow
            } else if pollution.pm10 > 20 {
                self.labelPM10Value.backgroundColor = UIColor.systemGreen
            } else if pollution.pm10 >= 0 {
                self.labelPM10Value.backgroundColor = UIColor.systemTeal
            }

            self.labelCurrentNO2.text = "NO2:"
            self.labelNO2Value.text = (pollution.no2String)
            if pollution.no2 > 230 {
                self.labelNO2Value.backgroundColor = UIColor.systemRed
            } else if pollution.no2 > 120 {
                self.labelNO2Value.backgroundColor = UIColor.systemOrange
            } else if pollution.no2 > 90 {
                self.labelNO2Value.backgroundColor = UIColor.systemYellow
            } else if pollution.no2 > 40 {
                self.labelNO2Value.backgroundColor = UIColor.systemGreen
            } else if pollution.no2 >= 0 {
                self.labelNO2Value.backgroundColor = UIColor.systemTeal
            }


            self.labelCurrentO3.text = "O3:"
            self.labelOValue.text = (pollution.o3String)
            if pollution.o3 > 240 {
                self.labelOValue.backgroundColor = UIColor.systemRed
            } else if pollution.o3 > 130 {
                self.labelOValue.backgroundColor = UIColor.systemOrange
            } else if pollution.o3 > 100 {
                self.labelOValue.backgroundColor = UIColor.systemYellow
            } else if pollution.o3 > 50 {
                self.labelOValue.backgroundColor = UIColor.systemGreen
            } else if pollution.o3 >= 0 {
                self.labelOValue.backgroundColor = UIColor.systemTeal
            }

            self.labelCurrentSO2.text = "SO2:"
            self.labelSOValue.text = (pollution.so2String)
            if pollution.so2 > 500 {
                self.labelSOValue.backgroundColor = UIColor.systemRed
            } else if pollution.so2 > 350 {
                self.labelSOValue.backgroundColor = UIColor.systemOrange
            } else if pollution.so2 > 200 {
                self.labelSOValue.backgroundColor = UIColor.systemYellow
            } else if pollution.so2 > 100 {
                self.labelSOValue.backgroundColor = UIColor.systemGreen
            } else if pollution.so2 >= 0 {
                self.labelSOValue.backgroundColor = UIColor.systemTeal
            }
            self.labelCurrentCO.text = "CO:"
            self.labelCOValue.text = (pollution.coString)
            self.labelCurrentNO.text = "NO:"
            self.labelNOValue.text = (pollution.noString)
            self.labelCurrentNH3.text = "NH3:"
            self.labelNHValue.text = (pollution.nh3String)

        }
    }
    
    //lu
    func didUpdatePollutionForecast(_ apiManager: APIManager, pollution: [PollutionConditionModel]){
        XXX = pollution

//        DispatchQueue.main.async {
////            self.aqiLabel.text = pollution.aqiString
////            self.aqiLabel.textColor = UIColor.red
////            self.coLabel.text = pollution.coString
////            self.noLabel.text = pollution.noString
////            self.no2Label.text = pollution.no2String
////            self.o3Label.text = pollution.o3String
////            self.so2Label.text = pollution.so2String
////            self.pm2_5Label.text = pollution.pm2_5String
////            self.pm10Label.text = pollution.pm10String
////            self.nh3Label.text = pollution.nh3String
//            let date0 = NSDate(timeIntervalSince1970: TimeInterval(pollution[0].dt))
//            let date1 = NSDate(timeIntervalSince1970: TimeInterval(pollution[1].dt))
//            let date2 = NSDate(timeIntervalSince1970: TimeInterval(pollution[2].dt))
//            let date3 = NSDate(timeIntervalSince1970: TimeInterval(pollution[3].dt))
//            let date4 = NSDate(timeIntervalSince1970: TimeInterval(pollution[4].dt))
//        }
//    }
    }
    //error handling is only printed to the console, because it comes from APIManager and the user does not need to see this error message
    func didFailWithError(error: Error) {
        print(error)
    }
    
    }

