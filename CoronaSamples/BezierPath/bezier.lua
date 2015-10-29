module(...,package.seeall)
-------------------------------------------------
-- bezier.lua
-- Version: 1.0
-- Author: Rajendra Pondel
-- Email: neostar20@gmail.com
-- Licence: MIT

-- Permission is hereby granted, free of charge, to any person obtaining a copy of 
-- this software and associated documentation files (the "Software"), to deal in the 
-- Software without restriction, including without limitation the rights to use, copy, 
-- modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, 
-- and to permit persons to whom the Software is furnished to do so, subject to the 
-- following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all copies 
-- or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
-- INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
-- PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
-- FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR 
-- OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
-- DEALINGS IN THE SOFTWARE.


local bezier = {}

function bezier:curve(xv, yv)
	local reductor = {__index = function(self, ind)
		return setmetatable({tree = self, level = ind}, {__index = function(curves, ind)
			return function(t)
				local x1, y1 = curves.tree[curves.level-1][ind](t)
				local x2, y2 = curves.tree[curves.level-1][ind+1](t)
				return x1 + (x2 - x1) * t, y1 + (y2 - y1) * t
				end
			end})
		end
	}
	local points = {}
	for i = 1, #xv do
		--print(i, xv[i], yv[i])
		points[i] = function(t) return xv[i], yv[i] end
	end
	return setmetatable({points}, reductor)[#points][1]
end

return bezier