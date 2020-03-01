
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CollectionView: UICollectionView!
    var imgData = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgData.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.Img.layer.borderWidth = 1
        cell.Img.layer.masksToBounds = false
        cell.Img.layer.backgroundColor = UIColor.black.cgColor
        cell.Img.layer.cornerRadius = cell.Img.frame.height/2
        cell.Img.clipsToBounds = true
        cell.Img.image = UIImage(named: imgData [indexPath.item])
        return cell
        
        cell.Img.image = UIImage(named: imgData[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = UIImage(named: imgData[indexPath.item])
        
        let imageInfo = GSImageInfo (image: image!, imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: collectionView)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        imageViewer.dismissCompletion = {
            print("dismiss called")
        }
        
        present(imageViewer,animated: true)
        
    }
}

