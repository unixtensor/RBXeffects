-- interpreterK
-- github.

--[[
	All the effects use TweenService so you can control them with built-in TweenService functions such as: ":Play(), ":Cancel()", ".Completed", etc...
]]

local Module = {Autoplay = false}
Module.__index = Module

local F = {
	CN = CFrame.new,
	ANG = CFrame.Angles,
	V3 = Vector3.new,
	RN = Random.new,
	rad = math.rad,
	deg = math.deg,
	resume = coroutine.resume,
	create = coroutine.create
}
local TS = game:GetService("TweenService")

local function RandDec(min, max)
	return F.RN():NextNumber(min, max)
end

local function EnumExist(EnumType, Name)
	local b, Enum = pcall(function()
		return EnumType[Name]
	end)
	return b and Enum
end

local function TweeningInfo(Time, Style, Direction)
	return TweenInfo.new(unpack({
		Time or 1,
		EnumExist(Enum.EasingStyle, Style) or Enum.EasingStyle.Quad,
		EnumExist(Enum.EasingDirection, Direction) or Enum.EasingDirection.Out
	}))
end

local function IsAPart(Inst)
	return typeof(Inst) == "Instance" and Inst:IsA("BasePart")
end

function Module:ScatterOut(Part, rLimit, vLimit, ...)
	if IsAPart(Part) then
		rLimit = rLimit or {-360, 360}
		vLimit = vLimit or {-15, 15}

		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * F.ANG(F.rad(RandDec(unpack(rLimit))), F.rad(RandDec(unpack(rLimit))), F.rad(RandDec(unpack(rLimit)))) * F.CN(RandDec(unpack(vLimit)), RandDec(unpack(vLimit)), RandDec(unpack(vLimit)))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:AnglelessScatterOut(Part, vLimit, ...)
	if IsAPart(Part) then
		vLimit = vLimit or {-15, 15}
		
		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * F.CN(RandDec(unpack(vLimit)), RandDec(unpack(vLimit)), RandDec(unpack(vLimit)))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:CompleteScatterOut(Part, Xlimit, Ylimit, Zlimit, Rlimit, ...)
	if IsAPart(Part) then
		Xlimit = Xlimit or {-50, 50}
		Ylimit = Ylimit or {-50, 50}
		Zlimit = Zlimit or {-50, 50}
		Rlimit = Rlimit or {-50, 50}

		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * F.CN(RandDec(unpack(Xlimit)), RandDec(unpack(Ylimit)), RandDec(unpack(Zlimit))) * F.ANG(F.rad(RandDec(unpack(Rlimit))), F.rad(RandDec(unpack(Rlimit))), F.rad(RandDec(unpack(Rlimit))))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:SizeFactor(Part, sLimit, ...)
	if IsAPart(Part) then
		sLimit = sLimit or {0, 0, 0}

		local Tween = TS:Create(Part, TweeningInfo(...), {
			Size = F.V3(unpack(sLimit))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:FadeOut(Part, Stop, ...)
	if IsAPart(Part) then
		Stop = Stop and Stop < 1 and Stop or 1

		local Tween = TS:Create(Part, TweeningInfo(...), {
			Transparency = Stop
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:FadeIn(Part, Stop, ...)
	if IsAPart(Part) then
		Stop = Stop and Stop > 1 and Stop or 0

		local Tween = TS:Create(Part, TweeningInfo(...), {
			Transparency = Stop
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:FloatUp(Part, DownBarrier, UpLimit, ...)
	if IsAPart(Part) then
		UpLimit = UpLimit or 50
		DownBarrier = DownBarrier or 30

		Part.CFrame = Part.CFrame - F.V3(0, DownBarrier, 0)
		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame + F.V3(0, UpLimit, 0)
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:RandomRotate(Part, rLimit, ...)
	if IsAPart(Part) then
		rLimit = rLimit or {-360, 360}

		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * F.ANG(F.rad(RandDec(unpack(rLimit))), F.rad(RandDec(unpack(rLimit))), F.rad(RandDec(unpack(rLimit))))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:RandomCFrame(Part, cLimit, ...)
	if IsAPart(Part) then
		cLimit = cLimit or {-20, 20}
		
		local Tween = TS:Create(Part, TweenInfo(...), {
			CFrame = Part.CFrame * F.CN(unpack(cLimit), unpack(cLimit), unpack(cLimit))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

return Module
