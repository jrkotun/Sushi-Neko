//
//  Piece.swift
//  SushiNeko
//
//  Created by Habeeb Kotun Jr. on 6/29/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import UIKit

class Piece: CCNode {
    weak var left: CCSprite!
    weak var right: CCSprite!
    
    var side: Side = .None {
        didSet {
            left.visible = false
            right.visible = false
            if side == .Right {
                right.visible = true
            } else if side == .Left {
                left.visible = true
            }
        }
    }
    
    func setObstacle(lastSide: Side) -> Side {
        if lastSide != .None {
            side = .None
        } else {
            var random = CCRANDOM_0_1()
            if random < 0.45 {
                side = .Left
            } else if random < 0.9 {
                side = .Right
            } else {
                side = .None
            }
        }
        return side
    }
}