-----------------------------------------------------------
-- LUA Hearts of Iron 3 Argentina File
-- Created By: Dr Johnson 04/07/11
-----------------------------------------------------------

local P = {}
AI_ARG = P

function P.Call_ForeignMinister_Tick(minister)
	local ministerTag = minister:GetCountryTag()
	local ministerCountry = ministerTag:GetCountry()

	if not(ministerCountry:HasFaction()) then
		local loAction = CInfluenceAllianceLeader(ministerTag, CCurrentGameState.GetFaction("allies"):GetFactionLeader())
			
		if loAction:IsSelectable() then
			minister:GetOwnerAI():PostAction(loAction)
		end
	end
end

function P.DiploScore_InviteToFaction(score, ai, actor, recipient, observer)		
	local year = ai:GetCurrentDate():GetYear()
	local month = ai:GetCurrentDate():GetMonthOfYear()
	local day = ai:GetCurrentDate():GetDayOfMonth()

	if year >= 1945 and month >= 3 and day >= 27 then

		if tostring(actor:GetCountry():GetFaction():GetTag()) == "allies" then
			score = score + 100
		end

		if tostring(actor:GetCountry():GetFaction():GetTag()) == "axis" then
			score = score - 100
		end

		if tostring(actor:GetCountry():GetFaction():GetTag()) == "comintern" then
			score = score - 100
		end

	else

		if tostring(actor:GetCountry():GetFaction():GetTag()) == "allies" then
			score = score - 100
		end

		if tostring(actor:GetCountry():GetFaction():GetTag()) == "axis" then
			score = score - 100
		end

		if tostring(actor:GetCountry():GetFaction():GetTag()) == "comintern" then
			score = score - 100
		end
	end
	return score
end
function P.IndustrialTechs(voTechnologyData)
	local ignoreTech = {
			{"monumental_architecture", 0},
			{"gigant_infrastructure_projects", 0},
			};

	local preferTech = {
		};
		
	return ignoreTech, preferTech
end

return AI_ARG