if not game:IsLoaded() then game.Loaded:Wait() end

local ps, rs, ru, cl = game:GetService("Players"), game:GetService("ReplicatedStorage"), game:GetService("RunService"), game:GetService("CollectionService")
repeat task.wait() until ps.LocalPlayer

local lp = ps.LocalPlayer
local es = require(rs:WaitForChild("Client"):WaitForChild("EggState"))
local ad = require(rs:WaitForChild("Data"):WaitForChild("Assets"))
local si = require(rs:WaitForChild("Shared"):WaitForChild("Util"):WaitForChild("AreaEggSlotIdentity"))
local cy = require(rs:WaitForChild("Shared"):WaitForChild("Util"):WaitForChild("AreaEggCycle"))
local rg = require(rs:WaitForChild("Shared"):WaitForChild("Modules"):WaitForChild("Ragdoll"))
local ai = require(rs:WaitForChild("Shared"):WaitForChild("Util"):WaitForChild("AssetItems"))
local er = require(rs:WaitForChild("Shared"):WaitForChild("Util"):WaitForChild("EggRecords"))
local sv = require(rs:WaitForChild("Shared"):WaitForChild("Save"))
local rm = require(rs:WaitForChild("Shared"):WaitForChild("Remotes"))
local hh = require(rs:WaitForChild("Client"):WaitForChild("HiddenUIHandler"))
local tq = require(rs:WaitForChild("Packages"):WaitForChild("TopBarPlus"))
local dr = ad.Directory or ad
repeat
	task.wait(0.2)
	local c = lp.Character
	local ok, f = pcall(es.HasFieldSnapshot)
until lp:GetAttribute("ProfileReady") == true and ok and f == true and c and c:FindFirstChild("HumanoidRootPart")

local ge = getgenv()
if ge.__BkSae then
	if ge.__BkSae.Stop then pcall(ge.__BkSae.Stop, true) end
	ge.__BkSae.on = false
	for _, c in ge.__BkSae.cn do pcall(function() c:Disconnect() end) end
	for _, c in ge.__BkSae.tc or {} do pcall(function() c:Disconnect() end) end
	for p, v in ge.__BkSae.ta or {} do if p.Parent then pcall(function() p.CanTouch = v end) end end
	for _, c in ge.__BkSae.uc or {} do pcall(function() c:Disconnect() end) end
	for h in ge.__BkSae.uh or {} do pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Physics, true) end) end
	pcall(function()
		local c = require(lp.PlayerScripts.PlayerModule):GetControls()
		if rawget(c, "GetMoveVector") then c.GetMoveVector = nil end
	end)
end
local st ={on = false, g = 0, cn = {}, bl = {}, bk = {}, sl = {}, so = nil, sc = nil, dc = nil, n = 0, ms = "Idle", at = nil, h0 = nil, rz = 4, mr = {}, az = {}, wf = nil, wo = false, bx = false, fp = false, gr = false, ra = false, rg = 0, rx = false, rv = false, rmv = nil, ss = false, sg = 0, sx = false, sc3 = 0, sb = false, gx = false, gg = 0, lx = false, lb = false, tq = false, th = 0, tx = false, tb = false, rsh = 0, pu = nil, dw = 0.3, pc = 0, ps = false, es = false, sp = {}, se = {}, pf = nil, fm = 1.15, gc = 0, ct = nil, sr = false, fz = false, nd = true, qc = {}, pv = false, mc = {}, me = {}, ft = 0, fb = nil, hq = false, ta = {}, tc = {}, pi = false, bt = nil, tr = nil, uc = {}, uh = {}, uu = 0, bf = false, bo = false, bi = 0, ap = false, mq = 0, ah = false, hf = {}}
ge.__BkSae = st
pcall(function() if not isfolder("BaKhi") then makefolder("BaKhi") end end)

local function lg(s)
	if s == st.ms then return end
	st.ms = s
	print("[Sae] " .. s)
	pcall(appendfile, "BaKhi/SaeLog.txt", string.format("%s %s\n", os.date("%H:%M:%S"), s))
end

local function rt()
	local c = lp.Character
	return c and c:FindFirstChild("HumanoidRootPart"), c and c:FindFirstChildOfClass("Humanoid")
end

local L
local function kv() return true end

local function sp()
	local w = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
	local a = w and w:FindFirstChild("Areas")
	local l = a and a:FindFirstChild("SeparationLine")
	return l and l:IsA("BasePart") and l or nil
end

local function cz()
	local w = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
	local a = w and w:FindFirstChild("Areas")
	local b = a and a:FindFirstChild("EggCarryBounds")
	local g = b and b:FindFirstChild("Gameplay1")
	if not (g and g:IsA("BasePart")) then return nil end
	return g.Position.Z - g.Size.Z / 2 + 15, g.Position.Z + g.Size.Z / 2 - 15
end

local function dl()
	if workspace:GetAttribute("Event_AdminAbuse") == true then return math.huge end
	local t = workspace:GetServerTimeNow()
	local o1, n = pcall(cy.IsNightPhase, t)
	local o2, ns = pcall(cy.NightStartTime, t)
	local o3, nr = pcall(cy.NextResetTime, t)
	if not (o1 and o2 and o3) or type(ns) ~= "number" or type(nr) ~= "number" then return nil, "Cycle Read Failed" end
	if n or t - (nr - cy.ResetPeriodSeconds) < 5 then return 0 end
	return ns - t
end

local function fs()
	local l, h = sp(), rt()
	return l ~= nil and h ~= nil and l.CFrame.LookVector:Dot(h.Position - l.Position) > 0
end

local function cr()
	local ok, s = pcall(es.ReadCarryState)
	return ok and type(s) == "table" and s.IsCarrying == true
end

local function av(u)
	local ok, r = pcall(es.ReadFieldEgg, u)
	return ok and type(r) == "table" and (r.State == "Slot" or r.State == "Dropped")
end

local function cd()
	local ok, s = pcall(es.ReadFieldEggs)
	if not ok or type(s) ~= "table" then return {} end
	local o, t, ix, oc = {}, os.clock(), {}, {}
	if st.pi then
		local o3, v = pcall(sv.Await)
		ix = o3 and type(v) == "table" and type(v.Index) == "table" and v.Index or {}
		local o4, w = pcall(es.ReadOwnerEggs, lp.UserId)
		for _, x in o4 and type(w) == "table" and w or {} do
			if type(x) == "table" and type(x.AssetCategory) == "string" then oc[x.AssetCategory] = true end
		end
	end
	for _, r in s.Records or {} do
		local a = dr[r.AssetCategory]
		local wt
		if st.wf then wt = st.wf.a and r.AreaId == st.wf.a or st.wf.r and a and a.Rarity and a.Rarity._id == st.wf.r or false elseif st.pi then wt = ix[r.AssetCategory] ~= true and not oc[r.AssetCategory] elseif next(st.az) then wt = st.az[r.AreaId] == true else wt = a and a.Rarity and st.mr[a.Rarity._id] end
		if a and (r.State == "Slot" or r.State == "Dropped") and typeof(r.BoundsCFrame) == "CFrame" and (st.bl[r.Uid] or 0) < t and wt then
			o[#o + 1] = {u = r.Uid, r = r, k = tonumber(a.Rarity and a.Rarity.Rank) or 0, e = tonumber(a.EarningRate) or 0, p = r.BoundsCFrame.Position}
		end
	end
	table.sort(o, function(x, y)
		if (x.u == st.pu) ~= (y.u == st.pu) then return x.u == st.pu end
		if x.k ~= y.k then return x.k > y.k end
		return x.e > y.e
	end)
	return o
end

local gd = {[Enum.HumanoidStateType.Running] = true, [Enum.HumanoidStateType.RunningNoPhysics] = true, [Enum.HumanoidStateType.Landed] = true}

local function ct(hu)
	pcall(function() require(lp.PlayerScripts.PlayerModule):GetControls().humanoid = hu end)
end

local function ra(ch)
	local a = ch and ch:FindFirstChild("Animate")
	if not (a and a:IsA("LocalScript")) then return end
	task.spawn(function()
		a.Enabled = false
		task.wait()
		a.Enabled = true
	end)
end

local function fz(on)
	if on ~= st.fz then
		st.fz = on
		local c = lp.Character
		local a = c and c:FindFirstChild("Animate")
		if a and a:IsA("LocalScript") then a.Enabled = not on end
	end
	if not on then return end
	local _, hu = rt()
	local am = hu and hu:FindFirstChildOfClass("Animator")
	for _, t in am and am:GetPlayingAnimationTracks() or {} do pcall(function() t:Stop(0) end) end
end

local function ul()
	for _, c in st.sl do pcall(function() c:Disconnect() end) end
	table.clear(st.sl)
end

local function qh(on)
	local pg = lp:FindFirstChildOfClass("PlayerGui")
	local oi, ic = pcall(tq.getIcon, "Settings")
	if not oi or type(ic) ~= "table" then ic = nil end
	if not on then
		for _, c in st.qc do pcall(function() c:Disconnect() end) end
		table.clear(st.qc)
		for _, n in {"HUD", "BackpackGui"} do
			local g = pg and pg:FindFirstChild(n)
			if g and g:IsA("ScreenGui") and hh.IsHidden() then g.Enabled = false end
		end
		if ic and hh.IsHidden() then pcall(ic.setEnabled, ic, false) end
		return
	end
	if #st.qc > 0 then return end
	if ic then
		local function fi()
			task.defer(function()
				if ge.__BkSae == st and #st.qc > 0 and hh.IsHidden() and not ic.isEnabled then pcall(ic.setEnabled, ic, true) end
			end)
		end
		local o, c = pcall(function() return hh.Changed:Connect(fi) end)
		if o and c then st.qc[#st.qc + 1] = c end
		fi()
	end
	if pg then
		local oc = Color3.fromRGB(255, 175, 0)
		st.qc[#st.qc + 1] = pg.DescendantAdded:Connect(function(d)
			if d:IsA("Frame") and d.Parent and d.Parent.Name == "OverlayUI" and d.BackgroundColor3 == oc then d.Visible = false end
		end)
	end
	for _, n in {"RunBackEffects", "DropHeldEgg", "AreaGui", "HUD", "BackpackGui"} do
		local g = pg and pg:FindFirstChild(n)
		if g and g:IsA("ScreenGui") then
			local v = n == "HUD" or n == "BackpackGui"
			local function f() if g.Enabled ~= v and (not v or hh.IsHidden()) then g.Enabled = v end end
			f()
			st.qc[#st.qc + 1] = g:GetPropertyChangedSignal("Enabled"):Connect(f)
		end
	end
end

local function sm(on)
	if not on then
		for _, c in st.mc do pcall(function() c:Disconnect() end) end
		for _, e in st.me do pcall(function() e:Destroy() end) end
		table.clear(st.mc)
		table.clear(st.me)
		return
	end
	if #st.mc > 0 then return end
	local w = workspace:FindFirstChild("World")
	local ga = w and w:FindFirstChild("Areas") and w.Areas:FindFirstChild("GuardAreas")
	local mt2 = game:GetService("SoundService"):FindFirstChild("MusicTracks")
	local cb = rs:FindFirstChild("Controllers") and rs.Controllers:FindFirstChild("Game") and rs.Controllers.Game:FindFirstChild("AreaEggsController")
	cb = cb and cb:FindFirstChild("CarryRunBackEffects")
	local gn = {AfterWakeSound = true, Detected = true, FootstepSound = true}
	local function mu(s)
		if not s:IsA("Sound") or s:FindFirstChild("SaeMute") then return end
		local e = Instance.new("EqualizerSoundEffect")
		e.Name, e.LowGain, e.MidGain, e.HighGain, e.Priority = "SaeMute", -80, -80, -80, 1000
		e.Parent = s
		st.me[#st.me + 1] = e
	end
	local function gs(d) if gn[d.Name] then mu(d) end end
	if ga then
		for _, d in ga:GetDescendants() do gs(d) end
		st.mc[#st.mc + 1] = ga.DescendantAdded:Connect(gs)
	end
	if mt2 and mt2:FindFirstChild("ChaseMusic") then mu(mt2.ChaseMusic) end
	if cb then
		for _, d in cb:GetChildren() do mu(d) end
		st.mc[#st.mc + 1] = cb.ChildAdded:Connect(mu)
	end
end


local function hv(ch, v)
	for _, p in ch and ch:GetDescendants() or {} do
		if p:IsA("BasePart") or p:IsA("Decal") then p.LocalTransparencyModifier = v end
	end
end

local function dk()
	local d = st.dc
	st.dc = nil
	if d then pcall(function() d:Destroy() end) end
	hv(lp.Character, 0)
end

local function dm(ch)
	local r = ch:FindFirstChild("HumanoidRootPart")
	if not r then return end
	ch.Archivable = true
	local ok, d = pcall(ch.Clone, ch)
	ch.Archivable = false
	if not ok or not d then return end
	d.Name = "Decoy"
	for _, x in d:GetDescendants() do
		if x:IsA("LuaSourceContainer") or x:IsA("Tool") or x:IsA("ForceField") then
			x:Destroy()
		elseif x:IsA("BasePart") then
			x.CanCollide, x.CanQuery, x.CanTouch, x.Anchored = false, false, false, x.Name == "HumanoidRootPart"
		end
	end
	local dr2 = d:FindFirstChild("HumanoidRootPart")
	if dr2 then dr2.CFrame = r.CFrame + Vector3.new(0, 4000, 0) end
	d.Parent = workspace.CurrentCamera
	local dh = d:FindFirstChildOfClass("Humanoid")
	local am, an = dh and dh:FindFirstChildOfClass("Animator"), ch:FindFirstChild("Animate")
	local id = an and an:FindFirstChild("idle") and an.idle:FindFirstChild("Animation1")
	if am and id then pcall(function() local t = am:LoadAnimation(id) t.Looped = true t:Play() end) end
	st.dc = d
	return dh
end

local function cs(ch, dh)
	workspace.CurrentCamera.CameraSubject = dh
	hv(ch, 1)
end

local function rv()
	st.pv = true
	if not st.dc then return end
	dk()
	local _, hu = rt()
	if hu then workspace.CurrentCamera.CameraSubject = hu end
end

local function aq(on)
	if on and #st.tc > 0 then return end
	for _, c in st.tc do pcall(function() c:Disconnect() end) end
	table.clear(st.tc)
	if not on then
		for p, v in st.ta do
			if p.Parent then pcall(function() p.CanTouch = v end) end
		end
		table.clear(st.ta)
		return
	end
	local function np(p)
		if not p:IsA("BasePart") or st.ta[p] ~= nil then return end
		st.ta[p] = p.CanTouch
		pcall(function() p.CanTouch = false end)
		st.tc[#st.tc + 1] = p:GetPropertyChangedSignal("CanTouch"):Connect(function() if p.CanTouch then p.CanTouch = false end end)
	end
	local function tr(t)
		if not t.Parent or t:GetAttribute("Owner") == lp.Name then return end
		np(t)
		for _, d in t:GetDescendants() do np(d) end
		st.tc[#st.tc + 1] = t.DescendantAdded:Connect(np)
	end
	for _, t in cl:GetTagged("PlacedTrap") do pcall(tr, t) end
	st.tc[#st.tc + 1] = cl:GetInstanceAddedSignal("PlacedTrap"):Connect(function(t) task.defer(pcall, tr, t) end)
end

local function su(on)
	for _, c in st.uc do pcall(function() c:Disconnect() end) end
	table.clear(st.uc)
	for h in st.uh do pcall(function() h:SetStateEnabled(Enum.HumanoidStateType.Physics, true) end) end
	table.clear(st.uh)
	if not on then return end
	local ph = Enum.HumanoidStateType.Physics
	local function nd(d)
		if d:IsA("Motor6D") then
			if not d.Enabled then d.Enabled = true end
			st.uc[#st.uc + 1] = d:GetPropertyChangedSignal("Enabled"):Connect(function() if not d.Enabled then d.Enabled = true end end)
		elseif (d:IsA("BallSocketConstraint") or d:IsA("HingeConstraint")) and d:GetAttribute("RagdollConstraint") then
			d.Enabled = false
		elseif d:IsA("Humanoid") and not st.uh[d] then
			st.uh[d] = true
			pcall(function() d:SetStateEnabled(ph, false) end)
			st.uc[#st.uc + 1] = d.StateChanged:Connect(function(_, n) if n == ph then pcall(function() d:ChangeState(Enum.HumanoidStateType.GettingUp) end) end end)
		end
	end
	local function bc(ch)
		for _, d in ch:GetDescendants() do nd(d) end
		st.uc[#st.uc + 1] = ch.DescendantAdded:Connect(nd)
	end
	if lp.Character then bc(lp.Character) end
	st.uc[#st.uc + 1] = lp.CharacterAdded:Connect(bc)
	st.uc[#st.uc + 1] = lp:GetAttributeChangedSignal("RagdollEndTime"):Connect(function() st.uu = os.clock() + 0.5 end)
	st.uc[#st.uc + 1] = ru.Heartbeat:Connect(function()
		if os.clock() >= st.uu then return end
		local h, hu = rt()
		if not h or not hu then return end
		local v = h.AssemblyLinearVelocity
		local hv, ws = Vector3.new(v.X, 0, v.Z), hu.WalkSpeed
		if hv.Magnitude <= ws and v.Y <= 0 then return end
		if hv.Magnitude > ws then hv = hv.Unit * ws end
		h.AssemblyLinearVelocity = Vector3.new(hv.X, math.min(v.Y, 0), hv.Z)
	end)
end

local function un()
	ul()
	qh(false)
	sm(false)
	dk()
	fz(false)
	local ch, o, c = lp.Character, st.so, st.sc
	st.so, st.sc = nil, nil
	if not (o and c and ch and o.Parent == nil and c.Parent == ch) then return end
	o.Parent = ch
	workspace.CurrentCamera.CameraSubject = o
	ct(o)
	pcall(function() c:Destroy() end)
	ra(ch)
end

local function sw()
	local ch = lp.Character
	local hu = ch and ch:FindFirstChildOfClass("Humanoid")
	if st.sc and hu == st.sc and st.sc.Parent == ch then
		local dh = st.dc and st.dc.Parent and st.dc:FindFirstChildOfClass("Humanoid")
		if not dh and not st.nd and not st.pv then dh = dm(ch) end
		if dh then cs(ch, dh) end
		return true
	end
	if st.sc then un() end
	if not hu or hu.Health <= 0 or hu.FloorMaterial == Enum.Material.Air or not gd[hu:GetState()] then return false end
	local c = hu:Clone()
	hu.Parent = nil
	c.Parent = ch
	local dh = not st.nd and not st.pv and dm(ch)
	if dh then cs(ch, dh) else workspace.CurrentCamera.CameraSubject = c end
	ct(c)
	ra(ch)
	st.so, st.sc, st.at = hu, c, nil
	local a, b = hu:FindFirstChildOfClass("Animator"), c:FindFirstChildOfClass("Animator")
	if a and b then
		st.sl[#st.sl + 1] = a.AnimationPlayed:Connect(function(k)
			if not k.Animation or c.Parent == nil then return end
			local ok, t = pcall(function() return b:LoadAnimation(k.Animation) end)
			if not ok or not t then return end
			pcall(function()
				t.Priority, t.Looped = k.Priority, k.Looped
				t:Play(0.05, math.max(k.WeightTarget, 0.01), k.Speed)
			end)
			local s
			s = k.Stopped:Connect(function()
				s:Disconnect()
				pcall(function() t:Stop(0.1) end)
			end)
		end)
	end
	st.sl[#st.sl + 1] = c.Died:Connect(function()
		ul()
		dk()
		st.so, st.sc = nil, nil
		local cc = lp.Character
		if cc and hu.Parent == nil then
			hu.Parent = cc
			workspace.CurrentCamera.CameraSubject = hu
			ct(hu)
		end
		pcall(function() c:Destroy() end)
		hu.Health = 0
	end)
	return true
end

local function ac()
	if typeof(filtergc) ~= "function" then return "Monitor Check Failed: No Filtergc" end
	if not st.at or rawget(st.at, "InitializingUntil") == nil then
		local ok, r = pcall(filtergc, "table", {Keys = {"InitializingUntil"}}, false)
		st.at = ok and type(r) == "table" and r[1] or nil
		st.h0 = st.at and tonumber(rawget(st.at, "HistoryCount")) or nil
	end
	local t = st.at
	if not t then return "Monitor Check Failed: Monitor Not Found" end
	local h, c = tonumber(rawget(t, "HistoryCount")) or 0, rawget(t, "CorrectionReason")
	if c ~= nil then return "Monitor Active: Correction " .. tostring(c) end
	if h > (st.h0 or 0) + 2 then return "Monitor Active: Sampling" end
	return nil
end

local function mv(tg, ck, to, cp)
	local c = lp.Character
	if not rt() then return false, "Move Failed: No Character" end
	local t0, dn, wy = os.clock(), nil, nil
	local kp, kt = rt().Position, os.clock()
	local cn = ru.PreSimulation:Connect(function(d)
		if dn ~= nil then return end
		local hr, hm = rt()
		if ge.__BkSae ~= st or not (st.on or st.bo) then dn, wy = false, "Stopped" return end
		if not hr or not hm or hm.Health <= 0 or lp.Character ~= c then dn, wy = false, "Move Failed: Character Lost" return end
		fz(hm.FloorMaterial == Enum.Material.Air)
		local r = ck and ck()
		if r then dn, wy = false, r return end
		if os.clock() - t0 > to then dn, wy = false, "Move Failed: Timeout" return end
		local v = tg - hr.Position
		local m = v.Magnitude
		if m <= 1 then
			hr.AssemblyLinearVelocity = Vector3.zero
			dn = true
			return
		end
		if os.clock() - kt >= 1 then
			if (hr.Position - kp).Magnitude < 2 then dn, wy = false, "Move Failed: Blocked" return end
			kp, kt = hr.Position, os.clock()
		end
		hr.AssemblyLinearVelocity = v.Unit * math.min(hm.WalkSpeed * (cp or 1), m / math.max(d, 1 / 240)) + Vector3.new(0, workspace.Gravity * d * 0.5, 0)
		hr.AssemblyAngularVelocity = Vector3.zero
	end)
	st.cn[#st.cn + 1] = cn
	while dn == nil do ru.Heartbeat:Wait() end
	cn:Disconnect()
	return dn, wy
end

local function hp(en, y, rq, ck)
	while true do
		if ge.__BkSae ~= st or not (st.on or st.bo) then return false, "Stopped" end
		local r = ck and ck()
		if r then return false, r end
		local hr = rt()
		if not hr then return false, "Home Failed: Character Lost" end
		if rq and not cr() then return false, "Home Failed: Egg Lost" end
		fz(true)
		local d = Vector3.new(en.X - hr.Position.X, 0, en.Z - hr.Position.Z)
		if d.Magnitude <= 264 then
			hr.CFrame = CFrame.new(en) * hr.CFrame.Rotation
			hr.AssemblyLinearVelocity = Vector3.zero
			return true
		end
		hr.CFrame = CFrame.new(hr.Position.X + d.Unit.X * 264, y, hr.Position.Z + d.Unit.Z * 264) * hr.CFrame.Rotation
		hr.AssemblyLinearVelocity = Vector3.zero
		task.wait(0.1)
	end
end


local function go(e)
	local z0, z1 = cz()
	if not z0 then return false, "Fly Failed: No Corridor" end
	local h = rt()
	if not h then return false, "Fly Failed: No Character" end
	local hz = math.clamp(h.Position.Z, z0, z1)
	if hz ~= h.Position.Z then
		local ok, wy = mv(Vector3.new(h.Position.X, h.Position.Y, hz), nil, 10)
		if not ok then return false, wy end
		h = rt()
		if not h then return false, "Fly Failed: No Character" end
	end
	local a, b = Vector3.new(h.Position.X, 0, h.Position.Z), Vector3.new(e.p.X, 0, math.clamp(e.p.Z, z0, z1))
	local y, dh = math.max(h.Position.Y, e.p.Y) + 50, (b - a).Magnitude
	local u, nt = dh > 0.1 and (b - a).Unit or Vector3.zero, 0
	local function ck()
		if os.clock() < nt then return nil end
		nt = os.clock() + 0.25
		if not av(e.u) then return "Fly Failed: Egg Gone" end
		local dd = dl()
		if not dd or dd < 2 then return "Fly Failed: Night Coming" end
		return nil
	end
	local w = dh > 200 and {a + u * 100, b - u * 100} or {a + u * dh * 0.5}
	for _, p in w do
		local hr, hu = rt()
		local q = Vector3.new(p.X, y, p.Z)
		local ok, wy = mv(q, ck, hr and hu and (q - hr.Position).Magnitude / math.max(hu.WalkSpeed * st.fm, 16) + 10 or 30, st.fm)
		if not ok then return false, wy end
	end
	return mv(e.p + Vector3.new(0, 3, 0), ck, 10, st.fm)
end

local function kd()
	local ok, r = pcall(rg.IsRagdolled, lp.Character)
	if ok and r == true then return true end
	local n = tonumber(lp:GetAttribute("RagdollEndTime"))
	return n ~= nil and n > workspace:GetServerTimeNow()
end

local function tk(e)
	local k = si.LooksLikeFirstAreaUid(e.u) and si.SlotKey(e.r.AreaId, e.r.NestId) or nil
	local t0 = os.clock()
	while kd() and os.clock() - t0 < 5 do task.wait(0.1) end
	local t1 = os.clock()
	local ok, a, b = pcall(es.CarryFieldEgg, e.u, k)
	while ok and not a and ((tostring(b):find("knocked down", 1, true) and os.clock() - t0 < 6) or (tostring(b):find("Get closer", 1, true) and os.clock() - t1 < 1.5)) do
		task.wait(0.25)
		ok, a, b = pcall(es.CarryFieldEgg, e.u, k)
	end
	if ok and not a and tostring(b):find("gameplay area", 1, true) then
		local l = sp()
		local o2, r = pcall(es.ReadFieldEgg, e.u)
		local p = o2 and type(r) == "table" and typeof(r.BoundsCFrame) == "CFrame" and r.BoundsCFrame.Position
		if l and p then
			local lv = l.CFrame.LookVector
			lg(string.format("Retake Inside | Egg %d", math.floor(lv:Dot(p - l.Position))))
			if mv(p - lv * (lv:Dot(p - l.Position) - 4) + Vector3.new(0, 3, 0), nil, 5) then ok, a, b = pcall(es.CarryFieldEgg, e.u, k) end
		end
	end
	if not ok then return false, "Take Failed: " .. tostring(a) end
	if not a then return false, "Take Failed: " .. tostring(b or "Denied") end
	local t = os.clock()
	repeat task.wait(0.05) until cr() or os.clock() - t > 1
	if not cr() then return false, "Take Failed: Not Carrying" end
	st.pu = e.u
	return true
end

local function rp()
	local t0 = os.clock()
	task.wait(st.dw)
	local o1, cs = pcall(es.ReadCarryState)
	local u = o1 and type(cs) == "table" and cs.Uid
	if type(u) ~= "string" then return false, "Drop Failed: No Carry Uid" end
	local o2, a, b = pcall(es.DropFieldEgg, "PlayerRequest")
	if not o2 or not a then return false, "Drop Failed: " .. tostring(o2 and (b or "Denied") or a) end
	local t1 = os.clock()
	repeat task.wait(0.03) until not cr() or os.clock() - t1 > 1
	if cr() then return false, "Drop Failed: Still Carrying" end
	local o3, r = pcall(es.ReadFieldEgg, u)
	local ok, wy = tk({u = u, r = o3 and type(r) == "table" and r or {}})
	if not ok then return false, "Repick " .. tostring(wy) end
	lg(string.format("Relay %dms (Drop %dms, Take %dms)", (os.clock() - t0) * 1000, (t1 - t0 - st.dw) * 1000, (os.clock() - t1) * 1000))
	return true
end

local function ze()
	local w = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
	local a = w and w:FindFirstChild("Areas")
	local g = a and a:FindFirstChild("GuardAreas")
	local o = {}
	if not g then return o end
	for _, z in g:GetChildren() do
		local b = z:FindFirstChild("Bounds")
		if b and b:IsA("BasePart") then o[#o + 1] = b.Position.X - b.Size.X / 2 end
	end
	table.sort(o, function(x1, x2) return x1 > x2 end)
	return o
end

local function dg()
	local l, h = sp(), rt()
	if not (l and h) then return "No Character" end
	local nd = math.huge
	for _, p in ps:GetPlayers() do
		local r = p ~= lp and p.Character and p.Character:FindFirstChild("HumanoidRootPart")
		if r then nd = math.min(nd, (r.Position - h.Position).Magnitude) end
	end
	return string.format("Me %d Z %d Ragdoll %s Trapped %s Player %s", math.floor(l.CFrame.LookVector:Dot(h.Position - l.Position)), math.floor(h.Position.Z), tostring(kd()), tostring(lp.Character and lp.Character:GetAttribute("IsTrapped") == true), nd == math.huge and "None" or tostring(math.floor(nd)))
end

local function sz(z, lq, lv)
	local tf, hb = workspace:FindFirstChild("Transient"), {}
	for _, d in tf and tf:GetDescendants() or {} do
		if d.Name == "PlayerTrap" then
			local x = d:FindFirstChild("Hitbox") or d
			if x:IsA("BasePart") and d:GetAttribute("Owner") ~= lp.Name then
				local s = lv:Dot(x.Position - lq)
				if s > -40 and s < 70 then hb[#hb + 1] = {x.Position.Z, math.max(x.Size.X, x.Size.Z) / 2 + 6} end
			end
		end
	end
	if #hb == 0 then return z end
	local z0, z1 = cz()
	z0, z1 = z0 or z - 60, z1 or z + 60
	for k = 0, 60 do
		for _, c in {z + k * 3, z - k * 3} do
			if c >= z0 and c <= z1 then
				local ok = true
				for _, t in hb do
					if math.abs(c - t[1]) < t[2] then
						ok = false
						break
					end
				end
				if ok then
					if c ~= z then lg(string.format("Trap Lane %d -> %d", math.floor(z), math.floor(c))) end
					return c
				end
			end
		end
	end
	return z
end

local function hm(rq)
	local l, h = sp(), rt()
	if not l then return false, "Home Failed: No Separation Line" end
	if not h then return false, "Home Failed: No Character" end
	local lv, lq = l.CFrame.LookVector, l.Position
	local q = h.Position - lv * (lv:Dot(h.Position - lq) - 48)
	local en, y = Vector3.new(q.X, lq.Y + 3, sz(q.Z, lq, lv)), lq.Y + 45
	if rq then
		local k = 0
		for _, x in ze() do
			if x < h.Position.X then
				k += 1
				if k % st.rz == 0 and x + 10 > en.X + 150 then
					lg("Relay At " .. math.floor(x + 10))
					local ok, wy = hp(Vector3.new(x + 10, en.Y, q.Z), y, true)
					if not ok then return false, wy end
					ok, wy = rp()
					if not ok then return false, wy end
				end
			end
		end
	end
	local ok, wy = hp(en, y, rq)
	if not ok then return false, wy end
	if not rq then
		task.wait(0.1)
		return mv(en - lv * 70, nil, 5)
	end
	ok, wy = rp()
	if not ok then return false, wy end
	local o1, cs = pcall(es.ReadCarryState)
	local sm = o1 and type(cs) == "table" and tonumber(cs.SpeedMultiplier) or 0.9
	local cu = o1 and type(cs) == "table" and cs.Uid
	local n0, dw2 = st.n, nil
	ok, wy = mv(en - lv * 70, function()
		if not cr() then
			dw2 = dw2 or dg()
			return "Delivered"
		end
		return nil
	end, 5, sm)
	if wy ~= "Delivered" and not ok then return false, wy end
	local t = os.clock()
	repeat task.wait(0.05) until (not cr() and st.n > n0) or os.clock() - t > 3
	if st.n <= n0 then
		local o2, r = pcall(es.ReadFieldEgg, cu)
		local ep = o2 and type(r) == "table" and typeof(r.BoundsCFrame) == "CFrame" and r.BoundsCFrame.Position
		return false, string.format("Home Failed: Not Claimed | %s | Egg %s %s", dw2 or dg(), o2 and type(r) == "table" and tostring(r.State) or "Gone", ep and tostring(math.floor(lv:Dot(ep - lq))) or "?")
	end
	return true
end

local function ow()
	local ok, o = pcall(es.ReadOwnerEggs, lp.UserId)
	local u, p = {}, {}
	if not ok or type(o) ~= "table" then return u, p end
	local o5, v5 = pcall(sv.Await)
	local ix = o5 and type(v5) == "table" and type(v5.Index) == "table" and v5.Index or {}
	for k, v in pairs(o) do
		if type(v) == "table" then
			local c = type(v.Placement) == "table" and v.Placement.LocalCFrame
			if typeof(c) == "CFrame" then
				p[#p + 1] = Vector2.new(c.X, c.Z)
			elseif v.Placement == nil and type(k) == "string" then
				local a, w = dr[v.AssetCategory], nil
				if st.pi and not st.ap then
					w = ix[v.AssetCategory] ~= true
				else
					w = not (st.es and a and a.Rarity and st.se[a.Rarity._id]) or (st.pi and ix[v.AssetCategory] ~= true)
				end
				if w then
					u[#u + 1] = {u = k, k = tonumber(a and a.Rarity and a.Rarity.Rank) or 0, e = tonumber(a and a.EarningRate) or 0}
				end
			end
		end
	end
	table.sort(u, function(x, y)
		if x.k ~= y.k then return x.k > y.k end
		return x.e > y.e
	end)
	return u, p
end

local function pm()
	local f = workspace:FindFirstChild("Plots")
	for _, c in f and f:GetChildren() or {} do
		local s = c:FindFirstChild("PlotSign")
		s = s and s:FindFirstChild("PlayerPlotSign")
		s = s and s:FindFirstChild("Frame")
		s = s and s:FindFirstChild("PlayerName")
		if s and s:IsA("TextLabel") and (s.Text:lower() == lp.Name:lower() or s.Text:lower() == lp.DisplayName:lower()) then return c end
	end
	return nil
end

local function pn()
	local c = pm()
	local t = c and c:FindFirstChild("ToUpdate")
	local a = t and t:FindFirstChild("StarterPen") or c and c:FindFirstChild("CenterPoint")
	if not a then return nil end
	local ok, r = pcall(function() return a:IsA("Model") and a:GetPivot() or a.CFrame end)
	return ok and r.Position or nil
end

local function tb()
	local p = pm()
	local b = p and p:FindFirstChild("TreadmillBottom")
	return b and b:IsA("BasePart") and b or nil
end

local function tm()
	local b = tb()
	if not b then return nil end
	for _, m in cl:GetTagged("ActiveTreadmill") do
		local ok, q = pcall(function() return m:IsA("Model") and m:GetPivot().Position or m.Position end)
		if ok and (q - b.Position).Magnitude < 15 then return m end
	end
	return nil
end

local function lt()
	local ok, a, b = pcall(rm.Treadmill.AskDoff.InvokeServer, rm.Treadmill.AskDoff)
	if not ok then return false, "Doff Failed: " .. tostring(a) end
	if not a then return false, "Doff Failed: " .. tostring(b or "Denied") end
	return true
end

st.bt = tm() and true or nil
do
	local ok, c = pcall(function() return rm.Treadmill.AssignedBeltShifted.OnClientEvent:Connect(function(a) st.bt = a end) end)
	if ok and c then st.cn[#st.cn + 1] = c end
	ok, c = pcall(function()
		return game:GetService("LogService").MessageOut:Connect(function(m)
			local r = m:match("Static treadmill entry rejected: (.-)%s*$")
			if r then st.tr = r:gsub("%f[%a]%a", string.upper) end
		end)
	end)
	if ok and c then st.cn[#st.cn + 1] = c end
end

local function mt()
	if st.bt then return true end
	st.tr = nil
	local b = tb()
	if not b then return false, "Treadmill Failed: No Treadmill" end
	local h, hu = rt()
	if not h or not hu or hu.Health <= 0 then return false, "Treadmill Failed: No Character" end
	if (b.Position - h.Position).Magnitude > 200 then return false, "Treadmill Failed: Too Far" end
	for _ = 1, 2 do
		h = rt()
		if not h then return false, "Treadmill Failed: Character Lost" end
		local ok, wy = mv(Vector3.new(b.Position.X, h.Position.Y, b.Position.Z), nil, 10)
		if not ok then return false, tostring(wy) end
		local t1 = os.clock()
		repeat task.wait(0.2) until st.bt or os.clock() - t1 > 3
		if st.bt then return true end
	end
	if st.tr == "Not Grounded" then return false, "Treadmill Failed: Not Grounded | Respawn" end
	return false, "Treadmill Failed: " .. (st.tr or "Not Mounted")
end

local function pe()
	local u, p = ow()
	if #u == 0 then return 0, "Place Skipped: Bag Empty" end
	if st.pf and #p >= st.pf then return 0, "Place Skipped: Pen Full" end
	st.pf = nil
	local a, h = pn(), rt()
	if not a then return 0, "Place Failed: No Pen" end
	if not h then return 0, "Place Failed: No Character" end
	rv()
	if (h.Position - a).Magnitude > 20 then
		for _, q in {Vector3.new(h.Position.X, a.Y + 20, h.Position.Z), Vector3.new(a.X, a.Y + 20, a.Z), a + Vector3.new(0, 3, 0)} do
			local ok, wy = mv(q, nil, 15)
			if not ok then return 0, wy end
		end
	end
	local bd, n, wy = {}, 0, nil
	for _, e in u do
		if ge.__BkSae ~= st or not st.on then break end
		local o1, a1, b1 = pcall(es.WearEggTool, e.u)
		if not o1 or not a1 then
			wy = "Wear Failed: " .. tostring(o1 and (b1 or "Denied") or a1)
			continue
		end
		task.wait(0.15)
		local dn = false
		for x = -24, 8, 5 do
			for z = 4, 69, 5 do
				local v, fr = Vector2.new(x, z), true
				if bd[x .. "," .. z] then fr = false end
				for _, q in p do
					if fr and (q - v).Magnitude < 5 then fr = false end
				end
				if fr then
					local o2, a2, b2 = pcall(es.PlantEgg, e.u, CFrame.new(x, -0.5, z))
					if o2 and a2 then
						p[#p + 1], n, dn = v, n + 1, true
						break
					end
					wy = "Place Failed: " .. tostring(o2 and (b2 or "Denied") or a2)
					if tostring(b2):find("too many", 1, true) then
						st.pf = #p
						pcall(es.DoffEggTool, e.u)
						return n, wy
					end
					bd[x .. "," .. z] = true
				end
			end
			if dn then break end
		end
		if not dn then
			pcall(es.DoffEggTool, e.u)
			break
		end
	end
	return n, wy
end

local function rr(c)
	local a = dr[c]
	return a and a.Rarity and a.Rarity._id or ""
end

local function sc()
	local ok, s = pcall(sv.Await)
	if not ok or type(s) ~= "table" then return {}, {} end
	local p, e = {}, {}
	if st.ps and next(st.sp) then
		local q = {}
		for _, u in ipairs(s.EquippedAssets or {}) do q[u] = true end
		for k, v in pairs(s.Inventory or {}) do
			local o, i = pcall(ai.Decode, v)
			if o and type(i) == "table" and not i.IsFavorite and not i.InFuse and not q[k] and st.sp[rr(i.Category)] then p[#p + 1] = k end
		end
	end
	if st.es and next(st.se) then
		for k, v in pairs(s.EggInventory or {}) do
			if type(v) == "table" and v.Placement == nil then
				local o, r = pcall(er.Decode, v)
				if o and type(r) == "table" and st.se[rr(r.AssetCategory)] and not (st.pi and type(s.Index) == "table" and s.Index[r.AssetCategory] ~= true) then e[#e + 1] = k end
			end
		end
	end
	return p, e
end

local function sl(p, e)
	for _, z in {{p, false}, {e, true}} do
		local l, g = z[1], z[2]
		for i = 1, #l, 512 do
			local b = table.move(l, i, math.min(i + 511, #l), 1, {})
			pcall(function() rm.PetSatchel.SellSelection:FireServer({Assets = g and {} or b, Eggs = g and b or {}}) end)
		end
	end
end

local function wq()
	local l = cd()
	if #l == 0 then return "No Eggs" end
	local d, h, hu = dl(), rt()
	if d and h and hu and d < math.abs(l[1].p.X - h.Position.X) / math.max(hu.WalkSpeed, 16) + 9 then return "Waiting For Day" end
	return nil
end

local function lo(g)
	while not st.gr and ge.__BkSae == st do task.wait(0.1) end
	while ge.__BkSae == st and st.on and st.g == g do
		if st.sr then break end
		if (st.bx or st.rx or st.sx or st.lx or st.tx) and not cr() then
			if not st.fp then
				st.fp = true
				un()
				lg(st.rx and "Paused For Race" or st.sx and "Paused For Star" or st.lx and "Paused For Red Light" or st.tx and "Paused For T-Rex" or "Paused For Butterflies")
			end
			task.wait(1)
			continue
		end
		if st.fp then
			if st.bo then
				task.wait(0.5)
				continue
			end
			st.fp = false
			lg("Resuming Farm")
		end
		fz(false)
		if st.bt or tm() then
			local wy = not cr() and wq()
			if wy then
				lg(wy .. " | On Treadmill")
				task.wait(1)
				continue
			end
			lg("Leaving Treadmill")
			local ok, wy = lt()
			if not ok then lg(tostring(wy)) end
			task.wait(1)
			continue
		end
		if not sw() then
			lg("Waiting To Swap")
			task.wait(0.2)
			continue
		end
		local r = ac()
		if r then
			st.on, st.sr = false, false
			un()
			lg(r)
			warn("[Sae] Farm Stopped: " .. r)
			break
		end
		local h, hu = rt()
		if not h or not hu or hu.Health <= 0 then
			lg("Waiting For Character")
			task.wait(0.5)
			continue
		end
		if not cr() then
			local l = cd()
			if #l == 0 then
				rv()
				if fs() then
					lg("No Eggs | Going Home")
					hm(false)
					continue
				end
				if (st.pi or st.ap) and os.clock() >= st.pc then
					st.pc = os.clock() + 15
					lg("Placing Eggs")
					local n, wy = pe()
					lg(string.format("Placed %d%s", n, wy and (" | " .. wy) or ""))
				end
				if os.clock() >= st.mq then
					st.mq = os.clock() + 3
					lg("No Eggs | Mounting Treadmill")
					un()
					local ok, wy = mt()
					lg(ok and "Treadmill Mounted" or tostring(wy))
					continue
				end
				lg("No Eggs")
				task.wait(1)
				continue
			end
			local e = l[1]
			local d, de = dl()
			if not d then
				lg(tostring(de))
				task.wait(1)
				continue
			end
			if d < math.abs(e.p.X - h.Position.X) / math.max(hu.WalkSpeed, 16) + 9 then
				if fs() then
					lg("Night Coming, Going Home")
					hm(false)
				else
					if (st.pi or st.ap) and os.clock() >= st.pc then
						lg("Placing Eggs")
						local n, wy = pe()
						st.pc = os.clock() + 15
						lg(string.format("Placed %d%s", n, wy and (" | " .. wy) or ""))
					end
					if os.clock() >= st.mq then
						st.mq = os.clock() + 3
						lg("Waiting For Day | Mounting Treadmill")
						un()
						local ok, wy = mt()
						lg(ok and "Treadmill Mounted" or tostring(wy))
						continue
					end
					lg("Waiting For Day")
					task.wait(0.5)
				end
				continue
			end
			if st.pv then
				st.pv = false
				sw()
			end
			lg("Flying To " .. tostring(e.r.AssetCategory) .. " (" .. tostring(e.r.AreaId) .. ")")
			st.ct = os.clock()
			local ok, wy = go(e)
			if ok then
				lg("Taking " .. tostring(e.r.AssetCategory))
				ok, wy = tk(e)
			end
			if not ok then
				if tostring(wy):find("inventory full", 1, true) then
					lg(tostring(wy))
					task.wait(1)
					continue
				end
				if tostring(wy):find("Get closer", 1, true) then
					st.gc += 1
					lg(tostring(wy))
					if st.gc >= 2 then
						st.gc = 0
						lg("Waiting For Position Sync")
						task.wait(4)
					end
					continue
				end
				if wy == "Move Failed: Blocked" then
					st.bk[e.u] = (st.bk[e.u] or 0) + 1
					if st.bk[e.u] >= 3 then
						st.bl[e.u], st.bk[e.u] = os.clock() + 30, nil
					else
						task.wait(1)
					end
				elseif wy ~= "Stopped" and wy ~= "Move Failed: Character Lost" and wy ~= "Fly Failed: Night Coming" and not tostring(wy):find("knocked down", 1, true) then
					st.bl[e.u] = os.clock() + 30
				end
				lg(tostring(wy))
				task.wait(0.2)
				continue
			end
		end
		lg("Flying Home")
		local ok, wy = hm(true)
		if ok then
			st.pu, st.gc = nil, 0
			lg(string.format("Delivered %.1fs", st.ct and os.clock() - st.ct or 0))
			st.ct = nil
		else
			lg(tostring(wy))
			if tostring(wy):find("Get closer", 1, true) then
				st.gc += 1
				if st.gc >= 2 then
					st.gc = 0
					lg("Waiting For Position Sync")
					task.wait(4)
				end
			end
			task.wait(0.2)
		end
	end
	if not st.sr or ge.__BkSae ~= st or st.g ~= g then return end
	st.on, st.sr = false, false
	if st.fp then
		st.fp = false
		lg("Idle")
		return
	end
	if st.bt or tm() then
		lg("Leaving Treadmill")
		local ok, wy = lt()
		if not ok then lg(tostring(wy)) end
	end
	un()
	lg("Idle")
end

local ok, c = pcall(function()
	return es.FieldClaimed:Connect(function(a)
		st.n += 1
		print("[Sae] Claimed #" .. st.n .. " " .. tostring(type(a) == "table" and a.DisplayName or a))
	end)
end)
if ok and c then st.cn[#st.cn + 1] = c end

function st.Start()
	if not kv() then lg("Key Check Failed: No Valid Key") return end
	st.sr, st.pv = false, false
	if st.on then return end
	st.on, st.g, st.at = true, st.g + 1, nil
	task.spawn(lo, st.g)
end

function st.Stop(f)
	if st.on and not f then
		st.sr = true
		lg("Stopping After Trip")
		return
	end
	st.on, st.sr = false, false
	local _, hu = rt()
	local t = os.clock()
	while hu and hu.Parent and hu.FloorMaterial == Enum.Material.Air and os.clock() - t < 3 do task.wait(0.1) end
	un()
	lg("Idle")
end

local bb, bw, bq = (function()
	local ok, a, b, c = pcall(function()
		local e = rs.Controllers.Game.AdminAbuseClientController.Events.ButterflyBloom
		return require(e), require(e.Swarm), require(rs.Shared.Modules.ButterflyCatalog)
	end)
	if ok then return a, b, c end
	return nil, nil, nil
end)()

local function ba()
	if not bb then return false end
	local ok, a, e = pcall(function() return debug.getupvalue(bb.StartEvent, 1), debug.getupvalue(bb.StartEvent, 2) end)
	return ok and a == true and type(e) == "number" and e > workspace:GetServerTimeNow()
end

local bfl = (function()
	local ok, r = pcall(function() return require(rs.Shared.Flags.ButterflyFlags) end)
	return ok and type(r) == "table" and r or nil
end)()

local function bc()
	local t = workspace:GetServerTimeNow()
	local function tf(x)
		x = math.max(0, math.floor(x))
		return string.format("%02d:%02d", x // 60, x % 60)
	end
	if bb then
		local ok, a, e = pcall(function() return debug.getupvalue(bb.StartEvent, 1), debug.getupvalue(bb.StartEvent, 2) end)
		if ok and a == true and type(e) == "number" and e > t then return "Butterfly Bloom Active: " .. tf(e - t) .. " Left" end
	end
	local function fv2(k)
		local f = bfl and bfl[k]
		return type(f) == "table" and f.Value or nil
	end
	if fv2("Enabled") == false then return "Next Butterfly Bloom: Disabled" end
	local i, o = tonumber(fv2("IntervalSeconds")), tonumber(fv2("OffsetSeconds"))
	if not (i and o and i > 0) then return "Next Butterfly Bloom: Unknown" end
	return "Next Butterfly Bloom: " .. tf(o + math.ceil((t - o) / i) * i - t)
end

local function bn()
	local ok, s = pcall(sv.Await)
	local b = ok and type(s) == "table" and s.Butterflies
	if type(b) ~= "table" then return false, 0 end
	return b.NetClaimed == true, tonumber(b.TotalCaught) or 0
end

local function bv()
	for _, c in {lp.Character, lp:FindFirstChildOfClass("Backpack")} do
		for _, t in c and c:GetChildren() or {} do
			if t:IsA("Tool") and t:GetAttribute("ButterflyNet") == true then return t end
		end
	end
	return nil
end

local function bz()
	local w = workspace:FindFirstChild("World")
	local a = w and w:FindFirstChild("Areas")
	local b = a and a:FindFirstChild("ButterflyBloom")
	b = b and b:FindFirstChild("Bounds")
	return b and b:IsA("BasePart") and b or nil
end

local bs = (function()
	local ok, f = pcall(function()
		local n = require(rs.Controllers.Game.AdminAbuseClientController.Events.ButterflyBloom.Net)
		for i = 1, 40 do
			local o1, v = pcall(debug.getupvalue, n.Step, i)
			if not o1 then break end
			if type(v) == "function" and debug.info(v, "n") == "autoSwing" then
				for j = 1, 10 do
					local o2, x = pcall(debug.getupvalue, v, j)
					if not o2 then break end
					if type(x) == "number" then return function() pcall(debug.setupvalue, v, j, os.clock()) end end
				end
			end
		end
		return nil
	end)
	return ok and f or nil
end)()

local function bw2()
	local w = workspace:FindFirstChild("World")
	local a = w and w:FindFirstChild("Areas")
	local p = a and a:FindFirstChild("WallStartCollision")
	return p ~= nil and p:IsA("BasePart") and p.CanCollide
end

local function bd2()
	local o1, r = pcall(bq.EssenceRecipe)
	local o2, s = pcall(sv.Await)
	local c = o2 and type(s) == "table" and type(s.Butterflies) == "table" and s.Butterflies.Counts
	if not o1 or type(r) ~= "table" or type(c) ~= "table" then return nil, true end
	local n, an = {}, false
	for k, v in r do
		local d = (tonumber(v) or 0) - (tonumber(c[k]) or 0)
		if d > 0 then n[k], an = d, true end
	end
	return n, an
end

local function bh(p)
	if not (p and p:IsA("ProximityPrompt")) then return end
	p:InputHoldBegin()
	task.wait(p.HoldDuration + 0.15)
	p:InputHoldEnd()
end

local function bn2()
	local wd = workspace:FindFirstChild("World")
	local mk = wd and wd:FindFirstChild("Build")
	mk = mk and mk:FindFirstChild("EnchantedTreeInterior")
	mk = mk and mk:FindFirstChild("Markers")
	local en = mk and mk:FindFirstChild("EnterTrigger")
	en = en and en:FindFirstChild("EnchantedTreeEntrance")
	local ep, ex = en and en:FindFirstChildWhichIsA("ProximityPrompt"), mk and mk:FindFirstChild("ExitTrigger")
	local ns = wd and wd:FindFirstChild("Machines")
	ns = ns and ns:FindFirstChild("ButterflyStation")
	ns = ns and ns:FindFirstChild("NetStand")
	local an, np = ns and ns:FindFirstChild("Anchor"), ns and ns:FindFirstChildWhichIsA("ProximityPrompt", true)
	if not (en and en:IsA("Attachment") and ep and ex and an and np) then return nil end
	return {en = en, ep = ep, ex = ex, an = an, np = np}
end

local function fp(a, r)
	r = tostring(r)
	return r:find(":", 1, true) and r or (a .. ": " .. r)
end

local function bd(p, ck)
	local h, hu = rt()
	if not h or not hu then return false, "No Character" end
	local a = p.en.WorldPosition
	if (h.Position - a).Magnitude > 9 then
		if dl() == 0 or bw2() then return false, "Waiting For Day" end
		if st.bt or tm() then
			lt()
			task.wait(1)
		end
		st.pv = true
		if not sw() then st.pv = false return false, "Swap" end
		local o2, wy = true, nil
		local z0, z1 = cz()
		if z0 and (h.Position.Z < z0 or h.Position.Z > z1) then
			o2, wy = mv(Vector3.new(h.Position.X, h.Position.Y, math.clamp(h.Position.Z, z0, z1)), ck, 10)
			h, hu = rt()
			if o2 and not (h and hu) then o2, wy = false, "No Character" end
		end
		if o2 then
			local y = math.max(h.Position.Y, a.Y) + 50
			o2, wy = hp(Vector3.new(a.X, y, a.Z - 7), y, false, ck)
			if o2 then o2, wy = hp(Vector3.new(a.X, a.Y + 1, a.Z - 7), y, false, ck) end
		end
		fz(false)
		local _, h2 = rt()
		local t = os.clock()
		while h2 and h2.Parent and h2.FloorMaterial == Enum.Material.Air and os.clock() - t < 3 do task.wait(0.1) end
		t = os.clock()
		while o2 and os.clock() - t < 8 do
			local r = ck and ck()
			if r then o2, wy = false, r end
			task.wait(0.2)
		end
		un()
		st.pv = false
		if not o2 then return false, wy end
	end
	return true
end

local function bj(p, ck)
	local ok, s = pcall(sv.Await)
	local w = ok and type(s) == "table" and s.WispCompanion
	if type(w) ~= "table" or w.Unlocked ~= true then return false, "Wisp Locked" end
	if lp:GetAttribute("InEnchantedTree") == true then return true end
	local o2, wy = bd(p, ck)
	if not o2 then return false, wy end
	bh(p.ep)
	local t = os.clock()
	repeat task.wait(0.2) until lp:GetAttribute("InEnchantedTree") == true or os.clock() - t > 6
	if lp:GetAttribute("InEnchantedTree") ~= true then return false, "Not Entered" end
	task.wait(0.5)
	return true
end

local function be(p, ck)
	local h = rt()
	if h then mv(Vector3.new(p.ex.Position.X, h.Position.Y, p.ex.Position.Z), function() if lp:GetAttribute("InEnchantedTree") ~= true then return "Left" end return ck and ck() end, 10) end
	local t = os.clock()
	repeat task.wait(0.2) until lp:GetAttribute("InEnchantedTree") ~= true or os.clock() - t > 5
	fz(false)
	return lp:GetAttribute("InEnchantedTree") ~= true
end

local function bk()
	local p = bn2()
	if not p then return false, "Net Failed: No Tree" end
	local function ck() if st.on or not st.bf then return "Stopped" end return nil end
	st.bo = true
	local ok, r = bj(p, ck)
	if not ok then st.bo = false return false, fp("Net Failed", r) end
	local h = rt()
	if not h then st.bo = false return false, "Net Failed: No Character" end
	local o2, wy = mv(Vector3.new(p.an.Position.X - 5, h.Position.Y, p.an.Position.Z), ck, 10)
	if not o2 then st.bo = false return false, fp("Net Failed", wy) end
	task.wait(0.3)
	bh(p.np)
	local t = os.clock()
	repeat task.wait(0.2) until bn() or os.clock() - t > 5
	local got = bn()
	be(p, ck)
	st.bo = false
	return got, not got and "Net Failed: Not Claimed" or nil
end

local function bu()
	if st.on then return false, "Teleport Failed: Farm Running" end
	if st.bo then return false, "Teleport Failed: Busy" end
	local p = bn2()
	if not p then return false, "Teleport Failed: No Tree" end
	local function ck() if st.on then return "Stopped" end return nil end
	st.bo = true
	local ok, r = bj(p, ck)
	if not ok then st.bo = false return false, fp("Teleport Failed", r) end
	local h = rt()
	if not h then st.bo = false return false, "Teleport Failed: No Character" end
	local o2, wy = mv(Vector3.new(p.an.Position.X - 5, h.Position.Y, p.an.Position.Z), ck, 10)
	fz(false)
	st.bo = false
	if not o2 then return false, fp("Teleport Failed", wy) end
	return true
end

local wqd = (function()
	local ok, r = pcall(function() return require(rs.Data.WispQuests) end)
	return ok and type(r) == "table" and r or nil
end)()

local function ws()
	local o, s = pcall(sv.Await)
	local w = o and type(s) == "table" and s.WispCompanion
	return type(w) == "table" and w or nil
end

local function wu()
	local w = ws()
	return w ~= nil and w.Unlocked == true
end

local function fi(r, ...)
	local a = table.pack(pcall(r.InvokeServer, r, ...))
	if a[1] and a[2] then return true end
	return false, tostring(a[1] and (a[3] or "Denied") or a[2])
end

local function wr(a, b)
	return fi(rm.WispCompanion.Request, a, b)
end

local function wa(id)
	local ok, r = pcall(function() return require(rs.Data.Areas) end)
	local d = ok and type(r) == "table" and (r.Directory or r)[id]
	local o = {}
	for _, x in type(d) == "table" and d.DropTable or {} do
		if type(x) == "table" and type(x[1]) == "string" then o[x[1]] = true end
	end
	return o
end

local function wp(id)
	local o, s = pcall(sv.Await)
	if not o or type(s) ~= "table" then return nil end
	local c, q, g = wa(id), {}, {}
	for _, u in ipairs(s.EquippedAssets or {}) do q[u] = true end
	for k, v in pairs(s.Inventory or {}) do
		local o2, i = pcall(ai.Decode, v)
		if o2 and type(i) == "table" and c[i.Category] and not i.IsFavorite and not i.InFuse and not i.CreatorTemporary and not q[k] then
			g[i.Category] = g[i.Category] or {}
			table.insert(g[i.Category], k)
			if #g[i.Category] >= 3 then return g[i.Category] end
		end
	end
	return nil
end

local function wz(l)
	local m = workspace:FindFirstChild("World")
	m = m and m:FindFirstChild("Machines")
	m = m and m:FindFirstChild("FuseMachine")
	m = m and m:FindFirstChild("Machine")
	if not (m and m:IsA("BasePart")) then return false, "Fuse Failed: No Machine" end
	local h = rt()
	if not h then return false, "Fuse Failed: No Character" end
	if st.bt or tm() then
		lt()
		task.wait(1)
		h = rt()
		if not h then return false, "Fuse Failed: No Character" end
	end
	local d = Vector3.new(h.Position.X - m.Position.X, 0, h.Position.Z - m.Position.Z)
	if d.Magnitude > 6 then
		st.bo = true
		local ok, wy = mv(Vector3.new(m.Position.X, h.Position.Y, m.Position.Z) + d.Unit * 5, nil, 15)
		st.bo = false
		fz(false)
		if not ok then return false, fp("Fuse Failed", wy) end
	end
	local o, s = pcall(sv.Await)
	if not o or type(s) ~= "table" then return false, "Fuse Failed: No Save" end
	if s.FusionInfoAcknowledged == false then fi(rm.Fusery.ConfirmBriefing) end
	if s.FusionEggReward then fi(rm.Fusery.FinishReveal) end
	for _, u in table.clone(type(s.FusionSlots) == "table" and s.FusionSlots or {}) do fi(rm.Fusery.EjectPet, u) end
	for _, u in l do
		local ok, wy = fi(rm.Fusery.LoadPet, u, false)
		if not ok then return false, "Fuse Failed: " .. wy end
		task.wait(0.3)
	end
	local ok, wy = fi(rm.Fusery.BeginFuse)
	if not ok then return false, "Fuse Failed: " .. wy end
	task.wait(0.6)
	ok, wy = fi(rm.Fusery.FinishReveal)
	if not ok then return false, "Fuse Reveal Failed: " .. wy end
	return true
end

local function we()
	st.wf = nil
	if not st.wo then return end
	st.wo = false
	if st.on then st.Stop() end
end

local function wt()
	local p, z = bn2(), workspace:FindFirstChild("World")
	z = z and z:FindFirstChild("Build")
	z = z and z:FindFirstChild("EnchantedForestZone")
	local a = z and z:FindFirstChild("Zone13Props")
	a = a and a:FindFirstChild("EnchantedTree")
	a = a and a:FindFirstChild("WispAnchor")
	local pr = a and a:FindFirstChild("WispTreePrompt")
	if not (p and pr) then return "Wisp Return Failed: No Tree" end
	local function ck() if st.on or not st.bf then return "Stopped" end return nil end
	st.bo = true
	local ok, wy = bd(p, ck)
	if ok then
		bh(pr)
		local t = os.clock()
		repeat task.wait(0.2) until wu() or os.clock() - t > 8
		ok, wy = wu(), "Not Unlocked"
	end
	st.bo = false
	return ok and "Wisp Unlocked" or fp("Wisp Return Failed", wy)
end

local function wd()
	local w = ws()
	if not w or not wqd then return "Wisp Failed: No State" end
	if not w.Accepted then
		local ok, m = wr("Accept")
		return ok and "Wisp Accepted" or "Wisp Accept Failed: " .. tostring(m)
	end
	local q = wqd.List[w.Stage]
	if q and not w.Claimed[q.Id] and (w.Progress[q.Id] or 0) >= q.Target then
		local ok, m = wr("Claim", q.Id)
		return ok and "Wisp Claimed | " .. q.Title or "Wisp Claim Failed: " .. tostring(m)
	end
	if q and q.Event == "EggSecured" then
		st.wf = q.Match.AreaId and {a = q.Match.AreaId} or {r = q.Match.Rarity}
		if not st.on then
			st.wo = true
			st.Start()
		end
		return string.format("Wisp Quest | %s %d/%d", q.Title, w.Progress[q.Id] or 0, q.Target)
	end
	if q and q.Event == "PetFused" then
		local l = wp(q.Match.AreaId)
		if not l then
			st.wf = {a = q.Match.AreaId}
			if not st.on then
				st.wo = true
				st.Start()
			end
			return "Wisp Quest | " .. q.Title .. " | Waiting For 3 Same Pets"
		end
		we()
		if st.on then return "Wisp | Waiting For Farm" end
		local ok, m = wz(l)
		return ok and "Wisp Fused" or tostring(m)
	end
	we()
	if st.on then return "Wisp | Waiting For Farm" end
	if q then return "Wisp Quest | " .. q.Title .. " | Not Automated" end
	if not w.Returning then
		local ok, m = wr("BeginReturn")
		return ok and "Wisp Returning" or "Wisp Return Failed: " .. tostring(m)
	end
	return wt()
end

local rcm = (function()
	local ok, r = pcall(function() return require(lp.PlayerScripts.PlayerModule):GetControls() end)
	return ok and type(r) == "table" and r or nil
end)()

local rpa = (function()
	local ok, r = pcall(function() return require(rs.Data.RacePowerUps).Attributes end)
	return ok and type(r) == "table" and r or nil
end)()

local function rk2()
	local id = lp:GetAttribute("RaceId")
	if type(id) ~= "string" then return nil end
	for _, t in cl:GetTagged("RaceTrack") do
		if t.Name == id then return t end
	end
	return nil
end

local function rp3(t)
	local a = t:FindFirstChild("AttachmentTrack")
	local o = {}
	for i = 1, a and #a:GetChildren() or 0 do
		local x = a:FindFirstChild(tostring(i))
		if not (x and x:IsA("Attachment")) then return nil end
		o[i] = x.WorldPosition
	end
	return #o >= 3 and o or nil
end

local function rm4(t)
	local p = rp3(t)
	if not p then return nil end
	local rp = RaycastParams.new()
	rp.FilterType = Enum.RaycastFilterType.Include
	rp.FilterDescendantsInstances = {t}
	local lb, jb = {}, {}
	for _, x in cl:GetTagged("RaceLoop") do
		if x:IsDescendantOf(t) and x:IsA("Model") then
			local cf, sz = x:GetBoundingBox()
			lb[#lb + 1] = {cf, sz}
		end
	end
	for _, x in cl:GetTagged("RaceJump") do
		local s, e = x:IsDescendantOf(t) and x:FindFirstChild("Start"), x:FindFirstChild("End")
		if s and e then jb[#jb + 1] = {s.Position, e.Position} end
	end
	local function fx(q, uy)
		for _, b in lb do
			local l = b[1]:PointToObjectSpace(q)
			if uy < 0.9 and math.abs(l.X) <= b[2].X / 2 + 5 and math.abs(l.Y) <= b[2].Y / 2 + 5 and math.abs(l.Z) <= b[2].Z / 2 + 5 then return true end
		end
		for _, j in jb do
			local ab, aq = Vector3.new(j[2].X - j[1].X, 0, j[2].Z - j[1].Z), Vector3.new(q.X - j[1].X, 0, q.Z - j[1].Z)
			local u = aq:Dot(ab) / ab:Dot(ab)
			if (aq - ab * math.clamp(u, 0, 1)).Magnitude < (u > 1 and 10 or 45) then return true end
		end
		return false
	end
	local function wa(o, d, nm)
		local s = 0
		for _ = 1, 4 do
			local h = workspace:Raycast(o, d * 150, rp)
			if not h then return nil end
			s += (h.Position - o).Magnitude
			if math.abs(h.Normal:Dot(nm)) < 0.6 then return s end
			o = h.Position + d * 0.5
			s += 0.5
		end
		return nil
	end
	local c, r, hw, n, u0, ac = {}, {}, {}, #p, {}, t:FindFirstChild("AttachmentTrack")
	for i = 1, n do
		local x = ac and ac:FindFirstChild(tostring(i))
		u0[i] = x and x:IsA("Attachment") and x.WorldCFrame.UpVector or Vector3.yAxis
	end
	for i = 1, n do
		local a, b = p[i], p[i % n + 1]
		local m = math.max(1, math.floor((b - a).Magnitude / 8))
		local th = Vector3.new(b.X - a.X, 0, b.Z - a.Z)
		th = th.Magnitude > 0.01 and th.Unit or Vector3.new(0, 0, 1)
		for s = 0, m - 1 do
			local q = a:Lerp(b, s / m)
			local fh = workspace:Raycast(q + Vector3.new(0, 25, 0), Vector3.new(0, -70, 0), rp)
			local fp3, nm = q, Vector3.new(0, 1, 0)
			if fh and fh.Normal.Y > 0.5 then fp3, nm = fh.Position, fh.Normal end
			local rv = th:Cross(nm)
			rv = Vector3.new(rv.X, 0, rv.Z)
			rv = rv.Magnitude > 0.01 and rv.Unit or Vector3.new(1, 0, 0)
			local wr, wl = wa(fp3 + nm * 3, rv, nm), wa(fp3 + nm * 3, -rv, nm)
			local j = #c + 1
			r[j] = rv
			if wr and wl and not fx(q, u0[i]:Lerp(u0[i % n + 1], s / m).Y) then
				c[j], hw[j] = fp3 + rv * ((wr - wl) / 2), (wr + wl) / 2
			else
				c[j] = q
			end
		end
	end
	return #c >= 3 and {c = c, r = r, h = hw} or nil
end

local function rn(p, pos, k, w)
	local n, bi, bd = #p, k, math.huge
	for j = 0, w do
		local i = (k + j - 1) % n + 1
		local d = (p[i] - pos).Magnitude
		if d < bd then bi, bd = i, d end
	end
	return bi, bd
end

local function rv3(p, k, hr, hl, al, m)
	local n, pos, sp = #p, hr.Position, hr.AssemblyLinearVelocity.Magnitude
	local function at(la)
		local i, acc = k, 0
		while true do
			local j = i % n + 1
			local sl = (p[j] - p[i]).Magnitude
			if acc + sl >= la and sl > 0 then return p[i]:Lerp(p[j], (la - acc) / sl) end
			acc += sl
			i = j
			if i == k then return p[i] end
		end
	end
	local up, lv, rv = hr.CFrame.UpVector, hr.CFrame.LookVector, hr.CFrame.RightVector
	local function fl(v)
		v -= up * v:Dot(up)
		return v.Magnitude > 0.1 and v.Unit or nil
	end
	local a = at(20 + sp * 0.2)
	local fw = fl(lv) or lv
	local bz
	for _, z in hl or {} do
		local rl2 = z[1] - pos
		rl2 -= up * rl2:Dot(up)
		local al = rl2:Dot(fw)
		if al > -2 and al < 40 + sp * 1.2 then
			local lt2, cl = rl2:Dot(rv), z[2] + 4
			if math.abs(lt2) < cl and (not bz or al < bz[1]) then bz = {al, z[1], cl} end
		end
	end
	local function cp(q)
		if not m then return q end
		local ka = rn(p, q, k, 70)
		local h4, r4 = m.h[ka], m.r[ka]
		if not (h4 and r4) then return q end
		local lm = math.max(h4 - 10, 0)
		return p[ka] + r4 * math.clamp((q - p[ka]):Dot(r4), -lm, lm)
	end
	if bz then
		local s1, s2 = cp(bz[2] + rv * (bz[3] + 1)), cp(bz[2] - rv * (bz[3] + 1))
		local g1, g2 = (s1 - bz[2]).Magnitude, (s2 - bz[2]).Magnitude
		if math.abs(g1 - g2) > 2 then a = g1 > g2 and s1 or s2 else a = (s1 - a).Magnitude <= (s2 - a).Magnitude and s1 or s2 end
	else
		local bt3
		for _, z in al or {} do
			local rl3 = z[1] - pos
			local hy = rl3:Dot(up)
			rl3 -= up * hy
			local ag = rl3:Dot(fw)
			if ag > 8 and ag < 40 + sp * 0.8 and math.abs(hy) < 20 and math.abs(rl3:Dot(rv)) < z[2] and (not bt3 or ag < bt3[1]) then bt3 = {ag, z[1]} end
		end
		if bt3 then a = cp(bt3[2]) end
	end
	local d = fl(a - pos)
	if not d then return Vector3.new(0, 0, -1) end
	local x = d:Dot(rv)
	if d:Dot(lv) < 0 then x = x >= 0 and 1 or -1 end
	local f, z = fl(at(50 + sp * 0.5) - pos), -1
	local c = f and f:Dot(lv) or 1
	if c < 0.5 and sp > 60 then z = 0.6 elseif c < 0.8 and sp > 85 then z = 0 end
	return Vector3.new(math.clamp(x * 2.5, -1, 1), 0, z), bz ~= nil and bz[1] > 4 and bz[1] < 45, d
end

local function rg2(on)
	if not rcm then return end
	if on then
		rcm.GetMoveVector = function() return st.rmv or Vector3.zero end
	else
		rcm.GetMoveVector = nil
	end
end

local function ru2(hr)
	if not rpa then return end
	local now = workspace:GetServerTimeNow()
	local it, re, ef, ee = lp:GetAttribute(rpa.Item), lp:GetAttribute(rpa.RollEndsAt), lp:GetAttribute(rpa.Effect), lp:GetAttribute(rpa.EffectEndsAt)
	if it ~= "Shield" then st.rsq = nil end
	if type(it) ~= "string" or (type(re) == "number" and now < re) or (type(ef) == "string" and type(ee) == "number" and now < ee) then return end
	st.rsq = st.rsq or os.clock()
	if it == "Shield" and os.clock() > st.rsh and os.clock() - st.rsq < 3 then return end
	local up, f = hr.CFrame.UpVector, hr.CFrame.LookVector
	f -= up * f:Dot(up)
	pcall(function() rm.MountRace.PowerUp:FireServer("Use", hr.Position, f.Magnitude > 0.01 and f.Unit or hr.CFrame.LookVector) end)
	lg("Race | Used " .. it)
end

local rrs, rre = (function()
	local ok, a, b = pcall(function()
		return require(rs.Shared.Util.RaceRallySchedule), require(rs.Shared.Util.RaceRallyEligibility)
	end)
	if ok then return a, b end
	return nil, nil
end)()

local function rj2()
	local je = workspace:GetAttribute("RaceRallyJoinEndsAt")
	if type(je) ~= "number" or je - workspace:GetServerTimeNow() < 1.5 then return false end
	local w = workspace:FindFirstChild("World")
	local pt = w and w:FindFirstChild("RaceRallyPortal")
	if not (pt and pt:FindFirstChild("Hitbox")) then return false end
	local ok, sv2 = pcall(sv.Await)
	local sp4 = ok and type(sv2) == "table" and sv2.SpeedPower
	local rw = workspace:GetAttribute("RaceRallyWindow")
	local lw = ok and type(sv2) == "table" and type(sv2.RaceRally) == "table" and sv2.RaceRally.LastRacedWindow
	if rw ~= nil and lw == rw then return false end
	if rre and type(rre.IsEligible) == "function" then
		local o2, e = pcall(rre.IsEligible, sp4)
		if o2 and e == false then return false end
	end
	return true
end

local function rj3()
	local w = workspace:FindFirstChild("World")
	local pt = w and w:FindFirstChild("RaceRallyPortal")
	local hb = pt and pt:FindFirstChild("Hitbox")
	local h = rt()
	if not (hb and hb:IsA("BasePart") and h) then return false end
	if st.bt or tm() then
		lt()
		task.wait(1)
		h = rt()
		if not h then return false end
	end
	local function ck()
		local je = workspace:GetAttribute("RaceRallyJoinEndsAt")
		if type(je) ~= "number" or je - workspace:GetServerTimeNow() < 0.5 then return "Move Failed: Join Closed" end
		return nil
	end
	local function fy(q, to)
		local ok, wy = mv(q, ck, to, st.fm)
		if not ok then lg("Race | " .. tostring(wy)) end
		return ok
	end
	local function ed()
		st.bo = false
		fz(false)
	end
	local z0, z1 = cz()
	local tg = hb.Position
	st.bo = true
	if z0 then
		local hz = math.clamp(h.Position.Z, z0, z1)
		if hz ~= h.Position.Z and not fy(Vector3.new(h.Position.X, h.Position.Y, hz), 10) then ed() return false end
	end
	h = rt()
	if not h then ed() return false end
	local ar2 = w:FindFirstChild("Areas")
	local wl = ar2 and ar2:FindFirstChild("WallStartCollision")
	if wl and wl:IsA("BasePart") and wl.CanCollide then
		local lk = wl.CFrame.LookVector
		if (h.Position - wl.Position):Dot(lk) * (tg - wl.Position):Dot(lk) < 0 then
			lg("Race | Waiting For Wall")
			repeat task.wait(0.2) until not wl.CanCollide or ck()
			local r = ck()
			if r then lg("Race | " .. r) ed() return false end
			h = rt()
			if not h then ed() return false end
		end
	end
	local a, b = Vector3.new(h.Position.X, 0, h.Position.Z), Vector3.new(tg.X, 0, tg.Z)
	local y, dh = math.max(h.Position.Y, tg.Y) + 50, (b - a).Magnitude
	local u = dh > 0.1 and (b - a).Unit or Vector3.zero
	for _, p in dh > 200 and {a + u * 100, b - u * 100} or {a + u * dh * 0.5} do
		local hr, hu = rt()
		local q = Vector3.new(p.X, y, p.Z)
		if not fy(q, hr and hu and (q - hr.Position).Magnitude / math.max(hu.WalkSpeed * st.fm, 16) + 10 or 30) then ed() return false end
	end
	fy(tg, 10)
	ed()
	h = rt()
	if not h then return false end
	pcall(function()
		firetouchinterest(h, hb, 0)
		task.wait(0.1)
		firetouchinterest(h, hb, 1)
	end)
	local t1 = os.clock()
	repeat task.wait(0.1) until type(lp:GetAttribute("RaceId")) == "string" or os.clock() - t1 > 5
	return type(lp:GetAttribute("RaceId")) == "string"
end

local function rs3()
	local now = workspace:GetServerTimeNow()
	local function tf(x)
		x = math.max(0, math.floor(x))
		return string.format("%02d:%02d", x // 60, x % 60)
	end
	if type(lp:GetAttribute("RaceId")) == "string" then
		local fp2 = lp:GetAttribute("RaceFinishPlace")
		if type(fp2) == "number" then return "Race Finished | Place " .. fp2 end
		return string.format("Racing | Lap %s | Place %s", tostring(lp:GetAttribute("RaceLap") or "-"), tostring(lp:GetAttribute("RacePlace") or "-"))
	end
	local je = workspace:GetAttribute("RaceRallyJoinEndsAt")
	if type(je) == "number" and je > now then return "Race Rally Open: " .. tf(je - now) .. " Left" end
	if workspace:GetAttribute("RaceRallyRunning") == true then return "Race Rally Running" end
	if rrs and type(rrs.IsScheduled) == "function" then
		local ok, on = pcall(rrs.IsScheduled)
		if ok and on then
			local o2, a = pcall(rrs.NextOpening, now)
			if o2 and type(a) == "number" then return "Next Race Rally: " .. tf(a - now) end
		end
	end
	return "Race Rally: Off"
end

local hs2 = game:GetService("HttpService")

local function rmc(hr)
	if typeof(filtergc) ~= "function" or not hr then return nil end
	local ok, l = pcall(filtergc, "table", {Keys = {"LastJumpAt", "IgnoreGroundUntil", "TravelDirection"}}, false)
	if not ok or type(l) ~= "table" then return nil end
	for _, t in l do
		local rg3 = type(t) == "table" and rawget(t, "Rig")
		if type(rg3) == "table" and rawget(rg3, "Root") == hr then
			local mt = getmetatable(t)
			local ix = type(mt) == "table" and rawget(mt, "__index")
			local jf = rawget(t, "Jump") or (type(mt) == "table" and rawget(mt, "Jump")) or (type(ix) == "table" and rawget(ix, "Jump"))
			if type(jf) == "function" then return t, jf end
		end
	end
	return nil
end

local function rl(g)
	local p, tr, k, nu, lm, mq, mt = nil, nil, nil, 0, nil, nil, nil
	local function bm(t)
		if mt == t then return end
		mt, mq = t, rm4(t)
		lg(mq and ("Race | Map Ready " .. #mq.c) or "Race | Map Failed")
	end
	local mc, mj, nj, sk = nil, nil, 0, {}
	local o5, ts5 = pcall(function() return require(rs.Shared.Flags.MountRaceFlags).TopSpeed:Get() * 2.9 end)
	ts5 = o5 and type(ts5) == "number" and ts5 or 391
	local pt, rd, ry, rc, rl, tp0, lk, lkt = nil, nil, nil, nil, 0, nil, nil, 0
	local function bp(t)
		local a = t:FindFirstChild("AttachmentTrack")
		if not a then return nil end
		local ok, m = pcall(function() return require(rs.Shared.Modules.RaceTrackPath).new(a) end)
		return ok and type(m) == "table" and type(m.Length) == "number" and m or nil
	end
	local hz, er, sr, dr2, sp3, tsp = {}, 5.5, 9, 9, {}, nil
	local hl2, lsp, lft, sdc, sdt = nil, {}, nil, {}, nil
	pcall(function()
		local d = hs2:JSONDecode(readfile("BaKhi/SaeRaceSpots.json"))
		if type(d) == "table" then lsp = d end
	end)
	local function lsv()
		pcall(function() writefile("BaKhi/SaeRaceSpots.json", hs2:JSONEncode(lsp)) end)
	end
	local function lad(q)
		local nm = tr and tr.Name or "?"
		lsp[nm] = lsp[nm] or {}
		for _, v in lsp[nm] do
			if (Vector3.new(v[1], v[2], v[3]) - q).Magnitude < 12 then return end
		end
		table.insert(lsp[nm], {math.floor(q.X), math.floor(q.Y), math.floor(q.Z)})
		lsv()
		sdt = nil
		lg(string.format("Race | Learned Egg Spot %d,%d,%d", q.X, q.Y, q.Z))
	end
	local function sdl()
		if sdt == pt then return sdc end
		sdt, sdc = pt, {}
		for _, v in pt and tr and lsp[tr.Name] or {} do
			local d, e = pt:Project(Vector3.new(v[1], v[2], v[3]), 0, 0, pt.Length)
			if e < 25 then sdc[#sdc + 1] = d % pt.Length end
		end
		return sdc
	end
	pcall(function()
		local tu = require(rs.Data.RacePowerUps).Tuning
		er, sr, dr2 = tonumber(tu.EggRadius) or 5.5, tonumber(tu.SpikeRadius) or 9, tonumber(tu.DrillaRadius) or 9
	end)
	local oc, cc = pcall(function()
		return rm.MountRace.PowerUpMoment.OnClientEvent:Connect(function(kd2, a, b, c, hq5, e)
			if kd2 == "Egg" and a ~= nil and typeof(c) == "CFrame" then
				hz[a] = c.Position
				local h = rt()
				if h and b ~= lp and (c.Position - h.Position).Magnitude < 45 then st.rsh, nu = os.clock() + 1.5, 0 end
			elseif (kd2 == "EggEnd" or kd2 == "Clear") and a ~= nil then
				hz[a] = nil
			elseif ((kd2 == "PodLock" or kd2 == "DrillaWarn") and b == lp) or (kd2 == "Drilla" and e == lp) then
				st.rsh, nu = os.clock() + 2, 0
			elseif kd2 == "Hit" and a == lp then
				local h = rt()
				local nh = {}
				if h and b == "Egg" then lad(typeof(hq5) == "Vector3" and hq5 or h.Position) end
				if h then
					for _, z in hl2() do
						local d = (z[1] - h.Position).Magnitude
						if d < 120 then nh[#nh + 1] = string.format("%.0f@%.0f", z[2], d) end
					end
				end
				lg(string.format("Race | Hit By %s at %s | Near %s", tostring(b), h and string.format("%d,%d,%d", h.Position.X, h.Position.Y, h.Position.Z) or "?", #nh > 0 and table.concat(nh, ",") or "None"))
			end
		end)
	end)
	if oc and cc then st.cn[#st.cn + 1] = cc end
	local bxs, bps, tsb = {}, {}, nil
	local function al2()
		if tsb ~= tr then
			tsb, bxs, bps = tr, {}, {}
			for _, x in cl:GetTagged("RacePowerUpSpawn") do
				local pd = tr and x:IsDescendantOf(tr) and x:FindFirstChild("Pad")
				if pd and pd:IsA("BasePart") then bxs[#bxs + 1] = {x, pd} end
			end
			for _, x in cl:GetTagged("RaceBoostPad") do
				local pd = tr and x:IsDescendantOf(tr) and x:FindFirstChild("Pad")
				if pd and pd:IsA("BasePart") then bps[#bps + 1] = pd end
			end
		end
		local o, now = {}, workspace:GetServerTimeNow()
		for _, pd in bps do o[#o + 1] = {pd.Position, 40} end
		local it = rpa and lp:GetAttribute(rpa.Item)
		if type(it) ~= "string" then
			for _, b in bxs do
				local ra4 = rpa and b[1]:GetAttribute(rpa.BoxReadyAt)
				if type(ra4) ~= "number" or ra4 <= now then o[#o + 1] = {b[2].Position, 20} end
			end
		end
		return o
	end
	hl2 = function()
		local o = {}
		for _, v in hz do o[#o + 1] = {v, er} end
		local fx = workspace:FindFirstChild("RacePowerUpFX")
		for _, x in fx and fx:GetChildren() or {} do
			local r2 = (x.Name == "Spike" and sr) or ((x.Name == "Warning" or x.Name == "Drilla") and dr2) or (x.Name == "Splat" and er) or nil
			if r2 and x:IsA("PVInstance") then
				local ok, pv = pcall(function() return x:GetPivot().Position end)
				if ok then o[#o + 1] = {pv, r2} end
			end
		end
		if tsp ~= tr then
			tsp, sp3 = tr, {}
			for _, x in cl:GetTagged("RaceSlowPad") do
				if tr and x:IsA("BasePart") and x:IsDescendantOf(tr) then sp3[#sp3 + 1] = {x.Position, math.max(x.Size.X, x.Size.Z) / 2} end
			end
		end
		for _, v in sp3 do o[#o + 1] = v end
		local cm = workspace.CurrentCamera
		for _, x in cm and cm:GetChildren() or {} do
			if x.Name == "KrakenMark" and x:IsA("BasePart") then o[#o + 1] = {x.Position, x.Size.Y / 2} end
		end
		return o
	end
	local function l2(m)
		if m == lm then return end
		lm = m
		lg(m)
	end
	while ge.__BkSae == st and st.ra and st.rg == g do
		local t, hr = rk2(), rt()
		st.rx = t ~= nil
		local fin = type(lp:GetAttribute("RaceFinishTime")) == "number"
		local hx = t and t:FindFirstChild("RaceHeats")
		local ht = hx and hx:FindFirstChild(tostring(lp:GetAttribute("RaceHeat"))) or t
		local ph, go = ht and ht:GetAttribute("RacePhase"), ht and ht:GetAttribute("RaceGoAt")
		if t and hr and not fin and ph == "Racing" and (type(go) ~= "number" or workspace:GetServerTimeNow() >= go) then
			if tr ~= t then
				bm(t)
				tr, k, rd, rc, rl, tp0 = t, nil, nil, nil, 0, nil
				p = mq and mq.c or rp3(t)
				pt = bp(t)
				lg(pt and string.format("Race | Rail Ready %d", pt.Length) or "Race | Rail Failed")
			end
			if pt then
				local nw = os.clock()
				local dt = rc and math.min(nw - rc, 0.2) or 0
				rc = nw
				local sp5, ss0 = ts5 / 2.9, mc and rawget(mc, "SpeedScales")
				if type(ss0) == "table" then
					ss0[sk] = nil
					local bu, bs = rawget(mc, "BoostUntil"), rawget(mc, "BoostScale")
					if type(bu) == "number" and os.clock() < bu and type(bs) == "number" then sp5 *= bs end
					for _, x in ss0 do
						if type(x) == "number" then sp5 *= x end
					end
				end
				local cf
				local se = lp:GetAttribute("RacePowerUpStunEndsAt")
				local sn = type(se) == "number" and workspace:GetServerTimeNow() < se
				if rd and not sn then
					rd += sp5 * dt
					cf = pt:FrameAt(rd)
					if tp0 and (hr.Position - tp0).Magnitude > 45 then rd, rl = pt:Project(hr.Position, rd, 60, 200), 0 cf = pt:FrameAt(rd) end
				end
				if not rd then
					rd, rl = pt:Project(hr.Position, 0, 0, pt.Length), 0
					cf = pt:FrameAt(rd)
					ry = (hr.Position - cf.Position):Dot(cf.UpVector)
					if ry < 2 or ry > 30 then ry = 6 end
				end
				if sn then
					rd, tp0 = pt:Project(hr.Position, rd, 60, 200), nil
					cf = pt:FrameAt(rd)
				end
				local lo, hi = 0, 0
				if mq and mt == t then
					k = rn(mq.c, cf.Position, k or 1, k and 12 or #mq.c - 1)
					local h5 = mq.h[k]
					if h5 then
						local of = (mq.c[k] - cf.Position):Dot(cf.RightVector)
						lo, hi = of - h5 + 12, of + h5 - 12
						if lo > hi then lo, hi = of, of end
					end
				end
				local zz, lt3, cd5, ba = hl2(), math.clamp(0, lo, hi), {0, 18, -18, 34, -34}, nil
				for _, z in al2() do
					local da = pt:Project(z[1], rd, 0, 260)
					local ah = da - rd
					if ah > 8 and ah < 40 + sp5 * 0.8 then
						local fa = pt:FrameAt(da)
						local rl5 = z[1] - fa.Position
						local la = rl5:Dot(fa.RightVector)
						if math.abs(la) < z[2] + 10 and math.abs(rl5:Dot(fa.UpVector)) < 20 and (not ba or ah < ba[1]) then ba = {ah, la} end
					end
				end
				if ba then table.insert(cd5, 1, ba[2]) end
				local function fk(c3)
					local c4 = math.clamp(c3, lo, hi)
					for la = 0, 110, 10 do
						local f3 = pt:FrameAt(rd + la)
						local q3 = f3.Position + f3.UpVector * ry + f3.RightVector * c4
						for _, z3 in zz do
							if (z3[1] - q3).Magnitude < z3[2] + 8 then return nil end
						end
					end
					return c4
				end
				local cq = fk(cd5[1])
				if not cq then lkt = os.clock() end
				local c5 = lk and os.clock() - lkt < 0.8 and fk(lk) or nil
				if c5 then
					lt3 = c5
				elseif cq then
					lt3 = cq
				else
					for i = 2, #cd5 do
						local c6 = fk(cd5[i])
						if c6 then lt3 = c6 break end
					end
				end
				lk = lt3
				rl += math.clamp(lt3 - rl, -80 * dt, 80 * dt)
				rl = math.clamp(rl, lo, hi)
				local tp = cf.Position + cf.UpVector * ry + cf.RightVector * rl
				st.rmv = sn and Vector3.zero or Vector3.new(0, 0, -1)
				if not sn then
					tp0 = tp
					hr.CFrame = CFrame.lookAt(tp, tp + cf.LookVector, cf.UpVector)
					hr.AssemblyLinearVelocity = cf.LookVector * sp5
					hr.AssemblyAngularVelocity = Vector3.zero
				end
				if not sn and mc and rawget(rawget(mc, "Rig") or {}, "Root") == hr then
					local ss, u5 = rawget(mc, "SpeedScales"), rawget(mc, "Up")
					if type(ss) == "table" then ss[sk] = nil end
					local h6 = typeof(u5) == "Vector3" and cf.LookVector - u5 * cf.LookVector:Dot(u5) or cf.LookVector
					if h6.Magnitude > 0.1 then
						rawset(mc, "Heading", h6.Unit)
						rawset(mc, "TravelDirection", h6.Unit)
					end
					rawset(mc, "Speed", sp5)
				end
				if not st.rv then
					st.rv = true
					rg2(true)
					l2("Racing")
				end
				if os.clock() >= nu then
					nu = os.clock() + 0.5
					local r5 = rd % pt.Length
					for _, d in sdl() do
						if (d - r5) % pt.Length < sp5 * 1.6 then
							if os.clock() > st.rsh and rpa and lp:GetAttribute(rpa.Item) == "Shield" then lg(string.format("Race | Shield Before Hit Spot %.0f", d)) end
							st.rsh = os.clock() + 0.6
							break
						end
					end
					ru2(hr)
					if not mc or rawget(rawget(mc, "Rig") or {}, "Root") ~= hr then mc, mj = rmc(hr) end
				end
			elseif p then
				local bd
				if k then k, bd = rn(p, hr.Position, k, 12) end
				if not k or bd > 80 then k = rn(p, hr.Position, 1, #p - 1) end
				local jp2, dv
				st.rmv, jp2, dv = rv3(p, k, hr, hl2(), al2(), mt == t and mq or nil)
				if jp2 and os.clock() >= nj then
					nj = os.clock() + 0.4
					if not mc or rawget(rawget(mc, "Rig") or {}, "Root") ~= hr then mc, mj = rmc(hr) end
					if mc and mj then
						local o4 = pcall(mj, mc)
						if o4 then lg("Race | Jumped Hazard") end
					end
				end
				if not st.rv then
					st.rv = true
					rg2(true)
					l2("Racing")
				end
				if os.clock() >= nu then
					nu = os.clock() + 0.5
					ru2(hr)
					if not mc or rawget(rawget(mc, "Rig") or {}, "Root") ~= hr then mc, mj = rmc(hr) end
				end
				local ss = mc and rawget(mc, "SpeedScales")
				if type(ss) == "table" then
					local bu, bs = rawget(mc, "BoostUntil"), rawget(mc, "BoostScale")
					ss[sk] = (type(bu) == "number" and os.clock() < bu and type(bs) == "number" and bs > 0) and 2.9 / bs or 2.9
				end
				local up = mc and dv and rawget(rawget(mc, "Rig") or {}, "Root") == hr and rawget(mc, "Grounded") == true and rawget(mc, "StickMinRatio") == nil and rawget(mc, "Up")
				if typeof(up) == "Vector3" then
					local h2 = dv - up * dv:Dot(up)
					if h2.Magnitude > 0.1 then
						h2 = h2.Unit
						rawset(mc, "Heading", h2)
						rawset(mc, "TravelDirection", h2)
						local sv = rawget(mc, "Speed")
						if type(sv) == "number" and sv < ts5 then rawset(mc, "Speed", ts5) end
						st.rmv = Vector3.new(0, 0, -1)
					end
				end
			else
				l2("Race Failed: No Track Path")
			end
		else
			if st.rv then
				st.rv, st.rmv = false, nil
				rg2(false)
			end
			if t and fin then
				l2("Race Finished | Place " .. tostring(lp:GetAttribute("RaceFinishPlace")))
				local ft = lp:GetAttribute("RaceFinishTime")
				if lft ~= ft then
					lft = ft
					task.wait(1.5)
					local ok3 = pcall(function() rm.MountRace.AskLeave:FireServer() end)
					l2(ok3 and "Race | Returning Home" or "Race | Leave Failed")
				end
			elseif t and ph == "Results" then
				l2("Race | Heat Ended | No Finish Recorded")
			elseif t then
				bm(t)
				l2("Race | " .. tostring(ph))
			elseif rj2() then
				st.rx = true
				if cr() or (st.on and not st.fp) or st.bo then
					l2("Race | Waiting To Join Rally")
				else
					l2("Race | Joining Rally")
					l2(rj3() and "Race | Joined Rally" or "Race | Join Failed")
				end
			else
				l2("Race | Waiting For Race")
			end
		end
		ru.Heartbeat:Wait()
	end
	if oc and cc then pcall(function() cc:Disconnect() end) end
	st.rx, st.rmv = false, nil
	if st.rv and ge.__BkSae == st then rg2(false) end
	st.rv = false
end

local function sb()
	local f = workspace:FindFirstChild("ShootingStarClient")
	local p = f and f:FindFirstChild("CatchPrompt", true)
	return p and p:IsA("ProximityPrompt") and p.Parent and p.Parent:IsA("BasePart") and p or nil
end

local function sk(p, ck)
	local h, hu = rt()
	if not h or not hu then return false, "No Character" end
	local z0, z1 = cz()
	if z0 and (h.Position.Z < z0 or h.Position.Z > z1) then
		local ok, wy = mv(Vector3.new(h.Position.X, h.Position.Y, math.clamp(h.Position.Z, z0, z1)), ck, 10)
		if not ok then return false, wy end
		h, hu = rt()
		if not h or not hu then return false, "No Character" end
	end
	local q = p.Parent.Position
	if (q - h.Position).Magnitude > 60 then
		local y = math.max(h.Position.Y, q.Y) + 50
		local ok, wy = mv(Vector3.new(h.Position.X, y, h.Position.Z), ck, 5, st.fm)
		if not ok then return false, wy end
		local a = Vector3.new(q.X, y, z0 and math.clamp(q.Z, z0, z1) or q.Z)
		ok, wy = mv(a, ck, (a - h.Position).Magnitude / math.max(hu.WalkSpeed * st.fm, 16) + 10, st.fm)
		if not ok then return false, wy end
	end
	local t = os.clock()
	while os.clock() - t < 25 do
		if not p.Parent then return false, "Star Gone" end
		local hr = rt()
		if not hr then return false, "No Character" end
		if (p.Parent.Position - hr.Position).Magnitude <= 6 then return true end
		local ok, wy = mv(p.Parent.Position + Vector3.new(0, 2, 0), function()
			local r = ck and ck()
			if r then return r end
			local h2 = rt()
			if not p.Parent then return "Star Gone" end
			if h2 and (p.Parent.Position - h2.Position).Magnitude <= 6 then return "Near" end
			return nil
		end, 2, st.fm)
		if not ok and wy ~= "Near" and wy ~= "Move Failed: Timeout" then return false, wy end
	end
	return false, "Chase Timeout"
end

local function sh(p)
	local hr = rt()
	local cn = ru.Heartbeat:Connect(function()
		local h = rt()
		local _, hu = rt()
		if not (h and hu and p.Parent) then return end
		local d = p.Parent.Position + Vector3.new(0, 2, 0) - h.Position
		h.AssemblyLinearVelocity = d.Magnitude > 2 and d.Unit * math.min(hu.WalkSpeed * st.fm, d.Magnitude * 10) or Vector3.zero
	end)
	st.cn[#st.cn + 1] = cn
	local t = os.clock()
	while p.Parent and not p.Enabled and os.clock() - t < 6 do task.wait(0.1) end
	if not p.Parent then cn:Disconnect() return false, "Star Gone" end
	if not p.Enabled then cn:Disconnect() return false, "Not Noticed" end
	local n0 = st.sc3
	pcall(function() p:InputHoldBegin() end)
	task.wait(p.HoldDuration + 0.25)
	pcall(function() p:InputHoldEnd() end)
	t = os.clock()
	repeat task.wait(0.1) until st.sc3 > n0 or os.clock() - t > 4
	cn:Disconnect()
	if hr and hr.Parent then hr.AssemblyLinearVelocity = Vector3.zero end
	return st.sc3 > n0, "Not Claimed"
end

local function sq2(g)
	local lm
	local function l2(m)
		if m == lm then return end
		lm = m
		lg(m)
	end
	local ok0, c0 = pcall(function() return rm.ShootingStar.Claimed.OnClientEvent:Connect(function() st.sc3 += 1 end) end)
	if ok0 and c0 then st.cn[#st.cn + 1] = c0 end
	local function ck() if not st.ss or st.sg ~= g or ge.__BkSae ~= st or st.rx then return "Stopped" end return nil end
	while ge.__BkSae == st and st.ss and st.sg == g do
		local p = sb()
		st.sx = p ~= nil and not st.rx
		if not st.sx then
			l2(p and "Star | Waiting For Race" or "Star | Waiting For Star")
			task.wait(1)
			continue
		end
		if cr() or (st.on and not st.fp) or (st.bo and not st.sb) then
			l2("Star | Waiting For Control")
			task.wait(0.5)
			continue
		end
		if dl() == 0 or bw2() then
			l2("Star | Waiting For Day")
			task.wait(0.5)
			continue
		end
		if st.bt or tm() then
			lt()
			task.wait(1)
		end
		st.bo, st.sb, st.pv = true, true, true
		if not sw() then
			st.bo, st.sb, st.pv = false, false, false
			l2("Star | Waiting To Swap")
			task.wait(0.5)
			continue
		end
		l2("Star | Flying To Star")
		local ok, wy = sk(p, ck)
		if ok then
			l2("Star | Catching")
			ok, wy = sh(p)
		end
		l2(ok and "Star Caught" or fp("Star Failed", wy))
		fz(false)
		if fs() then hm(false) end
		local _, h2 = rt()
		local t = os.clock()
		while h2 and h2.Parent and h2.FloorMaterial == Enum.Material.Air and os.clock() - t < 3 do task.wait(0.1) end
		un()
		st.bo, st.sb, st.pv = false, false, false
		task.wait(ok and 2 or 1)
	end
	st.sx = false
	if st.sb then
		un()
		st.bo, st.sb, st.pv = false, false, false
	end
end

local function gl()
	local v = workspace:GetAttribute("RLGL_Light")
	return type(v) == "string" and v or "Rise"
end

local function ge2()
	return workspace:GetAttribute("Event_RedLightGreenLight") == true and typeof(workspace:GetAttribute("RLGL_EggPosition")) == "Vector3"
end

local function gr2(ep)
	local p = workspace:GetAttribute(ep)
	if typeof(p) ~= "Vector3" then return nil end
	local ok, s = pcall(es.ReadFieldEggs)
	local b, bd = nil, 25
	for _, r in ok and type(s) == "table" and s.Records or {} do
		if typeof(r.BoundsCFrame) == "CFrame" then
			local d = (r.BoundsCFrame.Position - p).Magnitude
			if d < bd then b, bd = r, d end
		end
	end
	return b
end

local function gm(tg, sp, ck, to, gt, aj)
	local t0, dn, wy = os.clock(), nil, nil
	local cn = ru.PreSimulation:Connect(function(d)
		if dn ~= nil then return end
		local hr, hm = rt()
		if ge.__BkSae ~= st then dn, wy = false, "Stopped" return end
		if not hr or not hm or hm.Health <= 0 then dn, wy = false, "Character Lost" return end
		fz(hm.FloorMaterial == Enum.Material.Air)
		local r = ck and ck()
		if r then dn, wy = false, r return end
		if os.clock() - t0 > to then dn, wy = false, "Timeout" return end
		local g = Vector3.new(0, workspace.Gravity * d * 0.5, 0)
		hr.AssemblyAngularVelocity = Vector3.zero
		if gt and not gt() then
			hr.AssemblyLinearVelocity = g
			return
		end
		local a2 = aj and aj(hr.Position, tg)
		local v = (a2 or tg) - hr.Position
		local m = v.Magnitude
		if m <= 1 and not a2 then
			hr.AssemblyLinearVelocity = g
			dn = true
			return
		end
		hr.AssemblyLinearVelocity = v.Unit * math.min(sp(), m / math.max(d, 1 / 240)) + g
	end)
	st.cn[#st.cn + 1] = cn
	while dn == nil do ru.Heartbeat:Wait() end
	cn:Disconnect()
	return dn, wy
end

local function gb()
	local ok, g = pcall(function() return require(rs.Data.Gears).Directory end)
	for _, c in {lp.Character, lp:FindFirstChildOfClass("Backpack")} do
		for _, t in c and c:GetChildren() or {} do
			local n = t:IsA("Tool") and t.Name:gsub("%s*%b[]$", "")
			if n and ok and type(g) == "table" and type(g[n]) == "table" and g[n].BatControllerData then return t end
		end
	end
	return nil
end

local function gh(p, gt)
	local hr, hu = rt()
	local tr = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
	if not (hr and tr) then return false, "No Target" end
	if (tr.Position - hr.Position).Magnitude > 14 or (gt and not gt()) then return false, "Not Ready" end
	local t = gb()
	if not t then return false, "No Bat" end
	if t.Parent ~= lp.Character and hu then
		pcall(function() hu:EquipTool(t) end)
		task.wait(0.1)
	end
	pcall(function() t:Activate() end)
	return true
end

local function gq(g, c)
	local lm, nb = nil, 0
	local function l2(m)
		if m == lm then return end
		lm = m
		lg(m)
	end
	local function ck()
		if not c.on(g) or ge.__BkSae ~= st or st.rx or not c.ev() then return "Stopped" end
		return nil
	end
	local function gm2(a, sp2, ck3, to2)
		return gm(a, sp2, ck3, to2, c.gt, c.aj)
	end
	local function own(on)
		if on then
			st.bo, st[c.fb], st.pv = true, true, true
			return sw()
		end
		local _, hu = rt()
		if hu then pcall(function() hu:UnequipTools() end) end
		fz(false)
		local t = os.clock()
		while hu and hu.Parent and hu.FloorMaterial == Enum.Material.Air and os.clock() - t < 3 do task.wait(0.1) end
		un()
		st.bo, st[c.fb], st.pv = false, false, false
		return true
	end
	while ge.__BkSae == st and c.on(g) do
		st[c.fx] = c.ev() and not st.rx
		if st[c.fx] and c.pre then c.pre() end
		if not st[c.fx] then
			if st[c.fb] then own(false) end
			l2(c.n .. " | Waiting For Event")
			task.wait(1)
			continue
		end
		local lv0 = c.lv and lp:GetAttribute(c.lv)
		if type(lv0) == "number" and lv0 <= 0 then
			if st[c.fb] then own(false) end
			l2(c.n .. " | No Lives")
			task.wait(1)
			continue
		end
		local r = gr2(c.ep)
		local o1, cs0 = pcall(es.ReadCarryState)
		local mine = o1 and type(cs0) == "table" and cs0.IsCarrying == true and workspace:GetAttribute(c.cu) == lp.UserId
		if not st[c.fb] then
			if (cr() and not mine) or (st.on and not st.fp) or (st.bo and not st[c.fb]) then
				l2(c.n .. " | Waiting For Control")
				task.wait(0.5)
				continue
			end
			if st.bt or tm() then
				lt()
				task.wait(1)
			end
			if not own(true) then
				st.bo, st[c.fb], st.pv = false, false, false
				l2(c.n .. " | Waiting To Swap")
				task.wait(0.5)
				continue
			end
		end
		local _, hu = rt()
		local ws = hu and hu.WalkSpeed or 16
		if mine then
			local sm = tonumber(cs0.SpeedMultiplier) or 0.5
			local function vs() return ws * sm end
			local l, h = sp(), rt()
			if l and h then
				local lv, lq = l.CFrame.LookVector, l.Position
				local q = h.Position - lv * (lv:Dot(h.Position - lq) - 48)
				local z0, z1 = cz()
				local en = Vector3.new(q.X, lq.Y + 3, z0 and math.clamp(q.Z, z0, z1) or q.Z)
				local y = math.max(h.Position.Y, lq.Y + 45)
				local function ck2()
					local c = ck()
					if c then return c end
					if not cr() then return "Dropped" end
					return nil
				end
				l2(c.n .. " | Carrying Home")
				local ok, wy = gm2(Vector3.new(h.Position.X, y, h.Position.Z), vs, ck2, 30)
				if ok then ok, wy = gm2(Vector3.new(en.X, y, en.Z), vs, ck2, (en - h.Position).Magnitude / math.max(vs(), 8) * 3 + 30) end
				if ok then ok, wy = gm2(en, vs, ck2, 30) end
				if ok then ok, wy = gm2(en - lv * 70, vs, ck2, 40) end
				l2(ok and c.n .. " | Walked In" or c.n .. " | " .. tostring(wy))
				if not cr() then
					task.wait(2)
					if not c.ev() or not gr2(c.ep) then l2(c.n .. " Delivered") end
				end
			end
		elseif r then
			local cu = workspace:GetAttribute(c.cu)
			local cp = type(cu) == "number" and cu ~= lp.UserId and ps:GetPlayerByUserId(cu) or nil
			local function vs() return ws * st.fm end
			if cp then
				local tr = cp.Character and cp.Character:FindFirstChild("HumanoidRootPart")
				if tr then
					l2(c.n .. " | Chasing " .. cp.Name)
					gm2(tr.Position + Vector3.new(0, 2, 0), vs, function()
						local c = ck()
						if c then return c end
						local h = rt()
						if h and (tr.Position - h.Position).Magnitude <= 8 then return "Near" end
						return nil
					end, 3)
					if os.clock() >= nb and gh(cp, c.gt) then
						nb = os.clock() + 0.7
						l2(c.n .. " | Hit " .. cp.Name)
					end
				else
					task.wait(0.2)
				end
			else
				local p = r.BoundsCFrame.Position
				l2(c.n .. " | Flying To Egg")
				local h = rt()
				local ok = true
				if h and (p - h.Position).Magnitude > 60 then
					local y = math.max(h.Position.Y, p.Y) + 50
					ok = gm2(Vector3.new(h.Position.X, y, h.Position.Z), vs, ck, 20)
					if ok then ok = gm2(Vector3.new(p.X, y, p.Z), vs, ck, (p - h.Position).Magnitude / math.max(vs(), 16) * 3 + 30) end
				end
				if ok then ok = gm2(p + Vector3.new(0, 3, 0), vs, ck, 20) end
				if ok then
					while c.gt and not c.gt() and ck() == nil do task.wait(0.05) end
					l2(c.n .. " | Taking Egg")
					local o2, wy = tk({u = r.Uid, r = r})
					l2(o2 and c.n .. " | Egg Taken" or c.n .. " | " .. tostring(wy))
					local t2 = os.clock()
					while o2 and workspace:GetAttribute(c.cu) ~= lp.UserId and os.clock() - t2 < 1.5 do task.wait(0.05) end
				end
			end
		else
			l2(c.n .. " | No Egg")
			task.wait(0.5)
		end
		task.wait(0.05)
	end
	st[c.fx] = false
	if st[c.fb] then own(false) end
end

local lc = {n = "Red Light", fx = "lx", fb = "lb", ep = "RLGL_EggPosition", cu = "RLGL_CarrierUserId", lv = "RLGL_Lives", ev = ge2, gt = function() return gl() == "Green" end, on = function(g) return st.gx and st.gg == g end}

local trh = (function()
	local ok, r = pcall(function() return require(rs.Shared.Modules.TrexRunHerd) end)
	return ok and type(r) == "table" and r or nil
end)()

local tw = {}

local function tw2(l)
	table.clear(tw)
	for _, w in type(l) == "table" and l or {} do
		if type(w) == "table" and type(w.Id) == "number" then tw[w.Id] = w end
	end
end

pcall(function()
	st.cn[#st.cn + 1] = rm.TrexRun.Wave.OnClientEvent:Connect(function(w)
		if type(w) == "table" and type(w.Id) == "number" then tw[w.Id] = w end
	end)
	st.cn[#st.cn + 1] = rm.TrexRun.Herd.OnClientEvent:Connect(tw2)
end)

local function te2()
	return workspace:GetAttribute("Event_TrexRun") == true and typeof(workspace:GetAttribute("TrexRun_EggPosition")) == "Vector3"
end

local function ta2(pos)
	if not trh then return nil end
	local co = trh.ReadCourse(workspace)
	if not co then return nil end
	local now = workspace:GetServerTimeNow()
	local dp, lt = trh.Locate(co, pos)
	local bad, thr, hw = {}, false, co.LaneWidth * 0.5 + 4
	for id, w in tw do
		if trh.IsExpired(w, co, now) then
			tw[id] = nil
		elseif trh.IsMoving(w, now) and type(w.Lanes) == "table" then
			local ah = (dp - trh.DepthAt(w, now)) * w.Direction
			if ah > -10 and ah < (tonumber(w.Speed) or 150) * 1.2 + 30 then
				for k in w.Lanes do
					local la = trh.TrexLateral(co, w, k)
					bad[#bad + 1] = la
					if math.abs(la - lt) < hw then thr = true end
				end
			end
		end
	end
	if not thr then return nil end
	local best, bd
	for ln = 1, co.Lanes do
		local c0 = trh.LaneOffset(co, ln)
		local ok = true
		for _, la in bad do
			if math.abs(la - c0) < hw then
				ok = false
				break
			end
		end
		if ok and (not bd or math.abs(c0 - lt) < bd) then best, bd = c0, math.abs(c0 - lt) end
	end
	if not best then return nil end
	local q = trh.Point(co, dp, best)
	return Vector3.new(q.X, pos.Y, q.Z)
end

local nf = 0

local function tp2()
	if next(tw) ~= nil or os.clock() < nf then return end
	nf = os.clock() + 3
	local ok, l = pcall(function() return rm.TrexRun.FetchHerd:InvokeServer() end)
	if ok then tw2(l) end
end

local tc2 = {n = "T-Rex", fx = "tx", fb = "tb", ep = "TrexRun_EggPosition", cu = "TrexRun_CarrierUserId", lv = nil, ev = te2, gt = nil, aj = ta2, pre = tp2, on = function(g) return st.tq and st.th == g end}

local function bg(g)
	if not (bb and bw and bq) then lg("Butterfly Failed: No Module") return end
	if not kv() then lg("Key Check Failed: No Valid Key") return end
	local by, c0, nx, lw = false, 0, 0, nil
	local function ed()
		if not by then return end
		by = false
		if st.on and not st.fp then
			st.bo = false
			return
		end
		local _, hu = rt()
		local t = os.clock()
		while hu and hu.Parent and hu.FloorMaterial == Enum.Material.Air and os.clock() - t < 3 do task.wait(0.1) end
		if hu then pcall(function() hu:UnequipTools() end) end
		un()
		st.pv, st.bo = false, false
	end
	local function ck()
		if (st.on and not st.fp) or not st.bf or st.bi ~= g or not ba() then return "Stopped" end
		return nil
	end
	while ge.__BkSae == st and st.bf and st.bi == g do
		local nc, tc = bn()
		if st.rx or st.sx or st.lx or st.tx then
			st.bx = false
			ed()
			task.wait(1)
			continue
		end
		st.bx = nc and ba() and true or false
		if not nc and not wu() then
			ed()
			local m = wd()
			if m ~= lw then
				lw = m
				lg(m)
			end
			task.wait(1)
			continue
		end
		if st.wf or st.wo then we() end
		if st.on and not st.fp then
			by, st.bo = false, false
			task.wait(1)
			continue
		end
		if not nc then
			ed()
			lg("Claiming Net")
			local ok, wy = bk()
			lg(ok and "Net Claimed" or tostring(wy))
			task.wait(ok and 1 or 30)
			continue
		end
		if not ba() then
			ed()
			lg("Butterfly Waiting For Event")
			task.wait(1)
			continue
		end
		local nd, na = bd2()
		if not na then nd = nil end
		local b = bz()
		if not b then
			lg("Butterfly Failed: No Area")
			task.wait(5)
			continue
		end
		if not by then
			st.pv, st.bo = true, true
			if not sw() then
				st.bo = false
				lg("Butterfly Waiting To Swap")
				task.wait(0.5)
				continue
			end
			by, c0 = true, tc
		end
		local h, hu = rt()
		if not h or not hu or hu.Health <= 0 then
			task.wait(0.5)
			continue
		end
		local o = b.CFrame:PointToObjectSpace(h.Position)
		local fr = math.max(math.abs(o.X) - b.Size.X / 2, math.abs(o.Z) - b.Size.Z / 2)
		if fr > 20 then
			if lp:GetAttribute("InEnchantedTree") == true then
				local p2 = bn2()
				lg("Leaving Tree")
				if p2 then be(p2, ck) end
				task.wait(0.5)
				continue
			end
			local dn = dl()
			if dn == 0 or bw2() or (dn and dn < (b.Position - h.Position).Magnitude / math.max(hu.WalkSpeed, 16) + 5) then
				lg("Butterfly Waiting For Day")
				task.wait(0.5)
				continue
			end
			if fr < 150 then
				hu:MoveTo(Vector3.new(b.Position.X, h.Position.Y, b.Position.Z))
				task.wait(0.2)
				continue
			end
			if st.bt or tm() then
				lg("Leaving Treadmill")
				local o3, w3 = lt()
				if not o3 then lg(tostring(w3)) end
				task.wait(1)
				continue
			end
			lg("Flying To Butterflies")
			local z0, z1 = cz()
			if z0 and (h.Position.Z < z0 or h.Position.Z > z1) then
				local ok, wy = mv(Vector3.new(h.Position.X, h.Position.Y, math.clamp(h.Position.Z, z0, z1)), ck, 10)
				h, hu = rt()
				if not ok or not h or not hu then
					lg(tostring(wy or "Move Failed: Character Lost"))
					task.wait(0.5)
					continue
				end
			end
			local y = math.max(h.Position.Y, b.Position.Y) + 50
			local ok, wy = hp(Vector3.new(b.Position.X, y, b.Position.Z), y, false, ck)
			if ok then ok, wy = hp(b.Position + Vector3.new(0, 3, 0), y, false, ck) end
			fz(false)
			if not ok then
				lg(tostring(wy))
				task.wait(0.5)
			end
			continue
		end
		fz(false)
		local t = bv()
		if t and t.Parent ~= lp.Character then pcall(function() hu:EquipTool(t) end) end
		if bs then bs() end
		local p, pk, pd, s, sk, sd = nil, -1, math.huge, nil, -1, math.huge
		local x1, xk, xd, y1, yk, yd = nil, -1, math.huge, nil, -1, math.huge
		for _, e in bw.Each() do
			local eo = typeof(e.Position) == "Vector3" and b.CFrame:PointToObjectSpace(e.Position)
			if (e.Alpha or 0) >= 0.5 and eo and math.abs(eo.X) <= b.Size.X / 2 + 10 and math.abs(eo.Z) <= b.Size.Z / 2 + 10 and type(e.Flight) == "table" then
				local m, k = (e.Position - h.Position).Magnitude, tonumber(type(e.Tier) == "table" and e.Tier.Order) or 0
				if not nd or (type(e.Tier) == "table" and nd[e.Tier.Id] ~= nil) then
					if k > pk or (k == pk and m < pd) then p, pk, pd = e, k, m end
					if m <= 13 and (k > sk or (k == sk and m < sd)) then s, sk, sd = e, k, m end
				end
				if k > xk or (k == xk and m < xd) then x1, xk, xd = e, k, m end
				if m <= 13 and (k > yk or (k == yk and m < yd)) then y1, yk, yd = e, k, m end
			end
		end
		p, s = p or x1, s or y1
		if s and os.clock() >= nx then
			nx = os.clock() + 0.5
			local id = s.Flight.Id
			task.spawn(function()
				local ok, r = pcall(function() return rm.Butterflies.AskSwing:InvokeServer(id) end)
				if ok and (r == "Caught" or r == "Gone") then pcall(bw.Remove, id) end
			end)
		end
		if p then
			local q = p.Position
			pcall(function() q = bq.PositionAt(p.Flight, workspace:GetServerTimeNow() + 0.3) end)
			local v = Vector3.new(h.Position.X - q.X, 0, h.Position.Z - q.Z)
			q = v.Magnitude > 0.1 and q + v.Unit * 11 or q
			hu:MoveTo(Vector3.new(q.X, h.Position.Y, q.Z))
		else
			hu:MoveTo(Vector3.new(b.Position.X, h.Position.Y, b.Position.Z))
		end
		lg(string.format("%s | Caught %d", nd and "Catching For Essence" or "Catching Rarest", tc - c0))
		task.wait(0.1)
	end
	st.bx = false
	ed()
	we()
end

local function ht()
	local ok, o = pcall(es.ReadOwnerEggs, lp.UserId)
	if not ok or type(o) ~= "table" then return 0 end
	local n, t = 0, os.clock()
	for k, v in pairs(o) do
		if ge.__BkSae ~= st or not st.ah or n >= 5 then break end
		if type(k) == "string" and type(v) == "table" and v.Placement and (st.hf[k] or 0) < t then
			local o2, r = pcall(es.IsReadyToHatch, k)
			if o2 and r == true then
				local o3, a = pcall(es.BeginHatch, k)
				local o4, b = false, false
				if o3 and a then o4, b = pcall(es.FinishHatch, k) end
				if o4 and b then
					n += 1
				else
					st.hf[k] = t + 60
				end
				task.wait(0.3)
			end
		end
	end
	return n
end

task.spawn(function()
	while ge.__BkSae == st do
		task.wait(10)
		if ge.__BkSae ~= st then break end
		if not kv() then continue end
		if st.ah then
			local n = ht()
			if n > 0 then pcall(appendfile, "BaKhi/SaeLog.txt", string.format("%s Hatched %d\n", os.date("%H:%M:%S"), n)) end
		end
		if st.ps or st.es then
			local p, e = sc()
			if #p + #e > 0 then
				sl(p, e)
				pcall(appendfile, "BaKhi/SaeLog.txt", string.format("%s Sold %d Pets, %d Eggs\n", os.date("%H:%M:%S"), #p, #e))
			end
		end
	end
end)

L = (function()
local ps, uis, tws, gs, hs = game:GetService("Players"), game:GetService("UserInputService"), game:GetService("TweenService"), game:GetService("GuiService"), game:GetService("HttpService")
local ge = getgenv and getgenv() or _G
local hx, wt = Color3.fromHex, Color3.new(1, 1, 1)
local c = {cr = hx("07101C"), sh = hx("8CDCFF"), ac = hx("4FD8FF"), a2 = hx("8FE3FF"), dm = hx("9FC6D6"), ok = hx("7DFFB0"), er = hx("FF5A6A"), r1 = hx("FF2A6A"), r2 = hx("2AF0FF"), hi = hx("BFF2FF")}
local bs = "rbxasset://fonts/families/BuilderSans.json"
local fn, fs, fb, fm, fj = Font.new(bs, Enum.FontWeight.Medium), Font.new(bs, Enum.FontWeight.SemiBold), Font.new(bs, Enum.FontWeight.Bold), Font.fromEnum(Enum.Font.Michroma), Font.new("rbxasset://fonts/families/Jura.json", Enum.FontWeight.Bold)
local ir = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json")
local ww, wh, nw, th = 580, 340, 136, 48
local mb, tc, mm, kb = Enum.UserInputType.MouseButton1, Enum.UserInputType.Touch, Enum.UserInputType.MouseMovement, Enum.UserInputType.Keyboard
local ti, tb2 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local L = {Flags = {}}

local function mk(k, p, ch)
	local o = Instance.new(k)
	for i, v in p do
		if i ~= "Parent" then o[i] = v end
	end
	for _, x in ch or {} do x.Parent = o end
	o.Parent = p.Parent
	return o
end

local function rc(r) return mk("UICorner", {CornerRadius = UDim.new(0, r)}) end
local function sk(t, col, w) return mk("UIStroke", {Color = col or wt, Transparency = t, Thickness = w or 1, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}) end
local function pd(l, r, t, b) return mk("UIPadding", {PaddingLeft = UDim.new(0, l), PaddingRight = UDim.new(0, r or l), PaddingTop = UDim.new(0, t or 0), PaddingBottom = UDim.new(0, b or t or 0)}) end
local function ll(g) return mk("UIListLayout", {Padding = UDim.new(0, g), SortOrder = Enum.SortOrder.LayoutOrder}) end
local function tw(o, p, i) tws:Create(o, i or ti, p):Play() end
local function ns(t) local k = {}; for i = 1, #t, 2 do k[#k + 1] = NumberSequenceKeypoint.new(t[i], t[i + 1]) end; return NumberSequence.new(k) end

local function tl(p, ch)
	local d = {BackgroundTransparency = 1, FontFace = fn, TextColor3 = wt, TextSize = 14, TextXAlignment = Enum.TextXAlignment.Left, Text = ""}
	for i, v in p do d[i] = v end
	return mk("TextLabel", d, ch)
end

local function ig(p, ch)
	local d = {BackgroundTransparency = 1, FontFace = ir, TextColor3 = c.dm, TextSize = 14, Text = ""}
	for i, v in p do d[i] = v end
	return mk("TextLabel", d, ch)
end

local function bt(p, ch)
	local d = {BackgroundTransparency = 1, AutoButtonColor = false, Text = "", BorderSizePixel = 0}
	for i, v in p do d[i] = v end
	return mk("TextButton", d, ch)
end

local function rg(s, w, col, t, q)
	return mk("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(s, s), BackgroundTransparency = 1}, {rc(s), mk("UIStroke", {Color = col, Thickness = w, Transparency = t or 0}, {q and mk("UIGradient", {Transparency = ns(q)}) or nil})})
end

local function rx(p, s)
	local f = mk("Frame", {Size = UDim2.fromOffset(s, s), BackgroundTransparency = 1, Parent = p})
	local a = rg(s - 2, 2, c.ac, 0, {0, 0, 0.34, 0, 0.35, 1, 0.65, 1, 0.66, 0, 1, 0})
	local b = rg(math.round(s * 0.62), 1, c.a2, 0, {0, 0, 0.5, 0, 0.6, 1, 1, 1})
	a.Parent, b.Parent = f, f
	local d = mk("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(math.round(s * 0.3), math.round(s * 0.3)), BackgroundColor3 = c.hi, BorderSizePixel = 0, Parent = f}, {rc(s), sk(0.4, c.ac, 2)})
	for _, x in {a, b, d} do
		x.Size = UDim2.fromScale(x.Size.X.Offset / s, x.Size.Y.Offset / s)
		x:FindFirstChildOfClass("UICorner").CornerRadius = UDim.new(0.5, 0)
	end
	return f, a, b
end
L.Reactor = rx

local function gui()
	local sg = mk("ScreenGui", {Name = hs:GenerateGUID(false), IgnoreGuiInset = true, ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 999})
	if not pcall(function() sg.Parent = gethui and gethui() or game:GetService("CoreGui") end) then sg.Parent = ps.LocalPlayer:WaitForChild("PlayerGui") end
	return sg
end

local function fit(sg, f, sc)
	local s, i = sg.AbsoluteSize, gs:GetGuiInset().Y
	local v = math.clamp(math.min((s.X - 24) / ww, (s.Y - i - 24) / wh), 0.5, 1)
	sc.Scale = v
	f.Position = UDim2.fromOffset(s.X / 2, i + (s.Y - i) / 2)
	return v
end

local function cfn(s)
	if s == nil then return true end
	if type(s) ~= "string" or s == "" then return false end
	for sg in (s .. "/"):gmatch("([^/]*)/") do
		if not sg:match("^[%w _%-]+$") then return false end
	end
	return true
end

local function mkd(p)
	local d = ""
	for sg in p:gmatch("([^/]+)/") do
		d = d == "" and sg or d .. "/" .. sg
		if not isfolder(d) then makefolder(d) end
	end
end

local function hv(f, st)
	f.MouseEnter:Connect(function()
		if not uis.MouseEnabled then return end
		tw(f, {BackgroundColor3 = c.ac, BackgroundTransparency = 0.93})
		tw(st, {Color = c.ac, Transparency = 0.67})
	end)
	f.MouseLeave:Connect(function()
		tw(f, {BackgroundColor3 = wt, BackgroundTransparency = 0.957})
		tw(st, {Color = wt, Transparency = 0.92})
	end)
	f.MouseButton1Down:Connect(function() tw(f, {BackgroundColor3 = c.ac, BackgroundTransparency = 0.85}, TweenInfo.new(0.05)) end)
	f.MouseButton1Up:Connect(function() tw(f, {BackgroundColor3 = uis.MouseEnabled and c.ac or wt, BackgroundTransparency = uis.MouseEnabled and 0.93 or 0.957}) end)
end

local function bx(p, w)
	local b = bt({AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(w or 150, 28), BackgroundColor3 = wt, BackgroundTransparency = 0.937, Parent = p}, {rc(8), sk(0.81, c.ac)})
	return b, b:FindFirstChildOfClass("UIStroke")
end

function L:Window(o)
	o = o or {}
	if not cfn(o.Config) then error("Window Failed: Bad Config", 0) end
	if ge.__BkW then pcall(ge.__BkW.Destroy, ge.__BkW) end
	local W = {Tabs = {}, Current = nil, cn = {}, key = o.Key == nil and Enum.KeyCode.LeftControl or o.Key, kw = false, fc = nil, sv = 1, gd = 0.82, hc = false, ag = 0, op = true, ln = false}
	local sg = gui()
	W.Gui = sg
	local mn = mk("Frame", {Name = "Main", Size = UDim2.fromOffset(ww, wh), AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Parent = sg})
	W.Main = mn
	local sc = mk("UIScale", {Parent = mn})
	local shl = mk("Frame", {Name = "Shell", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), BackgroundColor3 = c.sh, BackgroundTransparency = 0.88, BorderSizePixel = 0, Parent = mn}, {rc(24), mk("UIStroke", {Color = wt, Thickness = 1.4}, {mk("UIGradient", {Rotation = 60, Color = ColorSequence.new({ColorSequenceKeypoint.new(0, wt), ColorSequenceKeypoint.new(0.35, wt), ColorSequenceKeypoint.new(0.65, c.ac), ColorSequenceKeypoint.new(1, c.hi)}), Transparency = ns({0, 0, 0.35, 0.81, 0.65, 0.87, 1, 0.13})})})})
	local bks = {}
	for i, a in {{0, 0}, {1, 0}, {0, 1}, {1, 1}} do
		local x, y = a[1], a[2]
		local f = mk("Frame", {AnchorPoint = Vector2.new(x, y), Position = UDim2.new(x, x == 0 and -6 or 6, y, y == 0 and -6 or 6), Size = UDim2.fromOffset(20, 20), BackgroundTransparency = 1, ZIndex = 3, Name = "Bk" .. i, Parent = mn})
		mk("Frame", {AnchorPoint = Vector2.new(x, y), Position = UDim2.fromScale(x, y), Size = UDim2.fromOffset(20, 2), BackgroundColor3 = c.ac, BorderSizePixel = 0, ZIndex = 3, Parent = f})
		mk("Frame", {AnchorPoint = Vector2.new(x, y), Position = UDim2.fromScale(x, y), Size = UDim2.fromOffset(2, 20), BackgroundColor3 = c.ac, BorderSizePixel = 0, ZIndex = 3, Parent = f})
		bks[i] = {f, f.Position, UDim2.new(x, x == 0 and -36 or 36, y, y == 0 and -36 or 36)}
	end
	local cr = mk("Frame", {Name = "Core", AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, -14, 1, -14), BackgroundColor3 = c.cr, BackgroundTransparency = 1 - W.gd, BorderSizePixel = 0, ClipsDescendants = true, Parent = mn}, {rc(18), sk(0.81, c.ac)})
	W.Core = cr
	local bgh = mk("Frame", {Name = "Fx", Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = cr})
	local tb = mk("Frame", {Size = UDim2.new(1, 0, 0, th), BackgroundTransparency = 1, Parent = cr})
	local re, ra, rb = rx(tb, 30)
	re.Position = UDim2.fromOffset(16, 9)
	local ttx = tostring(o.Title or "BAKHI HUB")
	local tt = tl({Text = ttx, FontFace = fm, TextSize = 14, Position = UDim2.fromOffset(57, 8), Size = UDim2.new(1, -250, 0, 18), TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 3, Parent = tb})
	local t1 = tl({Text = ttx, FontFace = fm, TextSize = 14, TextColor3 = c.r1, TextTransparency = 0.45, Position = UDim2.fromOffset(56, 8), Size = tt.Size, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 2, Parent = tb})
	local t2 = tl({Text = ttx, FontFace = fm, TextSize = 14, TextColor3 = c.r2, TextTransparency = 0.45, Position = UDim2.fromOffset(58, 8), Size = tt.Size, TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 2, Parent = tb})
	W.tt = {tt, t1, t2}
	local sbt = tl({Text = tostring(o.Subtitle or ""), FontFace = fj, TextSize = 10, TextColor3 = c.a2, Position = UDim2.fromOffset(57, 28), Size = UDim2.new(1, -250, 0, 12), TextTruncate = Enum.TextTruncate.AtEnd, Parent = tb})
	local function sst(s, a) W.ss.Text = `SYS <font color="#{c.ok:ToHex()}" transparency="{a or 0}">{s}</font>` end
	W.ss = tl({Text = `SYS <font color="#{c.ok:ToHex()}">ONLINE</font>`, RichText = true, FontFace = fj, TextSize = 10, TextColor3 = c.a2, TextXAlignment = Enum.TextXAlignment.Right, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -84, 0, 0), Size = UDim2.fromOffset(100, th), Parent = tb})
	local function cap(x, g)
		local b = bt({Size = UDim2.fromOffset(28, 24), Position = UDim2.new(1, x, 0, 12), BackgroundColor3 = wt, Parent = tb}, {rc(6)})
		local i = ig({Text = g, Size = UDim2.fromScale(1, 1), Parent = b})
		b.MouseEnter:Connect(function() if uis.MouseEnabled then tw(b, {BackgroundTransparency = 0.9}) end end)
		b.MouseLeave:Connect(function() tw(b, {BackgroundTransparency = 1}) end)
		return b, i
	end
	local xb, xi = cap(-42, "x")
	local nb = cap(-74, "minus")
	local tsf = mk("Frame", {AnchorPoint = Vector2.new(1, 1), Position = UDim2.new(1, -12, 1, -12), Size = UDim2.fromOffset(300, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, ZIndex = 100, Parent = sg}, {ll(8)})

	function W:Notify(n)
		n = n or {}
		if n.Title == nil and n.Text == nil then error("Notify Failed: No Text", 0) end
		local t = n.Time == nil and 4 or n.Time
		if type(t) ~= "number" or t ~= t or t <= 0 then error("Notify Failed: Bad Time", 0) end
		local f = mk("Frame", {Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = c.cr, BackgroundTransparency = 0.08, BorderSizePixel = 0, ZIndex = 100, Parent = tsf}, {rc(12), sk(0.6, n.Error and c.er or c.ac), pd(20, 14, 10, 10)})
		mk("Frame", {Position = UDim2.fromOffset(-12, 2), Size = UDim2.new(0, 3, 1, -4), BackgroundColor3 = n.Error and c.er or c.ac, BorderSizePixel = 0, ZIndex = 101, Parent = f}, {rc(2)})
		local ly = mk("Frame", {Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, ZIndex = 101, Parent = f}, {ll(2)})
		tl({Text = tostring(n.Title or "BaKhi Hub"), FontFace = fb, Size = UDim2.new(1, 0, 0, 18), TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 102, LayoutOrder = 1, Parent = ly})
		if n.Text ~= nil then tl({Text = tostring(n.Text), TextSize = 13, TextColor3 = c.dm, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, TextWrapped = true, ZIndex = 102, LayoutOrder = 2, Parent = ly}) end
		local us = mk("UIScale", {Scale = 0.9, Parent = f})
		tw(us, {Scale = 1}, tb2)
		task.delay(t, function() if f.Parent then f:Destroy() end end)
		return f
	end

	local function run(f, ...)
		if not f then return end
		local ok, e = pcall(f, ...)
		if ok then return end
		warn("Callback Failed: " .. tostring(e))
		W:Notify({Title = "Callback Failed", Text = tostring(e), Error = true})
	end

	local cp, cd, dirty, pend, dead = o.Config and `BaKhi/Configs/{o.Config}.json`, {}, false, false, false
	if cp and isfile and isfile(cp) then
		local ok, d = pcall(function() return hs:JSONDecode(readfile(cp)) end)
		if ok and type(d) == "table" then cd = d else
			pcall(function() writefile(cp .. ".bad", readfile(cp)); delfile(cp) end)
			W:Notify({Title = "Config Load Failed", Text = "Invalid Json", Error = true})
		end
	end
	local function save()
		if not cp or not dirty then return end
		dirty = false
		pcall(function()
			mkd(cp)
			writefile(cp, hs:JSONEncode(cd))
		end)
	end
	local function put(e, v)
		if not e.Flag then return end
		L.Flags[e.Flag] = v
		if not cp then return end
		if e.sv then cd[e.Flag] = e.sv(v) else cd[e.Flag] = v end
		dirty = true
		if pend or dead then return end
		pend = true
		task.delay(0.5, function() pend = false; save() end)
	end
	local function done(e)
		if not e.Flag then return end
		L.Flags[e.Flag] = e:Get()
		local s = cd[e.Flag]
		if s == nil then return end
		pcall(function()
			if e.ld then s = e.ld(s) end
			e:Set(s)
		end)
	end

	local nv = mk("Frame", {Name = "Nav", Position = UDim2.fromOffset(12, th), Size = UDim2.new(0, nw, 1, -(th + 12)), BackgroundColor3 = wt, BackgroundTransparency = 0.969, BorderSizePixel = 0, Parent = cr}, {rc(14), pd(6, 6, 6, 6)})
	local tf = mk("Frame", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Parent = nv})
	local ind = mk("Frame", {Size = UDim2.new(1, 0, 0, 32), BackgroundColor3 = c.ac, BorderSizePixel = 0, Visible = false, Parent = tf}, {rc(10), sk(0.53, c.ac), mk("UIGradient", {Transparency = ns({0, 0.69, 1, 0.92})})})
	mk("Frame", {Position = UDim2.fromOffset(0, 8), Size = UDim2.fromOffset(3, 16), BackgroundColor3 = c.ac, BorderSizePixel = 0, ZIndex = 2, Parent = ind}, {rc(2)})
	local pa = mk("Frame", {Name = "Pages", Position = UDim2.fromOffset(nw + 22, th), Size = UDim2.new(1, -(nw + 34), 1, -(th + 12)), BackgroundTransparency = 1, ClipsDescendants = true, Parent = cr})
	local ov = bt({Name = "Overlay", Size = UDim2.fromScale(1, 1), ZIndex = 50, Visible = false, Parent = mn})
	ov.Activated:Connect(function() if W.fc then W.fc() end end)

	local fl = bt({Name = "Float", Size = UDim2.fromOffset(44, 44), BackgroundColor3 = c.cr, BackgroundTransparency = 0.15, Parent = sg}, {rc(22), sk(0.45, c.ac)})
	local fr, fa, fq = rx(fl, 26)
	fr.AnchorPoint, fr.Position = Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.5)
	for _, x in fr:GetDescendants() do
		if x:IsA("GuiObject") then x.Active = false end
	end

	local function fx()
		W.sv = fit(sg, mn, sc)
		fl.Position = UDim2.fromOffset(16, gs:GetGuiInset().Y + 8)
	end
	fx()
	table.insert(W.cn, sg:GetPropertyChangedSignal("AbsoluteSize"):Connect(fx))

	local lv = {Full = true, Light = true, Off = true}
	W.fx, W.ba, W.on, W.bk = lv[cd.fx] and cd.fx or ((uis.TouchEnabled and not uis.MouseEnabled) and "Light" or "Full"), cd.ba ~= false, false, false
	if type(cd.gd) == "number" and cd.gd == cd.gd then W.gd = math.clamp(cd.gd, 40, 95) / 100 end
	cr.BackgroundTransparency = 1 - W.gd
	local hr = mk("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, -65, 1, -55), Size = UDim2.fromOffset(250, 250), BackgroundTransparency = 1, Parent = bgh})
	local hl, pt = {}, {}
	for _, d in {{236, 1, 0.55, {0, 0, 0.3, 0, 0.31, 1, 0.45, 1, 0.46, 0, 1, 0}, 20}, {214, 5, 0.78, {0, 0, 0.6, 0, 0.61, 1, 1, 1}, -12}, {176, 2, 0.6, {0, 1, 0.2, 1, 0.21, 0, 0.5, 0, 0.51, 1, 0.75, 1, 0.76, 0, 1, 0}, -40}, {128, 1, 0.65}, {100, 3, 0.55, {0, 0, 0.25, 0, 0.26, 1, 1, 1}, 72}} do
		local r = rg(d[1], d[2], c.ac, d[3], d[4])
		r.Parent = hr
		if d[5] then hl[#hl + 1] = {r, d[5]} end
	end
	for i = 1, 12 do
		pt[i] = {f = mk("Frame", {Size = UDim2.fromOffset(3, 3), BackgroundColor3 = c.ac, BackgroundTransparency = 1, BorderSizePixel = 0, Parent = bgh}, {rc(2)}), t = math.random(), d = 5 + math.random() * 7, x = math.random(), y = 0.6 + math.random() * 0.45}
	end
	local swp = mk("Frame", {Name = "Sweep", Size = UDim2.fromScale(1, 1), BackgroundColor3 = wt, BorderSizePixel = 0, ZIndex = 40, Parent = cr}, {rc(18)})
	local sgd = mk("UIGradient", {Rotation = 20, Offset = Vector2.new(-1, 0), Transparency = ns({0, 1, 0.42, 1, 0.47, 0.82, 0.5, 0.74, 0.53, 0.82, 0.58, 1, 1, 1}), Parent = swp})
	local ru = game:GetService("RunService")
	local s0, b0 = 3, 0
	local function hb(dt)
		for _, x in {{ra, 164}, {rb, -90}, {fa, 164}, {fq, -90}} do x[1].Rotation = (x[1].Rotation + x[2] * dt) % 360 end
		if W.fx == "Full" then
			for _, x in hl do x[1].Rotation = (x[1].Rotation + x[2] * dt) % 360 end
			for _, q in pt do
				q.t += dt / q.d
				if q.t >= 1 then q.t, q.x, q.y, q.d = 0, math.random(), 0.6 + math.random() * 0.45, 5 + math.random() * 7 end
				q.f.Position, q.f.BackgroundTransparency = UDim2.new(q.x, 0, q.y, -q.t * 260), 1 - (q.t < 0.15 and q.t / 0.15 or (1 - q.t) / 0.85) * 0.8
			end
		end
		s0 += dt
		if s0 >= (W.fx == "Full" and 6 or 12) then
			s0, sgd.Offset = 0, Vector2.new(-1, 0)
			tw(sgd, {Offset = Vector2.new(1, 0)}, TweenInfo.new(1.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut))
		end
		b0 += dt
		if W.on and b0 >= 0.7 then
			b0, W.bk = 0, not W.bk
			sst("ONLINE", W.bk and 0.65 or 0)
		end
	end
	function W.up()
		local on = mn.Visible and W.fx ~= "Off" and not dead
		if on and not W.hc then W.hc = ru.Heartbeat:Connect(hb) elseif not on and W.hc then W.hc:Disconnect(); W.hc = false end
		hr.Visible = W.fx == "Full"
		for _, q in pt do q.f.Visible = W.fx == "Full" end
		if W.fx == "Off" and W.on then sst("ONLINE") end
	end
	function W:Effects(v)
		if not lv[v] then error("Effects Failed: Bad Level", 0) end
		W.fx = v
		W.up()
	end
	local function fl2(f)
		if W.fx == "Off" then return end
		f.BackgroundColor3, f.BackgroundTransparency = c.ac, 0.75
		tw(f, {BackgroundColor3 = wt, BackgroundTransparency = 0.957}, TweenInfo.new(0.5))
	end
	local function rpl(a)
		if W.fx == "Off" then return end
		local r = mk("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(), BackgroundTransparency = 1, ZIndex = 5, Parent = a}, {rc(200), sk(0, c.ac, 2)})
		tw(r, {Size = UDim2.fromOffset(120, 120)}, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
		tw(r:FindFirstChildOfClass("UIStroke"), {Transparency = 1}, TweenInfo.new(0.6))
		task.delay(0.65, function() r:Destroy() end)
	end
	local function scn(f, d)
		if W.fx == "Off" or not f:IsA("GuiButton") then return end
		local s = mk("Frame", {Position = UDim2.fromOffset(-94, 0), Size = UDim2.new(0, 60, 1, 0), BackgroundColor3 = c.ac, BorderSizePixel = 0, ZIndex = 4, Parent = f}, {mk("UIGradient", {Transparency = ns({0, 1, 0.5, 0.6, 1, 1})})})
		task.delay(d, function() if s.Parent then tw(s, {Position = UDim2.new(1, 20, 0, 0)}, TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)) end end)
		task.delay(d + 0.75, function() s:Destroy() end)
	end
	local function glt(p)
		if W.fx == "Off" then return end
		for i, q in {{4, 52, 62}, {-3, 59, 53}, {0, 56, 58}} do
			task.delay((i - 1) * 0.09, function()
				p.Position = UDim2.fromOffset(q[1], 0)
				t1.Position, t2.Position = UDim2.fromOffset(q[2], 8), UDim2.fromOffset(q[3], 8)
			end)
		end
		for i, e in W.Current.Rows do scn(e.Row, 0.05 + (i - 1) * 0.06) end
	end
	local function ty(ls, sp, g)
		local n = utf8.len(ls[1].Text) or #ls[1].Text
		for i = 0, n do
			if dead or W.ag ~= g then return end
			for _, l in ls do l.MaxVisibleGraphemes = i end
			task.wait(sp)
		end
		for _, l in ls do l.MaxVisibleGraphemes = -1 end
	end
	local t0 = TweenInfo.new(0)
	local function lnf(w)
		if W.ln then W.ln:Destroy() end
		W.ln = mk("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(w, 0, 0, 2), BackgroundColor3 = wt, BorderSizePixel = 0, ZIndex = 6, Parent = mn}, {mk("UIGradient", {Color = ColorSequence.new({ColorSequenceKeypoint.new(0, c.ac), ColorSequenceKeypoint.new(0.5, wt), ColorSequenceKeypoint.new(1, c.ac)}), Transparency = ns({0, 1, 0.2, 0, 0.8, 0, 1, 1})})})
		return W.ln
	end
	local function whole()
		if W.ln then W.ln:Destroy(); W.ln = false end
		tw(shl, {Size = UDim2.fromScale(1, 1)}, t0)
		cr.Visible = true
		for _, b in bks do
			b[1].Visible = true
			tw(b[1], {Position = b[2]}, t0)
		end
		for _, l in {tt, t1, t2, sbt} do l.MaxVisibleGraphemes = -1 end
		for _, T in W.Tabs do tw(T.nm, {TextTransparency = 0}, t0) end
		ind.Visible = W.Current ~= nil
		W.on = true
		sst("ONLINE")
	end
	local function boot(g)
		local k = W.fx == "Light" and 0.4 or 1
		W.on = false
		sst("BOOT")
		local ln = lnf(0)
		tw(shl, {Size = UDim2.new(1, 0, 0, 2)}, t0)
		cr.Visible = false
		for _, b in bks do
			b[1].Visible = false
			tw(b[1], {Position = b[3]}, t0)
		end
		for _, l in {tt, t1, t2, sbt} do l.MaxVisibleGraphemes = 0 end
		task.spawn(function()
			local function z(s) task.wait(s * k); return dead or W.ag ~= g end
			tw(ln, {Size = UDim2.new(1, 0, 0, 2)}, TweenInfo.new(0.35 * k, Enum.EasingStyle.Quad, Enum.EasingDirection.Out))
			if z(0.35) then return end
			tw(ln, {BackgroundTransparency = 1}, TweenInfo.new(0.4 * k))
			tw(shl, {Size = UDim2.fromScale(1, 1)}, TweenInfo.new(0.45 * k, Enum.EasingStyle.Quint, Enum.EasingDirection.Out))
			if z(0.4) then return end
			for _, T in W.Tabs do tw(T.nm, {TextTransparency = 1}, t0) end
			ind.Visible = false
			for _, s in {0.06, 0.05, 0.07, 0.04, 0.08, 0.05} do
				cr.Visible = not cr.Visible
				if z(s) then return end
			end
			cr.Visible = true
			if W.ln == ln then ln:Destroy(); W.ln = false end
			for _, b in bks do
				b[1].Visible = true
				tw(b[1], {Position = b[2]}, TweenInfo.new(0.45 * k, Enum.EasingStyle.Back, Enum.EasingDirection.Out))
			end
			task.spawn(ty, {tt, t1, t2}, 0.055 * k, g)
			task.delay(0.4 * k, ty, {sbt}, 0.022 * k, g)
			if z(0.25) then return end
			for i, T in W.Tabs do task.delay((i - 1) * 0.07 * k, function() if W.ag == g then tw(T.nm, {TextTransparency = 0}) end end) end
			if z(0.2) then return end
			ind.Visible = W.Current ~= nil
			for i, e in W.Current and W.Current.Rows or {} do scn(e.Row, (i - 1) * 0.08 * k) end
			if z(0.6) then return end
			W.on = true
			sst("ONLINE")
		end)
	end
	local function fold(g)
		local k = W.fx == "Light" and 0.4 or 1
		local function z(s) task.wait(s * k); return dead or W.ag ~= g end
		W.on = false
		sst("OFFLINE")
		for _, b in bks do tw(b[1], {Position = b[3]}, TweenInfo.new(0.2 * k, Enum.EasingStyle.Quad, Enum.EasingDirection.In)) end
		if z(0.15) then return end
		for _, b in bks do b[1].Visible = false end
		for _, s in {0.04, 0.05, 0.03, 0.05} do
			cr.Visible = not cr.Visible
			if z(s) then return end
		end
		cr.Visible = false
		local ln = lnf(1)
		tw(shl, {Size = UDim2.new(1, 0, 0, 2)}, TweenInfo.new(0.25 * k, Enum.EasingStyle.Quint, Enum.EasingDirection.In))
		if z(0.25) then return end
		tw(ln, {Size = UDim2.new(0, 0, 0, 2)}, TweenInfo.new(0.2 * k, Enum.EasingStyle.Quad, Enum.EasingDirection.In))
		if z(0.2) then return end
		if W.ln == ln then ln:Destroy(); W.ln = false end
		mn.Visible = false
		W.up()
	end
	local function an2() return W.ba and W.fx ~= "Off" end

	function W:Show()
		W.ag += 1
		W.op, mn.Visible, sc.Scale = true, true, W.sv
		W.up()
		if an2() then boot(W.ag) else whole() end
	end
	function W:Hide()
		W.ag += 1
		W.op = false
		if an2() and mn.Visible then task.spawn(fold, W.ag); return end
		whole()
		mn.Visible = false
		W.up()
	end
	local function tg() if W.op then W:Hide() else W:Show() end end
	fl.Activated:Connect(tg)
	nb.Activated:Connect(function() W:Hide() end)
	local arm, an = false, 0
	xb.Activated:Connect(function()
		if arm then (W :: any):Destroy(); return end
		arm, an = true, an + 1
		local n = an
		tw(xb, {BackgroundColor3 = c.er, BackgroundTransparency = 0})
		xi.TextColor3 = wt
		task.delay(3, function()
			if an ~= n or not arm then return end
			arm = false
			tw(xb, {BackgroundColor3 = wt, BackgroundTransparency = 1})
			xi.TextColor3 = c.dm
		end)
	end)

	local dr
	table.insert(W.cn, tb.InputBegan:Connect(function(i)
		if i.UserInputType ~= mb and i.UserInputType ~= tc then return end
		local p0, d0 = mn.Position, i.Position
		dr = {i = i, mv = function(p)
			local s, n, hw, hh = sg.AbsoluteSize, gs:GetGuiInset().Y, mn.AbsoluteSize.X / 2, mn.AbsoluteSize.Y / 2
			mn.Position = UDim2.fromOffset(math.clamp(p0.X.Offset + p.X - d0.X, hw, s.X - hw), math.clamp(p0.Y.Offset + p.Y - d0.Y, n + hh, s.Y - hh))
		end}
	end))
	table.insert(W.cn, uis.InputChanged:Connect(function(i)
		if not dr or (i.UserInputType ~= mm and i ~= dr.i) then return end
		dr.mv(i.Position)
	end))
	table.insert(W.cn, uis.InputEnded:Connect(function(i)
		if not dr or (i ~= dr.i and i.UserInputType ~= mb) then return end
		if dr.up then dr.up() end
		dr = nil
	end))
	table.insert(W.cn, uis.InputBegan:Connect(function(i)
		if i.UserInputType ~= kb or W.kw or not W.key or i.KeyCode ~= W.key or uis:GetFocusedTextBox() then return end
		tg()
	end))

	function W:Tab(t)
		t = t or {}
		local T = {Rows = {}, Name = tostring(t.Name or "Tab"), W = W, n = 0, sec = nil, i = #W.Tabs + 1}
		local b = bt({Position = UDim2.fromOffset(0, (T.i - 1) * 36), Size = UDim2.new(1, 0, 0, 32), ZIndex = 2, Parent = tf})
		local nm = tl({Text = T.Name, FontFace = fs, TextSize = 13, TextColor3 = c.dm, Position = UDim2.fromOffset(12, 0), Size = UDim2.new(1, -16, 1, 0), TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 2, Parent = b})
		local p = mk("ScrollingFrame", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = c.a2, ScrollBarImageTransparency = 0.4, AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(), ScrollingDirection = Enum.ScrollingDirection.Y, Visible = false, Parent = pa}, {ll(6), pd(1, 8, 1, 4)})
		T.Page, T.Btn, T.nm = p, b, nm
		function T.pt(on) tw(nm, {TextColor3 = on and wt or c.dm}) end
		b.MouseEnter:Connect(function() if uis.MouseEnabled and W.Current ~= T then tw(nm, {TextColor3 = c.a2}) end end)
		b.MouseLeave:Connect(function() if W.Current ~= T then tw(nm, {TextColor3 = c.dm}) end end)
		function T:Select()
			if W.Current == T then return end
			local f = W.Current == nil
			if W.Current then W.Current.Page.Visible = false; W.Current.pt(false) end
			W.Current, p.Visible = T, true
			T.pt(true)
			local y = UDim2.fromOffset(0, (T.i - 1) * 36)
			if f then ind.Position, ind.Visible = y, true else tw(ind, {Position = y}, tb2); glt(p) end
		end
		b.Activated:Connect(function() T:Select() end)
		table.insert(W.Tabs, T)
		if not W.Current then T:Select() end

		local function add(e)
			T.n += 1
			e.Row.LayoutOrder = T.n
			table.insert(T.Rows, e)
			return e
		end
		local function row(k, r)
			if type(r.Name) ~= "string" then error(`{k} Failed: Bad Name`, 0) end
			if r.Flag ~= nil and type(r.Flag) ~= "string" then error(`{k} Failed: Bad Flag`, 0) end
			local f = bt({Size = UDim2.new(1, 0, 0, 40), BackgroundColor3 = wt, BackgroundTransparency = 0.957, ClipsDescendants = true, Parent = p}, {rc(12), sk(0.92), pd(14, 14)})
			hv(f, f:FindFirstChildOfClass("UIStroke"))
			local l = tl({Text = r.Name, FontFace = fs, Size = UDim2.new(0.5, 0, 1, 0), TextTruncate = Enum.TextTruncate.AtEnd, Parent = f})
			local e = {Row = f, Kind = k, Name = r.Name, Flag = r.Flag, Tab = T, Sec = T.sec, Label = l}
			function e:Get() return (e :: any).v end
			return add(e), f, l
		end
		local function txt(e, l, u)
			local s0 = l.Text
			function e:Set(s) s0 = tostring(s); l.Text = u and s0:upper() or s0 end
			function e:Get() return s0 end
			e:Set(s0)
			return e
		end

		function T:Section(r)
			r = r or {}
			local f = mk("Frame", {Size = UDim2.new(1, 0, 0, 26), BackgroundTransparency = 1, Parent = p})
			local l = tl({Text = tostring(r.Name or ""), FontFace = fj, TextSize = 11, TextColor3 = c.a2, Position = UDim2.fromOffset(4, 10), Size = UDim2.new(0, 0, 0, 14), AutomaticSize = Enum.AutomaticSize.X, Parent = f})
			local ln = mk("Frame", {AnchorPoint = Vector2.new(0, 0.5), BackgroundColor3 = c.ac, BorderSizePixel = 0, Parent = f}, {mk("UIGradient", {Transparency = ns({0, 0.6, 1, 1})})})
			local function lay() ln.Position, ln.Size = UDim2.fromOffset(l.AbsoluteSize.X / math.max(sc.Scale, 0.01) + 12, 17), UDim2.new(1, -(l.AbsoluteSize.X / math.max(sc.Scale, 0.01) + 16), 0, 1) end
			l:GetPropertyChangedSignal("AbsoluteSize"):Connect(lay)
			lay()
			T.sec = r.Name and tostring(r.Name) or ""
			return txt(add({Row = f, Kind = "Section", Name = T.sec, Tab = T}), l, true)
		end

		function T:Label(r)
			r = r or {}
			local f = mk("Frame", {Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundColor3 = wt, BackgroundTransparency = 0.957, BorderSizePixel = 0, Parent = p}, {rc(12), sk(0.92), pd(14, 14, 10, 10)})
			local l = tl({Text = tostring(r.Text or ""), TextSize = 13, TextColor3 = c.dm, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, TextWrapped = true, Parent = f})
			return txt(add({Row = f, Kind = "Label", Name = l.Text, Tab = T, Sec = T.sec}), l)
		end

		function T:Button(r)
			r = r or {}
			local e, f, l = row("Button", r)
			ig({Text = "chevron-small-right", TextColor3 = c.a2, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 0), Size = UDim2.fromOffset(16, 40), Parent = f})
			f.Activated:Connect(function()
				fl2(f)
				run(r.Callback)
			end)
			return txt(e, l)
		end

		function T:Toggle(r)
			r = r or {}
			local e, f = row("Toggle", r)
			local sw = mk("Frame", {AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, 0, 0.5, 0), Size = UDim2.fromOffset(42, 22), BackgroundColor3 = wt, BackgroundTransparency = 0.84, BorderSizePixel = 0, Parent = f}, {rc(11)})
			local kn = mk("Frame", {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 2, 0.5, 0), Size = UDim2.fromOffset(18, 18), BackgroundColor3 = hx("D6E6EE"), BorderSizePixel = 0, Parent = sw}, {rc(9)})
			e.sw, e.v, e.ld = sw, r.Default == true, function(s) return s == true end
			local function draw(a)
				local on = e.v
				local q = {sw, {BackgroundColor3 = on and c.ac or wt, BackgroundTransparency = on and 0 or 0.84}, kn, {Position = UDim2.new(0, on and 22 or 2, 0.5, 0), BackgroundColor3 = on and wt or hx("D6E6EE")}}
				for i = 1, #q, 2 do
					if a then tw(q[i], q[i + 1], i == 3 and tb2 or ti) else for k, v in q[i + 1] do q[i][k] = v end end
				end
			end
			draw(false)
			function e:Set(v)
				v = v == true
				if v == e.v then return end
				e.v = v
				draw(true)
				put(e, v)
				run(r.Callback, v)
			end
			f.Activated:Connect(function()
				e:Set(not e.v)
				rpl(sw)
				fl2(f)
			end)
			done(e)
			return e
		end

		function T:Slider(r)
			r = r or {}
			local lo, hi, st = tonumber(r.Min), tonumber(r.Max), r.Step == nil and 1 or tonumber(r.Step)
			if not (lo and hi and hi > lo) then error("Slider Failed: Bad Range", 0) end
			if not (st and st > 0) then error("Slider Failed: Bad Step", 0) end
			local e, f = row("Slider", r)
			local vl = tl({Text = "", FontFace = fj, TextSize = 12, TextColor3 = c.a2, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 0), Size = UDim2.fromOffset(40, 40), TextXAlignment = Enum.TextXAlignment.Right, Parent = f})
			local hit = bt({AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -52, 0.5, 0), Size = UDim2.fromOffset(110, 28), Parent = f})
			local tr = mk("Frame", {AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.new(1, 0, 0, 5), BackgroundColor3 = wt, BackgroundTransparency = 0.84, BorderSizePixel = 0, Parent = hit}, {rc(3)})
			local fi = mk("Frame", {Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = c.ac, BorderSizePixel = 0, Parent = tr}, {rc(3)})
			local kn = mk("Frame", {AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 0, 0.5, 0), Size = UDim2.fromOffset(16, 16), BackgroundColor3 = wt, BorderSizePixel = 0, Parent = hit}, {rc(8), sk(0.55, c.ac, 3)})
			local function q(v) return math.clamp(lo + math.round((v - lo) / st) * st, lo, hi) end
			local d0 = r.Default
			e.v, e.ld = q(type(d0) == "number" and d0 == d0 and d0 or lo), tonumber
			local function draw()
				local a = (e.v - lo) / (hi - lo)
				fi.Size, kn.Position, vl.Text = UDim2.new(a, 0, 1, 0), UDim2.new(a, 0, 0.5, 0), ("%g"):format(e.v)
			end
			draw()
			function e:Set(v)
				if type(v) ~= "number" or v ~= v then error("Slider Set Failed: Not A Number", 0) end
				v = q(v)
				if v == e.v then return end
				e.v = v
				draw()
				put(e, v)
				run(r.Callback, v)
			end
			local function at(x) e:Set(lo + math.clamp((x - hit.AbsolutePosition.X) / hit.AbsoluteSize.X, 0, 1) * (hi - lo)) end
			hit.InputBegan:Connect(function(i)
				if i.UserInputType ~= mb and i.UserInputType ~= tc then return end
				p.ScrollingEnabled = false
				dr = {i = i, mv = function(v) at(v.X) end, up = function() p.ScrollingEnabled = true end}
				at(i.Position.X)
			end)
			done(e)
			return e
		end

		function T:Dropdown(r)
			r = r or {}
			if type(r.Options) ~= "table" then error("Dropdown Failed: Bad Options", 0) end
			local e, f = row("Dropdown", r)
			local mu = r.Multi == true
			e.Options = {}
			local function opts(l)
				local seen = {}
				e.Options = {}
				for _, s in l do
					if type(s) == "string" and not seen[s] then seen[s] = true; table.insert(e.Options, s) end
				end
			end
			opts(r.Options)
			local box = bx(f)
			local bl = tl({Text = "", FontFace = fs, TextSize = 12, Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -34, 1, 0), TextTruncate = Enum.TextTruncate.AtEnd, Parent = box})
			local ch = ig({Text = "chevron-small-down", TextColor3 = c.a2, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -6, 0, 0), Size = UDim2.fromOffset(16, 28), Parent = box})
			local function norm(v)
				if mu then
					if type(v) ~= "table" then error("Dropdown Set Failed: Not A Table", 0) end
					local wn, out = {}, {}
					for _, s in v do wn[s] = true end
					for _, s in e.Options do
						if wn[s] then table.insert(out, s) end
					end
					return out
				end
				if v == nil then return nil end
				if table.find(e.Options, v) then return v end
				error("Dropdown Set Failed: Unknown Option", 0)
			end
			local function same(a, b)
				if not mu then return a == b end
				if #a ~= #b then return false end
				for i, s in a do
					if b[i] ~= s then return false end
				end
				return true
			end
			e.v = if mu then (if type(r.Default) == "table" then norm(r.Default) else {}) else (if table.find(e.Options, r.Default) then r.Default else nil)
			if mu then e.ld = function(s) return type(s) == "table" and s or {} end else e.sv, e.ld = function(v) return if v == nil then false else v end, function(s) return s ~= false and s or nil end end
			local function has(s) return mu and table.find(e.v, s) ~= nil or not mu and e.v == s end
			local function draw()
				local an = mu and #e.v > 0 or not mu and e.v ~= nil
				bl.Text, bl.TextColor3 = an and (mu and table.concat(e.v, ", ") or e.v) or "None", an and wt or c.dm
			end
			draw()
			function e:Get() return mu and table.clone(e.v) or e.v end
			local function emit(v)
				e.v = v
				draw()
				put(e, e:Get())
				run(r.Callback, e:Get())
			end
			function e:Set(v)
				v = norm(v)
				if same(v, e.v) then return end
				emit(v)
			end
			function e:Refresh(l)
				if type(l) ~= "table" then error("Dropdown Refresh Failed: Bad Options", 0) end
				opts(l)
				local v = mu and norm(e.v) or (table.find(e.Options, e.v) and e.v or nil)
				if not same(v, e.v) then emit(v) end
				draw()
			end
			local fy
			local function close()
				if not fy then return end
				fy:Destroy()
				fy, ov.Visible, ch.Text, W.fc = nil, false, "chevron-small-down", nil
			end
			local function open()
				if fy then close(); return end
				if W.fc then W.fc() end
				W.fc, ov.Visible, ch.Text = close, true, "chevron-small-up"
				local s, bp = sc.Scale, (box.AbsolutePosition - mn.AbsolutePosition) / sc.Scale
				local h = math.max(math.min(#e.Options, 5), 1) * 30 + 8
				local y = bp.Y + 32
				if y + h > wh - 8 then y = bp.Y - h - 4 end
				fy = mk("Frame", {Position = UDim2.fromOffset(bp.X, y), Size = UDim2.fromOffset(box.AbsoluteSize.X / s, h), BackgroundColor3 = c.cr, BackgroundTransparency = 0.05, BorderSizePixel = 0, Parent = ov}, {rc(10), sk(0.6, c.ac), pd(4, 4, 4, 4)})
				local ls = mk("ScrollingFrame", {Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 2, ScrollBarImageColor3 = c.a2, AutomaticCanvasSize = Enum.AutomaticSize.Y, CanvasSize = UDim2.new(), ScrollingDirection = Enum.ScrollingDirection.Y, Parent = fy}, {ll(0)})
				if #e.Options == 0 then tl({Text = "No Options", TextSize = 12, TextColor3 = c.dm, Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -10, 0, 30), Parent = ls}) end
				for n, s in e.Options do
					local sl = has(s)
					local b = bt({Size = UDim2.new(1, 0, 0, 30), BackgroundColor3 = c.ac, BackgroundTransparency = sl and 0.8 or 1, LayoutOrder = n, Parent = ls}, {rc(6)})
					tl({Text = s, FontFace = fs, TextSize = 12, Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -36, 1, 0), TextTruncate = Enum.TextTruncate.AtEnd, Parent = b})
					local ck = ig({Text = "check", TextColor3 = c.ac, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -8, 0, 0), Size = UDim2.fromOffset(16, 30), Visible = sl, Parent = b})
					b.MouseEnter:Connect(function() if uis.MouseEnabled then tw(b, {BackgroundTransparency = 0.88}) end end)
					b.MouseLeave:Connect(function() tw(b, {BackgroundTransparency = has(s) and 0.8 or 1}) end)
					b.Activated:Connect(function()
						if not mu then e:Set(s); close(); return end
						local v, i = e:Get(), table.find(e.v, s)
						if i then table.remove(v, i) else table.insert(v, s) end
						e:Set(v)
						ck.Visible = has(s)
						tw(b, {BackgroundTransparency = ck.Visible and 0.8 or 1})
					end)
				end
			end
			box.Activated:Connect(open)
			done(e)
			return e
		end

		function T:TextBox(r)
			r = r or {}
			local e, f = row("TextBox", r)
			local b, st = bx(f)
			b.ClipsDescendants = true
			local x = mk("TextBox", {BackgroundTransparency = 1, Position = UDim2.fromOffset(10, 0), Size = UDim2.new(1, -20, 1, 0), FontFace = fs, TextSize = 12, TextColor3 = wt, PlaceholderText = tostring(r.Placeholder or ""), PlaceholderColor3 = c.dm, TextXAlignment = Enum.TextXAlignment.Left, ClearTextOnFocus = false, Text = type(r.Default) == "string" and r.Default or "", Parent = b})
			e.v, e.ld = x.Text, tostring
			function e:Set(v)
				v = tostring(v)
				x.Text = v
				if v == e.v then return end
				e.v = v
				put(e, v)
				run(r.Callback, v)
			end
			x.Focused:Connect(function() tw(st, {Transparency = 0}) end)
			x.FocusLost:Connect(function()
				tw(st, {Transparency = 0.81})
				e:Set(x.Text)
			end)
			done(e)
			return e
		end

		local function kc(v)
			if v == nil then return nil end
			if typeof(v) == "EnumItem" and v.EnumType == Enum.KeyCode then return v end
			return false
		end

		function T:Keybind(r)
			r = r or {}
			local d = kc(r.Default)
			if d == false then error("Keybind Failed: Bad Key", 0) end
			local e, f = row("Keybind", r)
			local cb, st = bx(f, 0)
			cb.Size, cb.AutomaticSize = UDim2.fromOffset(0, 24), Enum.AutomaticSize.X
			pd(10, 10).Parent = cb
			local kl = tl({Text = "", FontFace = fj, TextSize = 11, Size = UDim2.new(0, 0, 1, 0), AutomaticSize = Enum.AutomaticSize.X, TextXAlignment = Enum.TextXAlignment.Center, Parent = cb})
			local wk = false
			e.v, e.sv, e.ld = d, function(v) return v and v.Name or false end, function(s) return type(s) == "string" and Enum.KeyCode[s] or nil end
			local function draw()
				kl.Text, kl.TextColor3 = wk and "..." or (e.v and e.v.Name:upper() or "NONE"), (wk or e.v) and wt or c.dm
				st.Transparency = wk and 0 or 0.81
			end
			draw()
			function e:Set(v)
				local k = kc(v)
				if k == false then error("Keybind Set Failed: Bad Key", 0) end
				if k == e.v then return end
				e.v = k
				draw()
				put(e, k)
			end
			cb.Activated:Connect(function()
				wk = not wk
				W.kw = wk
				draw()
			end)
			table.insert(W.cn, uis.InputBegan:Connect(function(i, gp)
				if i.UserInputType ~= kb then return end
				if wk then
					wk, W.kw = false, false
					if i.KeyCode == Enum.KeyCode.Backspace then e:Set(nil) elseif i.KeyCode ~= Enum.KeyCode.None then e:Set(i.KeyCode) end
					draw()
					return
				end
				if gp or not e.v or i.KeyCode ~= e.v or uis:GetFocusedTextBox() then return end
				run(r.Callback)
			end))
			done(e)
			return e
		end

		return T
	end

	function W:Interface(T)
		T:Section({Name = "Interface"})
		T:Dropdown({Name = "Effects", Options = {"Full", "Light", "Off"}, Default = W.fx, Flag = "fx", Callback = function(v) W:Effects(v or "Full") end})
		T:Slider({Name = "Glass Density", Min = 40, Max = 95, Step = 1, Default = math.round(W.gd * 100), Flag = "gd", Callback = function(v)
			W.gd = v / 100
			cr.BackgroundTransparency = 1 - W.gd
		end})
		T:Toggle({Name = "Boot Animation", Default = W.ba, Flag = "ba", Callback = function(v) W.ba = v end})
	end

	function W:Destroy()
		dead = true
		for _, x in W.cn do x:Disconnect() end
		W.cn = {}
		if W.hc then W.hc:Disconnect(); W.hc = false end
		save()
		sg:Destroy()
		if ge.__BkW == W then ge.__BkW = nil end
	end

	if an2() then boot(W.ag) else whole() end
	W.up()
	ge.__BkW = W
	return W
end

return L
end)()

local function bo()
	if ge.__SaeP then return nil, "Already On" end
	ge.__SaeP = true
	local li, tr = game:GetService("Lighting"), workspace.Terrain
	local function ko(d, k)
		k = k or "Enabled"
		d[k] = false
		d:GetPropertyChangedSignal(k):Connect(function() if d[k] then d[k] = false end end)
	end
	local function lf() if li.GlobalShadows then li.GlobalShadows = false end end
	lf()
	li:GetPropertyChangedSignal("GlobalShadows"):Connect(lf)
	local function kx(d) if d:IsA("PostEffect") then ko(d) end end
	for _, d in li:GetDescendants() do pcall(kx, d) end
	li.DescendantAdded:Connect(function(d) pcall(kx, d) end)
	local cu = tr:FindFirstChildOfClass("Clouds")
	if cu then pcall(ko, cu) end
	pcall(function() tr.WaterWaveSize, tr.WaterWaveSpeed, tr.WaterReflectance = 0, 0, 0 end)
	local function px(d)
		if d:IsA("ParticleEmitter") then
			d.Lifetime = NumberRange.new(0)
			ko(d)
		elseif d:IsA("Beam") or d:IsA("Trail") or d:IsA("Smoke") or d:IsA("Fire") or d:IsA("Sparkles") or d:IsA("Light") or d:IsA("Highlight") then
			ko(d)
		elseif d:IsA("Decal") then
			d.Transparency = 1
		elseif d:IsA("SurfaceAppearance") then
			task.defer(pcall, d.Destroy, d)
		elseif d:IsA("VideoFrame") then
			ko(d, "Playing")
			ko(d, "Visible")
		elseif d:IsA("BasePart") and d.Material ~= Enum.Material.Water then
			d.Material, d.Reflectance, d.CastShadow = Enum.Material.SmoothPlastic, 0, false
		end
	end
	workspace.DescendantAdded:Connect(function(d) pcall(px, d) end)
	task.spawn(function()
		for i, d in workspace:GetDescendants() do
			pcall(px, d)
			if i % 2000 == 0 then task.wait() end
		end
	end)
	local pg2 = lp:FindFirstChildOfClass("PlayerGui")
	if pg2 then
		for _, d in pg2:GetDescendants() do if d:IsA("VideoFrame") then pcall(px, d) end end
		pg2.DescendantAdded:Connect(function(d) if d:IsA("VideoFrame") then pcall(px, d) end end)
	end
	local ok, aa = pcall(function() return require(rs.Controllers.Game.Plots.ActiveAssetsController) end)
	if ok and type(aa) == "table" and type(aa.SetAllPetsHidden) == "function" then
		task.spawn(function()
			while ge.__SaeP do
				pcall(aa.SetAllPetsHidden, true)
				task.wait(5)
			end
		end)
	end
	local ui = game:GetService("UserInputService")
	ui.WindowFocusReleased:Connect(function() pcall(ru.Set3dRenderingEnabled, ru, false) end)
	ui.WindowFocused:Connect(function() pcall(ru.Set3dRenderingEnabled, ru, true) end)
	local function ax(d)
		if d:IsA("Accoutrement") or d:IsA("Clothing") or d:IsA("ShirtGraphic") or d:IsA("CharacterMesh") then task.defer(pcall, d.Destroy, d) end
	end
	local function cx(c)
		for _, d in c:GetDescendants() do pcall(ax, d) end
		c.DescendantAdded:Connect(function(d) pcall(ax, d) end)
	end
	local function pa(p)
		if p == lp then return end
		if p.Character then cx(p.Character) end
		p.CharacterAdded:Connect(cx)
	end
	for _, p in ps:GetPlayers() do pa(p) end
	ps.PlayerAdded:Connect(pa)
	if not ok then return nil, "Hide Pets Failed: No Controller" end
	return true
end

local function hx(lo2)
	local hs, ts = game:GetService("HttpService"), game:GetService("TeleportService")
	local function go2(f)
		local fe
		local cn = ts.TeleportInitFailed:Connect(function(p, _, m) if p == lp then fe = tostring(m) end end)
		local o3, e3 = pcall(f)
		if not o3 then fe = tostring(e3) end
		local t = os.clock()
		while not fe and os.clock() - t < 10 do task.wait(0.25) end
		cn:Disconnect()
		return fe == nil
	end
	while ge.__BkSae == st do
		local ok, r = pcall(function() return game:HttpGet(("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Asc&limit=100"):format(game.PlaceId), true) end)
		local o2, d = false, nil
		if ok then o2, d = pcall(hs.JSONDecode, hs, r) end
		local l = {}
		for _, v in o2 and type(d) == "table" and type(d.data) == "table" and d.data or {} do
			if v.id ~= game.JobId and type(v.playing) == "number" and type(v.maxPlayers) == "number" and v.playing < v.maxPlayers then l[#l + 1] = v end
		end
		if lo2 then
			table.sort(l, function(x, y) return x.playing < y.playing end)
		else
			for i = #l, 2, -1 do
				local j = math.random(1, i)
				l[i], l[j] = l[j], l[i]
			end
		end
		for _, v in l do
			if ge.__BkSae ~= st then return false, "Hop Failed: Stopped" end
			if go2(function() ts:TeleportToPlaceInstance(game.PlaceId, v.id, lp) end) then return true end
			task.wait(1)
		end
		if not lo2 and ge.__BkSae == st and go2(function() ts:Teleport(game.PlaceId, lp) end) then return true end
		task.wait(3)
	end
	return false, "Hop Failed: Stopped"
end

local W = L:Window({Title = "BAKHI HUB", Subtitle = "STEAL AN EGG v1.0 | YTB PHU ROBLOX", Config = `StealAnEgg/{lp.Name}`})
local pg = W:Tab({Name = "General", Icon = "egg"})
local function rk()
	local m, o = {}, {}
	for _, a in pairs(dr) do
		local r = type(a) == "table" and a.Rarity
		if type(r) == "table" and type(r._id) == "string" and not m[r._id] then
			m[r._id] = true
			o[#o + 1] = r
		end
	end
	table.sort(o, function(x, y) return (tonumber(x.Rank) or 0) < (tonumber(y.Rank) or 0) end)
	local n = {}
	for _, r in o do n[#n + 1] = r._id end
	return n
end

local function rs2(v)
	local t = {}
	for _, x in v or {} do t[x] = true end
	return t
end

local function an()
	local w = workspace:FindFirstChild("World") or workspace:FindFirstChild("__OBJECTS")
	local a = w and w:FindFirstChild("Areas")
	local g = a and a:FindFirstChild("GuardAreas")
	local o = {}
	for _, z in g and g:GetChildren() or {} do
		local b = z:FindFirstChild("Bounds")
		if b and b:IsA("BasePart") then o[#o + 1] = {z.Name, b.Position.X - b.Size.X / 2} end
	end
	table.sort(o, function(x, y) return x[2] < y[2] end)
	local n = {}
	for _, v in o do n[#n + 1] = v[1] end
	return n
end

local ra = rk()
pg:Section({Name = "Farm"})
local xe, xa
xa = pg:Dropdown({Name = "Select Area", Options = an(), Multi = true, Default = {}, Flag = "ar", Callback = function(v)
	st.az = rs2(v)
	if #v > 0 and xe then xe:Set({}) end
end})
xe = pg:Dropdown({Name = "Select Egg", Options = ra, Multi = true, Default = {}, Flag = "mr", Callback = function(v)
	st.mr = rs2(v)
	if #v > 0 and xa then xa:Set({}) end
end})
pg:Toggle({Name = "Auto Steal Egg", Default = false, Flag = "ae", Callback = function(v)
	if v then st.Start() else st.Stop() end
end})
local xp = pg:Toggle({Name = "Auto Place Egg", Default = true, Flag = "ape", Callback = function(v) st.ap = v == true end})
st.ap = xp.v == true
local xh = pg:Toggle({Name = "Auto Hatch Egg", Default = true, Flag = "ahe", Callback = function(v) st.ah = v == true end})
st.ah = xh.v == true
pg:Toggle({Name = "Pet Index", Default = false, Flag = "pix", Callback = function(v) st.pi = v == true end})
pg:Button({Name = "Leave Treadmill", Callback = function()
	local ok, wy = false, "Treadmill Failed: Not Mounted"
	if st.bt or tm() then ok, wy = lt() end
	lg(ok and "Treadmill Left" or tostring(wy))
	W:Notify({Title = "Leave Treadmill", Text = ok and "Treadmill Left" or tostring(wy), Error = not ok})
end})

pg:Section({Name = "Pet"})
pg:Dropdown({Name = "Sell Pet Rarity", Options = ra, Multi = true, Default = {}, Flag = "spr", Callback = function(v) st.sp = rs2(v) end})
pg:Toggle({Name = "Auto Sell Pet", Default = false, Flag = "asp", Callback = function(v) st.ps = v end})
pg:Section({Name = "Egg"})
pg:Dropdown({Name = "Sell Egg Rarity", Options = ra, Multi = true, Default = {}, Flag = "ser", Callback = function(v) st.se = rs2(v) end})
pg:Toggle({Name = "Auto Sell Egg", Default = false, Flag = "ase", Callback = function(v) st.es = v end})

local et = W:Tab({Name = "Event", Icon = "calendar-star"})
et:Section({Name = "Butterfly"})
local xb = et:Label({Text = bc()})
task.spawn(function()
	while ge.__BkSae == st do
		pcall(function() xb:Set(bc()) end)
		task.wait(1)
	end
end)
et:Toggle({Name = "Auto Butterfly", Default = false, Flag = "abf", Callback = function(v)
	st.bf = v == true
	st.bi += 1
	if st.bf then task.spawn(bg, st.bi) end
end})
et:Button({Name = "Teleport To Station", Callback = function()
	local ok, wy = bu()
	lg(ok and "At Station" or tostring(wy))
	W:Notify({Title = "Teleport To Station", Text = ok and "At Station" or tostring(wy), Error = not ok})
end})
et:Section({Name = "Race & Star"})
local xr = et:Label({Text = rs3()})
task.spawn(function()
	while ge.__BkSae == st do
		pcall(function() xr:Set(rs3()) end)
		task.wait(1)
	end
end)
et:Toggle({Name = "Auto Shooting Star", Default = false, Flag = "ass", Callback = function(v)
	st.ss = v == true
	st.sg += 1
	if st.ss then task.spawn(sq2, st.sg) end
end})
et:Toggle({Name = "Auto Race", Default = false, Flag = "arc", Callback = function(v)
	st.ra = v == true
	st.rg += 1
	if st.ra then task.spawn(rl, st.rg) end
end})
et:Section({Name = "Admin"})
et:Toggle({Name = "Auto Red Light Green Light", Default = false, Flag = "arl", Callback = function(v)
	st.gx = v == true
	st.gg += 1
	if st.gx then task.spawn(gq, st.gg, lc) end
end})
et:Toggle({Name = "Auto T-Rex Run", Default = false, Flag = "atx", Callback = function(v)
	st.tq = v == true
	st.th += 1
	if st.tq then task.spawn(gq, st.th, tc2) end
end})

local mi = W:Tab({Name = "Misc", Icon = "four-squares-grid"})
mi:Section({Name = "Player"})
mi:Toggle({Name = "Anti Stun", Default = false, Flag = "ast", Callback = function(v) su(v == true) end})
local xt = mi:Toggle({Name = "Anti Trap", Default = true, Flag = "atr", Callback = function(v) aq(v == true) end})
if xt.v then aq(true) end

local tp2 = W:Tab({Name = "Teleport", Icon = "person-teleport"})
tp2:Section({Name = "Server"})
for _, z in {{"Hop Server", false}, {"Hop Low Server", true}} do
	tp2:Button({Name = z[1], Callback = function()
		if st.hq then
			W:Notify({Title = z[1], Text = "Already Hopping"})
			return
		end
		st.hq = true
		W:Notify({Title = z[1], Text = "Hopping"})
		task.spawn(function()
			local ok, wy = hx(z[2])
			st.hq = false
			if not ok then W:Notify({Title = z[1], Text = tostring(wy), Error = true}) end
		end)
	end})
end

local tz = W:Tab({Name = "Setting", Icon = "gear"})
tz:Section({Name = "Game"})
tz:Button({Name = "FPS Booster", Callback = function()
	local ok, e = bo()
	W:Notify({Title = "FPS Booster", Text = ok and "On Until Rejoin" or e, Error = not ok and e ~= "Already On"})
end})
st.gr = true

W:Interface(tz)

local hd = lp:FindFirstChildOfClass("PlayerGui") and lp:FindFirstChildOfClass("PlayerGui"):FindFirstChild("HUD")
local hb = false
for _, n in {"GameHUD", "TradmilHud"} do
	local rb = hd and hd:FindFirstChild(n) and hd[n]:FindFirstChild("RightButtons")
	local eb = rb and rb:FindFirstChild("EggsButton")
	if eb then
		local o = rb:FindFirstChild("BaKhiButton")
		if o then o:Destroy() end
		local b = eb:Clone()
		for _, k in {"Notification", "ReadyNotification", "NightImage", "NightText", "GamepadGlyph"} do
			local x = b:FindFirstChild(k)
			if x then x:Destroy() end
		end
		b.Name, b.LayoutOrder = "BaKhiButton", 5
		b:SetAttribute("PressBound", nil)
		local gd2, s1, s2 = b:FindFirstChild("UIGradient"), b:FindFirstChild("UIStroke"), b:FindFirstChild("UIStrokeClr")
		if gd2 and gd2:IsA("UIGradient") then gd2.Color = ColorSequence.new(Color3.fromRGB(7, 16, 28), Color3.fromRGB(16, 58, 88)) end
		if s1 and s1:IsA("UIStroke") then s1.Color = Color3.fromRGB(3, 8, 14) end
		if s2 and s2:IsA("UIStroke") then s2.Color = Color3.fromRGB(79, 216, 255) end
		local im = b:FindFirstChild("ImageLabel")
		if im then
			im.ImageTransparency = 1
			local f = L.Reactor(im, 40)
			f.AnchorPoint, f.Position, f.Size = Vector2.new(0.5, 0.5), UDim2.fromScale(0.5, 0.5), UDim2.fromScale(0.7, 0.7)
			Instance.new("UIAspectRatioConstraint").Parent = f
		end
		b.Parent = rb
		hb = true
		st.cn[#st.cn + 1] = b.Activated:Connect(function() if W.op then W:Hide() else W:Show() end end)
		task.spawn(pcall, function() require(rs.Client.UI.VFX.ButtonFX)(b) end)
	end
end
if hb and W.Gui:FindFirstChild("Float") then W.Gui.Float.Visible = false end
