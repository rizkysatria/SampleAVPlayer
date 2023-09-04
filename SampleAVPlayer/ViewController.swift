//
//  ViewController.swift
//  SampleAVPlayer
//
//  Created by PT Phincon on 04/09/23.
//

import UIKit
import AVFoundation
import MultipeerConnectivity
import AVKit

class ViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    
    var browser: MCNearbyServiceBrowser?
    private var playerView: PlayerView?
    private let videoURL = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    
    
    private var player: AVPlayer?
    private var playerViewController: AVPlayerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an AVPlayer with the video URL
        guard let url = URL(string: videoURL) else { return }
        let player = AVPlayer(url: url)
        
        // Create an AVPlayerViewController
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player
        
        // Allow AirPlay
        player.allowsExternalPlayback = true
        playerViewController?.showsPlaybackControls = true
        
        // Present the AVPlayerViewController
        if let playerViewController = playerViewController {
            addChild(playerViewController)
            view.addSubview(playerViewController.view)
            playerViewController.view.frame = view.bounds
            playerViewController.didMove(toParent: self)
            
            // Start playing the video
            player.play()
        }
    }

    private func setupView() {
        playerView = PlayerView(frame: CGRect(x: 0, y: 0, width: containerView.bounds.width, height: containerView.bounds.height))
        guard let playerView = playerView else { return }
        containerView.addSubview(playerView)
        
    }
    
    func playVideo() {
        guard let playerView = playerView, let url = URL(string: videoURL) else { return }
        playerView.play(with: url)
    }
    
    @IBAction func onTapPauseBtn(_ sender: Any) {
        playerView?.showAirplay()
        browser?.startBrowsingForPeers()
    }
    @IBAction func onTapPlayBtn(_ sender: Any) {
        playerView?.player?.play()
    }
}

extension ViewController: MCNearbyServiceBrowserDelegate {
    
    func browser(_ browser: MCNearbyServiceBrowser, foundPeer peerID: MCPeerID, withDiscoveryInfo info: [String : String]?) {
        print("")
    }
    
    
    func browser(_ browser: MCNearbyServiceBrowser, lostPeer peerID: MCPeerID) {
        print("")
    }
    
    
}
