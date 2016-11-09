module Main where
import Plot
import Graphics.GD
import Data.Complex

imageDim :: Size
imageDim = (600,600)

-- How many iterations before  we declare the point doesn't diverge
maxIter = 127

-- Coordinates in the complex plane to graph
-- First coordinate must be top left.
mbWindow :: Window
mbWindow = ( (-1.9, 1.3), (0.7, -1.3) ) -- Full view

main :: IO ()
main = drawPlot drawMandelbrot imageDim mbWindow "mandelbrot.png"

drawMandelbrot :: Coordinate -> Color
drawMandelbrot (x,y) = colorIterations $ mandelbrot (x :+ y) (0 :+ 0) 0

-- Count number of iterations for the given point to diverge
-- Non-diverging points return 0
mandelbrot :: Complex Double -- Coordinate to test
           -> Complex Double -- Iterating Z value
           -> Int -- Current iteration
           -> Int -- Iterations before diverging
mandelbrot c z iter
    | iter > maxIter = 0
    | otherwise = let z' = z^2 + c in
                  if magnitude z' > 2
                  then iter
                  else mandelbrot c z' (iter+1)

colorIterations :: Int -> Color
colorIterations x
    | x > maxIter = rgb 255 255 255
    | otherwise = let c = x*2
                  in rgb c x x