local bezier = require( "bezier" )

-- Adjust these to play around!
local numPathPoints = 100                 -- How many path points should we create? This number includes the start and end points.
local timeToTravelPath = 800.0           -- How long should it take to travel the path from begining to end?
local orientToPath = true                 -- Should we rotate the image so that it appears to be flying along the path points?
local interpolateBetweenPathPoints = true -- Should we simply move the object from point to point or attempt to interpolate between them?


local numControlPoints = 4
local pathPoints = nil

local textGroup = display.newGroup()
local instructionText = nil
local visualBezierPath = nil

local numActiveControlPoints = 0
local visualControlPoints = {}
local visualHandleLines = {}

local currentPathPoint = 1
local reCreatePath = false
local reStartAnimation = false

local prevTime = 0
local elapsedTimeSinceLastPathPoint = 0

local timeBetweenPathPoints = timeToTravelPath / numPathPoints	
local prevX = 0
local prevY = 0
local prevAngle = 0
local f22Raptor = nil
local ONE_EIGHTY_DIVIDED_BY_PI = 180 / 3.14159265358

display.setStatusBar( display.HiddenStatusBar )
display.setDefault( "background", 0.4, 0.4, 0.8 )

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function getDeltaTime()
	
   local currentTime = system.getTimer()
   local dt = currentTime - prevTime
   prevTime = currentTime

   return dt

end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function createBezierPathPoints( numPathPoints )
	
	if numPathPoints < 2 then
		print( "Error callling createBezierPathPoints - The argument numPathPoints must be greater than 2 for a valid path.")
	end
	
	local pathPoints = {}
	
	-- Get the 4 control points defined by our two handles.
	
	-- Handle 1.
	local p1 = visualControlPoints[1]
	local p2 = visualControlPoints[2]
	
	-- Handle 2.
	local p3 = visualControlPoints[3]
	local p4 = visualControlPoints[4]
	
	-- Feed the control points into the bezier module to create a function capable of
	-- generating the 2D coordinates that lay along the bezier curve.
	local bezierCurve = bezier:curve( {p1.x, p2.x, p3.x, p4.x}, 
	                                  {p1.y, p2.y, p3.y, p4.y} )
	
	-- Use our Bezier curve function to generate a set of path points.
	-- We can use these path point to both render the bezier path and 
	-- to animate a game object along it.
	
	-- We will use our Bezier curve function to create N number of path 
	-- points based on numPathPoints. Keep in mind that the curve function 
	-- only takes values within the range 0.0, to 1.0
	
	local stepValue = 1.0 / (numPathPoints-1)
	local currentStepValue = 0.0
	
	for i = 1, numPathPoints do

		local x, y = bezierCurve( currentStepValue )
		table.insert( pathPoints, { x = x, y = y } )

		currentStepValue = currentStepValue + stepValue

	end
	
	return pathPoints
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function createVisualBezierPath()
	
	if visualBezierPath then
		display.remove( visualBezierPath )
	end
	
	-- Get the first 2 path points to start the line.
	local p1x = pathPoints[1].x
	local p1y = pathPoints[1].y

	local p2x = pathPoints[2].x
	local p2y = pathPoints[2].y

	visualBezierPath = display.newLine( p1x, p1y, p2x, p2y )
	visualBezierPath:setStrokeColor( 255, 255, 255 )
	visualBezierPath.strokeWidth = 2

	-- Once the line has been started - append the rest of the path points 
	-- to build a path composed of a series of lines.
	for i = 3, #pathPoints do
		visualBezierPath:append( pathPoints[i].x, pathPoints[i].y )
	end
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function lerp( a, b, t )
	return a + (b - a) * t
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function onEnterFrame( event )

	elapsedTimeSinceLastPathPoint = elapsedTimeSinceLastPathPoint + getDeltaTime()
	
	if reCreatePath then

		pathPoints = createBezierPathPoints( numPathPoints )
		
		createVisualBezierPath()

		f22Raptor.isVisible = false

		return
		
	end
	
	if reStartAnimation then
		
		f22Raptor.rotation = 0
		f22Raptor.x = pathPoints[1].x
		f22Raptor.y = pathPoints[1].y
		f22Raptor:toFront()

		prevX = 0
		prevY = 0
		prevAngle = 0

		elapsedTimeSinceLastPathPoint = 0
		currentPathPoint = 1;
		prevTime = system.getTimer()

		f22Raptor.isVisible = true

		reStartAnimation = false

	end
	
	local px = 0
	local py = 0
	local updateRotation = false
	
	if elapsedTimeSinceLastPathPoint >= timeBetweenPathPoints and currentPathPoint < #pathPoints then

		-- Enough time has elapsed to simply jump to the next path point - so do it!
		
		-- If the rendering is really slow, we may need to skip a few path points.
		local numPathPointsToMovePast = math.floor(elapsedTimeSinceLastPathPoint / timeBetweenPathPoints)
		
		local nextPathPoint = currentPathPoint + numPathPointsToMovePast
		
		if nextPathPoint >= #pathPoints then
			nextPathPoint = #pathPoints
		end
		
		px = pathPoints[nextPathPoint].x
		py = pathPoints[nextPathPoint].y

		f22Raptor.x = px
		f22Raptor.y = py
		
		currentPathPoint = nextPathPoint
		
		elapsedTimeSinceLastPathPoint = 0
		
		updateRotation = true
		
	elseif interpolateBetweenPathPoints then
		
		-- Enough time has NOT elpased to move to the next path point but we can still
		-- do a linear interpolation between the current path point and the next as we
		-- wait for the time required to move to the next point to count down.
		
		if currentPathPoint < #pathPoints then
				
			local stepValue = 1.0 / timeBetweenPathPoints
			local t = elapsedTimeSinceLastPathPoint * stepValue
			
			px = lerp( pathPoints[currentPathPoint].x, pathPoints[currentPathPoint+1].x, t )
			py = lerp( pathPoints[currentPathPoint].y, pathPoints[currentPathPoint+1].y, t )
			
			f22Raptor.x = px
			f22Raptor.y = py
			
			updateRotation = true
			
		end
		
	end
	
	if updateRotation and orientToPath and currentPathPoint < #pathPoints then
		
		-- Rotate the image so that it appears to be flying along the path points.
		local angle = math.atan2( py - prevY, px - prevX)
		angle = angle * ONE_EIGHTY_DIVIDED_BY_PI
		f22Raptor:rotate( angle - prevAngle );
		prevAngle = angle
		prevX = px
		prevY = py
		
	end
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function addVisualControlPoint( x, y )
	
	numActiveControlPoints = numActiveControlPoints + 1
	
	local point = display.newCircle( x, y, 5 )
	
	visualControlPoints[#visualControlPoints+1] = point
	
	if #visualControlPoints == 1 then
		point:setFillColor( 1.0, 0.0, 0.0 )
	elseif #visualControlPoints == 2 then
		point:setFillColor( 0.0, 1.0, 0.0 )
	elseif #visualControlPoints == 3 then
		point:setFillColor( 0.0, 1.0, 0.0 )
	else
		point:setFillColor( 1.0, 0.0, 0.0 )
	end
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function addVisualControlHandle( handle, startX, startY, endX, endY )

	if visualHandleLines[handle] then
		display.remove(visualHandleLines[handle])
	end
	
	local line = display.newLine( startX, startY, endX, endY )
	line:toBack()
	line:setStrokeColor( 0 )
	line.strokeWidth = 2
	visualHandleLines[handle] = line
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function onTouchDragControlPoints( event )

	local target = event.target

	local phase = event.phase
	
	if "began" == phase then
		
		-- Make target the top-most object
		local parent = target.parent
		parent:insert( target )
		display.getCurrentStage():setFocus( target )

		target.isFocus = true

		target.x0 = event.x - target.x
		target.y0 = event.y - target.y
		
	elseif target.isFocus then
			
		if "moved" == phase then
			
			-- Make object move (we subtract t.x0,t.y0 so that moves are
			-- relative to initial grab point, rather than object "snapping").
			target.x = event.x - target.x0
			target.y = event.y - target.y0
			
			reCreatePath = true
			
			if target == visualControlPoints[1] or target ==  visualControlPoints[2] then
				addVisualControlHandle( 1, visualControlPoints[1].x, visualControlPoints[1].y, visualControlPoints[2].x, visualControlPoints[2].y )
			elseif target == visualControlPoints[3] or target ==  visualControlPoints[4] then
				addVisualControlHandle( 2, visualControlPoints[3].x, visualControlPoints[3].y, visualControlPoints[4].x, visualControlPoints[4].y )
			end
			
		elseif "ended" == phase or "cancelled" == phase then
		
			display.getCurrentStage():setFocus( nil )
			target.isFocus = false
			
			reCreatePath = false
			reStartAnimation = true
			
			print("-------------------------------------------------")
			print( "Start:    ", tostring(visualControlPoints[1].x), ", ", tostring(visualControlPoints[1].y) )
			print( "Start CP: ", tostring(visualControlPoints[2].x), ", ", tostring(visualControlPoints[2].y) )
			print( "End:      ", tostring(visualControlPoints[4].x), ", ", tostring(visualControlPoints[4].y) )
			print( "End CP:   ", tostring(visualControlPoints[3].x), ", ", tostring(visualControlPoints[3].y) )
			
		end
		
	end

	return true
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function addTouchEventsForControlPoints()

	for i = 1, #visualControlPoints do
		visualControlPoints[i]:addEventListener( "touch", onTouchDragControlPoints )
	end
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function onTouchPlaceControlPoints( event )

	if event.phase == "began" then

		if numActiveControlPoints < 4 then
			addVisualControlPoint( event.x, event.y )
		end
		
	elseif event.phase == "moved" then
		
		if numActiveControlPoints == 1 or numActiveControlPoints == 3 then
			
			addVisualControlPoint( event.x, event.y )
			
		elseif numActiveControlPoints == 2 or numActiveControlPoints == 4 then
			
			visualControlPoints[numActiveControlPoints].x = event.x
			visualControlPoints[numActiveControlPoints].y = event.y
			
			if numActiveControlPoints == 2 then
				
				addVisualControlHandle( 1, visualControlPoints[1].x, visualControlPoints[1].y, event.x, event.y )
				
			elseif numActiveControlPoints == 4 then
				
				addVisualControlHandle( 2, visualControlPoints[3].x, visualControlPoints[3].y, event.x, event.y )
				
				pathPoints = createBezierPathPoints( numPathPoints )
				
				createVisualBezierPath()
				
			end
			
		end
		
	elseif event.phase == "ended" then
	
		if numActiveControlPoints == 2 then
			
			if instructionText.trans then
				transition.cancel( instructionText.trans )
				instructionText.trans = nil
			end
			
			instructionText.trans = transition.to( instructionText, { time=500*instructionText.alpha, alpha=0,
				onComplete=function()
					transition.cancel( instructionText.trans )
					instructionText.text = "Click and drag handle 2"
					instructionText.trans = transition.to( instructionText, { time=500, delay=150, alpha=1 } )
				end
			} )
		
		elseif numActiveControlPoints == 4 then
			
			instructionText.trans = transition.to( instructionText, { time = 500, delay = 150, alpha = 0 } )
			
			Runtime:removeEventListener( "touch", onTouchPlaceControlPoints )
			
			addTouchEventsForControlPoints()
			
			elapsedTimeSinceLastPathPoint = 0
			currentPathPoint = 1;
			prevTime = system.getTimer()
			
			f22Raptor = display.newImageRect( "f22_raptor.png", 50, 36 )
			
			Runtime:addEventListener( "enterFrame", onEnterFrame )
			
		end
		
	end
	
end

----------------------------------------------------------------------------------------
-- 
----------------------------------------------------------------------------------------
local function start()

	instructionText = display.newText( textGroup, "Click and drag handle 1", display.contentCenterX, 30, "HelveticaNeue-UltraLight", 20 )
	instructionText.alpha = 0
	instructionText.trans = transition.to( instructionText, { time = 500, delay = 150, alpha = 1 } )

	Runtime:addEventListener( "touch", onTouchPlaceControlPoints )
	
end

start()
