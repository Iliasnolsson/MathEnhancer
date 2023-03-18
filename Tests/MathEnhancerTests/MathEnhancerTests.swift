import XCTest
@testable import MathEnhancer

final class MathEnhancerTests: XCTestCase {
    
    func testNumberOfDecimals() {
        let value1: DecimalValue = 10.0
        XCTAssertEqual(value1.numberOfDecimals(), 0)
        
        let value2: DecimalValue = 10.5
        XCTAssertEqual(value2.numberOfDecimals(), 1)
        
        let value3: DecimalValue = 10.1234
        XCTAssertEqual(value3.numberOfDecimals(), 4)
        
        let value4: DecimalValue = -10.005
        XCTAssertEqual(value4.numberOfDecimals(), 3)
        
        let value5: DecimalValue = 0
        XCTAssertEqual(value5.numberOfDecimals(), 0)
    }
    
    func testAddition() {
        let a = 5
        let b = 7
        XCTAssertEqual(a + b, 12)
        
        let c = CGSize(width: 10, height: 20)
        let d = CGSize(width: 30, height: 40)
        let result = c + d
        XCTAssertEqual(result, CGSize(width: 40, height: 60))
        
        let e = CGPoint(x: 5, y: 10)
        let f = CGPoint(x: 15, y: 20)
        let result2 = e + f
        XCTAssertEqual(result2, CGPoint(x: 20, y: 30))
    }
    
    func testSubtraction() {
        let a = 5
        let b = 7
        XCTAssertEqual(a - b, -2)
        
        let c = CGSize(width: 30, height: 40)
        let d = CGSize(width: 10, height: 20)
        let result = c - d
        XCTAssertEqual(result, CGSize(width: 20, height: 20))
        
        let e = CGPoint(x: 15, y: 20)
        let f = CGPoint(x: 5, y: 10)
        let result2 = e - f
        XCTAssertEqual(result2, CGPoint(x: 10, y: 10))
    }
    
    func testMultiplication() {
        let a = 5
        let b = 7
        XCTAssertEqual(a * b, 35)
        
        let c = CGSize(width: 5, height: 10)
        let d = CGSize(width: 2, height: 3)
        let result = c * d
        XCTAssertEqual(result, CGSize(width: 10, height: 30))
        
        let e = CGPoint(x: 5, y: 10)
        let f = CGPoint(x: 2, y: 3)
        let result2 = e * f
        XCTAssertEqual(result2, CGPoint(x: 10, y: 30))
    }
    
    func testDivision() {
        let a = 10
        let b = 5
        XCTAssertEqual(a / b, 2)
        
        let c = CGSize(width: 20, height: 40)
        let d = CGSize(width: 2, height: 4)
        let result = c / d
        XCTAssertEqual(result, CGSize(width: 10, height: 10))
        
        let e = CGPoint(x: 20, y: 40)
        let f = CGPoint(x: 2, y: 4)
        let result2 = e / f
        XCTAssertEqual(result2, CGPoint(x: 10, y: 10))
    }
    
    
    func testOperators() {
        let a = CGSize(width: 10, height: 20)
        let b: CGFloat = 2
        let result1 = a *- b
        XCTAssertEqual(result1, CGSize(width: 20, height: 40))
        
        let c = CGSize(width: 20, height: 40)
        let result2 = c /- b
        XCTAssertEqual(result2, CGSize(width: 10, height: 20))
        
        let d = CGSize(width: 10, height: 20)
        let result3 = d +- b
        XCTAssertEqual(result3, CGSize(width: 12, height: 22))
        
        let e = CGSize(width: 10, height: 20)
        let result4 = e +- b
        XCTAssertEqual(result4, CGSize(width: 12, height: 22))
        
        let f = CGPoint(x: 10, y: 20)
        let result5 = f *- b
        XCTAssertEqual(result5, CGPoint(x: 20, y: 40))
        
        let g = CGPoint(x: 10, y: 20)
        let result6 = g /- b
        XCTAssertEqual(result6, CGPoint(x: 5, y: 10))
    }
    
    // MARK: CGPointExtensions
    
    func testRotate() {
        let point = CGPoint(x: 5, y: 0)
        let center = CGPoint(x: 5, y: 5)
        let angle = CGFloat.pi / 2
        let rotatedPoint = point.rotate(around: center, byAngle: angle)
        XCTAssertEqual(rotatedPoint.x, 5, accuracy: 0.0001)
        XCTAssertEqual(rotatedPoint.y, 10, accuracy: 0.0001)
    }
    
    func testRotation() {
        let point = CGPoint(x: 10, y: 10)
        let center = CGPoint(x: 5, y: 5)
        let rotation = point.rotation(around: center)
        XCTAssertEqual(rotation, CGFloat.pi / 4, accuracy: 0.0001)
    }
    
    func testPointOnCircle() {
        let center = CGPoint(x: 5, y: 5)
        let radius: CGFloat = 5
        let angle = CGFloat.pi / 2
        let pointOnCircle = CGPoint.pointOnCircle(withCenter: center, radius: radius, atAngle: angle)
        XCTAssertEqual(pointOnCircle.x, 5, accuracy: 0.0001)
        XCTAssertEqual(pointOnCircle.y, 10, accuracy: 0.0001)
    }
    
    func testScale() {
        let point = CGPoint(x: 10, y: 10)
        let fromPoint = CGPoint(x: 5, y: 5)
        let scale = CGPoint(x: 2, y: 2)
        let scaledPoint = point.scale(from: fromPoint, by: scale)
        XCTAssertEqual(scaledPoint.x, 15, accuracy: 0.0001)
        XCTAssertEqual(scaledPoint.y, 15, accuracy: 0.0001)
    }
    
    func testScaleForReaching() {
        let point = CGPoint(x: 10, y: 10)
        let target = CGPoint(x: 20, y: 20)
        let from = CGPoint(x: 5, y: 5)
        let scale = point.scale(forReaching: target, byScalingFrom: from)
        XCTAssertEqual(scale.x, 3, accuracy: 0.0001)
        XCTAssertEqual(scale.y, 3, accuracy: 0.0001)
    }
    
    func testAdd() {
        let point = CGPoint(x: 10, y: 10)
        let xAdded = point.add(x: 5)
        XCTAssertEqual(xAdded.x, 15, accuracy: 0.0001)
        XCTAssertEqual(xAdded.y, 10, accuracy: 0.0001)
        let yAdded = point.add(y: 5)
        XCTAssertEqual(yAdded.x, 10, accuracy: 0.0001)
        XCTAssertEqual(yAdded.y, 15, accuracy: 0.0001)
    }
    
    func testDivide() {
        let point = CGPoint(x: 10, y: 10)
        let xDivided = point.divide(xBy: 5)
        XCTAssertEqual(xDivided.x, 2, accuracy: 0.0001)
        XCTAssertEqual(xDivided.y, 10, accuracy: 0.0001)
        let yDivided = point.divide(yBy: 5)
        XCTAssertEqual(yDivided.x, 10, accuracy: 0.0001)
        XCTAssertEqual(yDivided.y, 2, accuracy: 0.0001)
    }
    
    func testMultiply() {
        let point = CGPoint(x: 10, y: 10)
        let xMultiplied = point.multiply(xBy: 5)
        XCTAssertEqual(xMultiplied.x, 50, accuracy: 0.0001)
        XCTAssertEqual(xMultiplied.y, 10, accuracy: 0.0001)
        let yMultiplied = point.multiply(yBy: 5)
        XCTAssertEqual(yMultiplied.x, 10, accuracy: 0.0001)
        XCTAssertEqual(yMultiplied.y, 50, accuracy: 0.0001)
    }
    
    func testDistanceTo() {
        let point1 = CGPoint(x: 0, y: 0)
        let point2 = CGPoint(x: 3, y: 4)
        let distance = point1.distanceTo(point2)
        XCTAssertEqual(distance, 5, accuracy: 0.0001)
    }
    
    func testDistanceXYTo() {
        let point1 = CGPoint(x: 0, y: 0)
        let point2 = CGPoint(x: 3, y: 4)
        let distanceXY = point1.distanceXYTo(point2)
        XCTAssertEqual(distanceXY.x, 3, accuracy: 0.0001)
        XCTAssertEqual(distanceXY.y, 4, accuracy: 0.0001)
    }
    
    func testTranslation() {
        let point1 = CGPoint(x: 10, y: 10)
        let point2 = CGPoint(x: 5, y: 5)
        let translation = point1.translation(to: point2)
        XCTAssertEqual(translation.x, -5, accuracy: 0.0001)
        XCTAssertEqual(translation.y, -5, accuracy: 0.0001)
    }
    
    func testVectorLength() {
        let point = CGPoint(x: 3, y: 4)
        let vectorLength = point.vectorLength
        XCTAssertEqual(vectorLength, 5, accuracy: 0.0001)
    }
    
    func testRounded() {
        let point = CGPoint(x: 1.23456789, y: 9.87654321)
        let roundedPoint = point.rounded(decimal: 3)
        XCTAssertEqual(roundedPoint.x, 1.235, accuracy: 0.0001)
        XCTAssertEqual(roundedPoint.y, 9.877, accuracy: 0.0001)
    }
    
    func testSubtract() {
        let point = CGPoint(x: 10, y: 10)
        let xSubtracted = point.subtract(x: 5)
        XCTAssertEqual(xSubtracted.x, 5, accuracy: 0.0001)
        XCTAssertEqual(xSubtracted.y, 10, accuracy: 0.0001)
        let ySubtracted = point.subtract(y: 5)
        XCTAssertEqual(ySubtracted.x, 10, accuracy: 0.0001)
        XCTAssertEqual(ySubtracted.y, 5, accuracy: 0.0001)
    }
    
    func testColinear() {
        let point1 = CGPoint(x: 0, y: 0)
        let point2 = CGPoint(x: 1, y: 1)
        let point3 = CGPoint(x: 2, y: 2)
        XCTAssertTrue(point1.colinear(point2, point3))
        let point4 = CGPoint(x: 1, y: 0)
        let point5 = CGPoint(x: 0, y: 1)
        XCTAssertFalse(point1.colinear(point4, point5))
    }
    
}

final class EasyInitalizerAndRectTests: XCTestCase {
    
    func testCGPointInitWithCGSize() {
        let size = CGSize(width: 10, height: 20)
        let point = CGPoint(size)
        XCTAssertEqual(point.x, size.width)
        XCTAssertEqual(point.y, size.height)
    }
    
    func testCGPointInitWithXY() {
        let xy: CGFloat = 10
        let point = CGPoint(xy: xy)
        XCTAssertEqual(point.x, xy)
        XCTAssertEqual(point.y, xy)
    }
    
    func testCGRectInitWithCenterAndSize() {
        let center = CGPoint(x: 10, y: 20)
        let size = CGSize(width: 30, height: 40)
        let rect = CGRect(center: center, size: size)
        XCTAssertEqual(rect.origin.x, center.x - (size.width * 0.5))
        XCTAssertEqual(rect.origin.y, center.y - (size.height * 0.5))
        XCTAssertEqual(rect.size.width, size.width)
        XCTAssertEqual(rect.size.height, size.height)
    }
    
    func testCGSizeInitWithCGPoint() {
        let point = CGPoint(x: 10, y: 20)
        let size = CGSize(point)
        XCTAssertEqual(size.width, point.x)
        XCTAssertEqual(size.height, point.y)
    }
    
    func testCGSizeInitWithWH() {
        let wh: CGFloat = 10
        let size = CGSize(wh: wh)
        XCTAssertEqual(size.width, wh)
        XCTAssertEqual(size.height, wh)
    }
    
    
    func testArea() {
        let rect = CGRect(x: 0, y: 0, width: 10, height: 20)
        XCTAssertEqual(rect.area, 200)
    }
    
    func testCenter() {
        var rect = CGRect(x: 0, y: 0, width: 10, height: 20)
        rect.center = CGPoint(x: 5, y: 10)
        XCTAssertEqual(rect.origin.x, 0)
        XCTAssertEqual(rect.origin.y, 0)
    }
    
    func testTopLeft() {
        var rect = CGRect(x: 0, y: 0, width: 10, height: 20)
        rect.topLeft = CGPoint(x: 5, y: 10)
        XCTAssertEqual(rect.origin.x, 5)
        XCTAssertEqual(rect.origin.y, 10)
    }
    
    func testBottomLeft() {
        var rect = CGRect(x: 0, y: 0, width: 10, height: 20)
        rect.bottomLeft = CGPoint(x: 5, y: 10)
        XCTAssertEqual(rect.origin.x, 5)
        XCTAssertEqual(rect.origin.y, -10)
    }
    
    func testTopRight() {
        var rect = CGRect(x: 0, y: 0, width: 10, height: 20)
        rect.topRight = CGPoint(x: 5, y: 10)
        XCTAssertEqual(rect.origin.x, -5)
        XCTAssertEqual(rect.origin.y, 10)
    }
    
    func testBottomRight() {
        var rect = CGRect(x: 0, y: 0, width: 10, height: 20)
        rect.bottomRight = CGPoint(x: 5, y: 10)
        XCTAssertEqual(rect.origin.x, -5)
        XCTAssertEqual(rect.origin.y, -10)
    }
    
}
