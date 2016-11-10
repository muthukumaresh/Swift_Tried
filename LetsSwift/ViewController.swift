//
//  ViewController.swift
//  LetsSwift
//
//  Created by Muthukumaresh on 03/10/16.
//  Copyright © 2016 Muthukumaresh. All rights reserved.
//

import UIKit
import CoreLocation

//class TipInCellAnimator {
//    // placeholder for things to come -- only fades in for now
//    class func animate(cell:UITableViewCell) {
//        let view = cell.contentView
//        view.layer.opacity = 0.1
//        UIView.animateWithDuration(1.4, animations:UIViewAnimationCurve, completion: nil) {
//            view.layer.opacity = 1 as Float
//        }
//    }
//}

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate {
    // Declerations
    @IBOutlet weak var tblView:UITableView?
    
    
    // Array declaration...
    var listOfNames = ["Andrei", "Silviu", "Claudiu"]
     var sectionName = ["MK", "MMK", "MMMK"]
    
    // string declaration
    let cellReuseIdentifier = "cell"
    // gradient variable
    var gradientLayer: CAGradientLayer!
    
    // int declaration
    var aVal: Int = 0
    var bVal: Int = 0
    
    // object declaration of types
    let myLocation = CLLocationManager()
    
    
    // Outlet Added
    @IBOutlet weak var showImage: UIImageView!
    
    var sampleView:UIView!
    var sampleView1:UIView!

    
    var mealCost: Float = 0
    let taxPer: Float = 20
    let tipPer: Float = 8
    var totalCost: Float = 0
    
    var names = [muCustomTry]()
    var population = [String]()

    func tryFunctionWithparams(myFirstName: String, mySecondName: String) -> String {
        print("\(myFirstName + mySecondName)")
        return myFirstName+mySecondName
    }

// image filters in iOS -----> tried CISepia and basing filters
    
    func simpleBlurFilterExample(inputImage: UIImage) -> UIImage {
        // convert UIImage to CIImage
        let inputCIImage = CIImage(image: inputImage)!
        
        // Create coloreffect CIFilter, and set the input image
        let blurFilter = CIFilter(name: "CICMYKHalftone")!
        blurFilter.setValue(inputCIImage, forKey: kCIInputImageKey)
        blurFilter.setValue(25, forKey: kCIInputWidthKey)
        
        
        let ctx = CIContext(options:nil)
        let outputImage = blurFilter.outputImage!
        let cgImage = ctx.createCGImage(blurFilter.outputImage!, fromRect:blurFilter.outputImage!.extent)
        
        // Get the filtered output image and return it
        
        showImage.image = UIImage(CGImage: cgImage)
        
        
        return UIImage(CIImage: outputImage)
    }
    
    
    
    
    func input(inputCost : Float) -> Float {
        
        
//    let keyboard = NSFileHandle.fileHandleWithStandardInput()
//        let testVal = keyboard.availableData as AnyObject
//        print("\(testVal)")
 //   mealCost = keyboard.availableData as AnyObject as! Int
    totalCost = inputCost + ( inputCost * taxPer / 100   ) + ( inputCost * tipPer / 100  )
        print("\(Int (totalCost))")
    return totalCost
    
}
    
    
    
    override func viewWillAppear(animated: Bool) {
        
      //  createGradientLayer()
        
       // animateTable()
    }
    
    
    
    func animateTable() {
        tblView!.reloadData()
        
        let cells = tblView!.visibleCells
        let tableHeight: CGFloat = tblView!.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [] , animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    
    
    
    
    override func viewDidLoad() {
   
        super.viewDidLoad()
        
        myLocation.delegate = self
        
        
        let myStr = "Hello, world"
        let characters = myStr.characters.first!
        print(characters)
        
        
        let imageName = "myImage.png"
       
        let myImage:UIImage = UIImage(named: imageName)!
        
    // called image filter method here...
        self.simpleBlurFilterExample(myImage)
        
        
        // Array workings...
        
        var recipes:[String] = ["Egg Benedict", "Mushroom Risotto", "Full Breakfast", "Hamburger", "Ham and Egg Sandwich"]
        
        print(recipes)
        
        recipes += ["Muthu kumaresh"]
        
        
        tblView?.backgroundColor=UIColor.clearColor()
       self.view.backgroundColor = UIColor(red: (64/255.0), green: (54/255.0), blue: (105/255.0), alpha: 1.0)
        print(recipes)
        
        recipes.insert("iOS Array", atIndex: 1)
        
//        var recipeItem = recipes[0]
//        recipes[1] = "Cupcake"
        
        for i in 0..<recipes.count{
            print(recipes[i])
        }
        
        print(recipes)
        
     // Drawing arc...
        

        
        
        
        
        
// function with params
        self.tryFunctionWithparams("Muthukumaresh", mySecondName: "Muthuvel")
        
        
// Array try..
        let a: [Int] = [5, 6, 7, 8]
        let b: [Int] = [3, 6, 10, 3]
        
// For enum..
        for (index,element) in a.enumerate() {
            
            
            print(index,element)
            for (_,belement) in b.enumerate() {
                print(belement)
                break
            }
        }
        
        var dict = ["name": "John", "surname": "Doe"]
        
        // Add a new key with a value
        
        dict["email"] = "john.doe@email.com"
        
        
        dict["Address"] = "hansagarden rajakilpakkam"
        
        let myKeys = Array(dict.keys)
        
        print("\(myKeys)")
        
        
        print(dict["name"]!)
        
        for (key, value) in dict {
            print("\(key) -> \(value)")
        }
        
        let requestURL: NSURL = NSURL(string: "https://restcountries.eu/rest/v1/all")!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
                
                do{
                    
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options:.AllowFragments)
                    
                    if let stations = json as? [AnyObject] {
                        
                        
                       self.retriveServerData(stations)
   
                    }
                 print(self.names)
                }catch {
                    print("Error with Json: \(error)")
                }
   
            }
        }
        
        task.resume()

  
// Register tableview cell identifier
        self.tblView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        print("HI")
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let documentsDirectory: AnyObject = paths[0]
        let dataPath = documentsDirectory.stringByAppendingPathComponent("Muthukumaresh")
        
        print("mypath \(dataPath)")
        
        do {
            try NSFileManager.defaultManager().createDirectoryAtPath(dataPath, withIntermediateDirectories: false, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }catch{
            print("Not catched")
        }
            
    }
    
   override func viewDidAppear(animated: Bool) {
    sampleView = UIView.init(frame: CGRect(x: 295, y: 30, width: 100, height: 100))
    sampleView.backgroundColor=UIColor.whiteColor()
    
    var xP:Int = 15
    var yP:Int = 40
    var hP:Int = 50
    
    for i in 1..<4 {
        let hereISTheView = TryDrawRect(frame: CGRect(x: xP, y: yP, width: 20, height: hP))
        sampleView.addSubview(hereISTheView)
        xP+=25
        yP-=15
        hP+=15
    }
    
    
    
    sampleView1 = UIView.init(frame: CGRect(x: 175, y: 30, width: 100, height: 100))
    sampleView1.backgroundColor=UIColor.whiteColor()
    
    let center = CGPoint(x: sampleView1.bounds.width/2, y: sampleView1.bounds.height/2)
    let radius:CGFloat =  max(sampleView1.bounds.width/3, sampleView1.bounds.height/3)
    
    
    let arcWidth:CGFloat!

    let startAngle:Double = 0.0
    
    
    let endAngle:Double = M_PI * 2
    
    
    let path =  UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true) 
    let drawCircle = CAShapeLayer()
    drawCircle.path = path.CGPath
    drawCircle.fillColor = UIColor.grayColor().CGColor
    drawCircle.lineWidth = 2.0
    drawCircle.strokeColor = UIColor.greenColor().CGColor
    
    
    sampleView1.layer.addSublayer(drawCircle)
    
    
//    sampleView1.layer.addSublayer(path)
//    sampleView1.addSubview(drawCircle)
    
    
    
    
    
    
    
    

        
     //   let hereISTheView = TryDrawRect(frame: CGRect(x: 15, y: 40, width: 20, height: 50))
        
        
        
    
        
        
//        sampleView.addSubview(hereISTheView)
        self.view.addSubview(sampleView)
        self.view.addSubview(sampleView1)
        
        drawLineFromPoint( (CGPointMake(5.0, 90.0)) , toPoint: (CGPointMake(95.0, 90.0)), ofColor: UIColor.redColor(), inView: sampleView)
        
        
        drawLineForY((CGPointMake(10.0, 10.0)), toPoint: (CGPointMake(10.0, 95.0)), ofColor: UIColor.redColor(), inView: sampleView)

    }
    
    @IBAction func findMyLocation(sender: AnyObject) {
        
        
        myLocation.desiredAccuracy = kCLLocationAccuracyBest
        myLocation.requestAlwaysAuthorization()
        myLocation.startUpdatingLocation()
        
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        var path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        
        //design path in layer
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    
    
    func drawLineForY(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        //design the path
        var path = UIBezierPath()
        path.moveToPoint(start)
        path.addLineToPoint(end)
        
        //design path in layer
        var shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = lineColor.CGColor
        shapeLayer.lineWidth = 1.0
        
        view.layer.addSublayer(shapeLayer)
    }
    
    

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
    
     print("locations muthukumareshbfhhjdfgsklmhjjuhjklnhjk = \(locations)")
        
        myLocation.stopUpdatingLocation() // Stop Location Manager - keep here to run just once

 
        
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Error while updating location " + error.localizedDescription)
    }
    
    
    
    func retriveServerData(getJson:[AnyObject])  {
       
        for station in getJson {
            
            let name:String = station["name"] as! String
            let year:NSNumber = station["population"] as! NSNumber
            
            
            
            let getObjectClass=muCustomTry(tryName: name, tryPopulation: String(year))
           
            names.append(getObjectClass)
                }

        
        tblView?.reloadData()
            }
    
        

        
        


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Tableview delegate and datasource functions
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        return self.sectionName[section];
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
    return self.names.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        
        return 30.0
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell:UITableViewCell = self.tblView!.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
 
        cell = UITableViewCell(style: UITableViewCellStyle.Subtitle,reuseIdentifier: cellReuseIdentifier)
        
        cell.backgroundColor=UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)
        cell.layer.cornerRadius = 7.0
        cell.layer.masksToBounds = true
  //      cell.layer.borderWidth = 2.0
   
        
        
        // set the text from the data model
        let getObject:muCustomTry=names[indexPath.row]
        cell.textLabel?.text = getObject.tryName
        cell.textLabel?.textColor=UIColor.darkGrayColor()
        cell.detailTextLabel?.text = getObject.tryPopulation
        cell.detailTextLabel?.textColor=UIColor.whiteColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    //    var myIndex = indexPath.row
        mealCost = 20
        input(mealCost)
        print("clicked indexpath \(indexPath.row) and at section \(indexPath.section)")
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
                            forRowAtIndexPath indexPath: NSIndexPath) {

        
        cell.frame = CGRectMake(tblView!.frame.width, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)
        
        UIView.animateWithDuration(1.0, delay: 0.4, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: UIViewAnimationOptions.CurveEaseInOut, animations: {
            cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height)
            }, completion: { finished in })

}

}

