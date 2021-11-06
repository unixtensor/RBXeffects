-- interpreterK
-- github.

local Module = {
	Autoplay = false
}
Module.__index = Module

local F = {
	rand = math.random,
	CN = CFrame.new,
	ANG = CFrame.Angles,
	V3 = Vector3.new,
	rad = math.rad,
	abs = math.abs,
	sin = math.sin,
	cos = math.cos,
	pi = math.pi,
	Euler = CFrame.fromEulerAnglesXYZ
}
local TS = game:GetService("TweenService")

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

---------
function Module:ScatterOut(Part, rLimit, vLimit, ...)
	if IsAPart(Part) then
		rLimit = rLimit or {-360, 360}
		vLimit = vLimit or {-15, 15}
		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * (F.ANG(F.rad(F.rand(unpack(rLimit))),F.rad(F.rand(unpack(rLimit))),F.rad(F.rand(unpack(rLimit))))) * (F.CN(F.rand(unpack(vLimit)),F.rand(unpack(vLimit)),F.rand(unpack(vLimit))))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:SizeOut(Part, sLimit, ...)
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
			LocalTransparencyModifier = Stop
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
			LocalTransparencyModifier = Stop
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

function Module:LinearCircle(N, Noffset, D, doffset)
	return F.CN(0, Noffset * F.sin(N / tick()), 0) * F.CN(0, 0, doffset * F.cos(D / tick()))
end

function Module:SpinRight(Part, ...)
	if IsAPart(Part) then
		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * F.Euler(0, 9000, 9000)
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

return Module