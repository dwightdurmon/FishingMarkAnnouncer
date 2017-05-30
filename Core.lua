local FishingMarkAnnouncer_Version = GetAddOnMetadata("FishingMarkAnnouncer", "Version");
local FishingMarkAnnouncer_Text = nil

FishingMarkAnnouncer = LibStub("AceAddon-3.0"):NewAddon("FishingMarkAnnouncer", "AceConsole-3.0", "AceEvent-3.0")

-- Below are chat commands for future use / options.
--FishingMarkAnnouncer:RegisterChatCommand("fishingmarkannouncer", "ShowFishingMarkAnnouncer")
--FishingMarkAnnouncer:RegisterChatCommand("fma", "ShowFishingMarkAnnouncer")

function FishingMarkAnnouncer:OnInitialize()
	-- Code that you want to run when the addon is first loaded goes here.
	-- Hooking Chat Loot messages so we can look for loot messages and pass it to the ProcessMessage function.
	self:RegisterEvent("CHAT_MSG_LOOT", "ProcessMessage")
end

function FishingMarkAnnouncer:OnEnable()
    -- Called when the addon is enabled
	FishingMarkAnnouncer:Print("Version " .. FishingMarkAnnouncer_Version .. " loaded.")
end

function FishingMarkAnnouncer:OnDisable()
-- Called when the addon is disabled
end

function FishingMarkAnnouncer:ProcessMessage(msgtype, message, sender, language, channelString, target, flags, unknownA, channelNumber, channelName, unknownB, counter)
-- Called when the a loot message is found
	if (string.find(message,"Mark of Aquaos") ~= nil) then
		-- Yay, we found the loot.  Now let's see whether or not to announce.
		if IsInRaid() then
			-- We are in a raid, let's announce.
			-- FishingMarkAnnouncer:Print("RAID: " .. target .. " received a Mark of Aquaos!") -- DEBUG
			SendChatMessage("Fishing Mark Announcer: " .. target .. " received a Mark of Aquaos!" ,"RAID")
		elseif IsInGroup() then 
			-- We are in a party, let's announce.
			--FishingMarkAnnouncer:Print("PARTY: " .. target .. " received a Mark of Aquaos!") -- DEBUG
			SendChatMessage("Fishing Mark Announcer: " .. target .. " received a Mark of Aquaos!" ,"PARTY")
	 	end
		-- We're not in a group, so we won't do anything.
 	end
 	-- The loot wasn't a Mark of Aquaos, so we won't do anything.
end