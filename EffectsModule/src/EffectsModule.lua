-- interpreterK
-- github.

local Module = {Autoplay = false}
Module.__index = Module

local F = {
	rand = math.random,
	CN = CFrame.new,
	ANG = CFrame.Angles,
	V3 = Vector3.new,
	RN = Random.new,
	rad = math.rad,
	abs = math.abs,
	sin = math.sin,
	cos = math.cos,
	pi = math.pi,
	Euler = CFrame.fromEulerAnglesXYZ
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

function Module:SpewOut(Part, Xlimit, Ylimit, Zlimit, Rlimit, ...)
	if IsAPart(Part) then
		Xlimit = Xlimit or {-100, 100}
		Ylimit = Ylimit or {-100, 100}
		Zlimit = Zlimit or {-100, 100}
		Rlimit = Rlimit or {-360, 360}

		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = Part.CFrame * F.CN(RandDec(unpack(Xlimit)), RandDec(unpack(Ylimit)), RandDec(unpack(Zlimit))) * F.ANG(F.rad(RandDec(unpack(Rlimit))), F.rad(RandDec(unpack(Rlimit))), F.rad(RandDec(unpack(Rlimit))))
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end

function Module:SpewIn(Part, Xlimit, Ylimit, Zlimit, Rlimit, ...)
	if IsAPart(Part) then
		local CF = Part.CFrame
		Xlimit = Xlimit or {-100, 100}
		Ylimit = Ylimit or {-100, 100}
		Zlimit = Zlimit or {-100, 100}
		Rlimit = Rlimit or {-360, 360}

		Part.CFrame *= F.CN(RandDec(unpack(Xlimit)), RandDec(unpack(Ylimit)), RandDec(unpack(Zlimit))) * F.ANG(F.rad(RandDec(unpack(Rlimit))), F.rad(RandDec(unpack(Rlimit))), F.rad(RandDec(unpack(Rlimit))))
		local Tween = TS:Create(Part, TweeningInfo(...), {
			CFrame = CF
		})
		if self.Autoplay then
			Tween:Play()
		end
		return Tween, Part
	end
end


return Module
