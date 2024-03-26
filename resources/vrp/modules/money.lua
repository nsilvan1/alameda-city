-----------------------------------------------------------------------------------------------------------------------------------------
-- USERBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.userBank(user_id,mode)
	local user_id = parseInt(user_id)
	local bankInfos = vRP.query("bank/getInfos",{ user_id = user_id, mode = mode })
	return bankInfos[1] or false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.addBank(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		vRP.execute("characters/addBank",{ id = parseInt(user_id), bank = amount })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.delBank(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		vRP.execute("characters/removeBank",{ id = parseInt(user_id), bank = amount })
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getBank(user_id)
	local consult = vRP.getInformation(user_id)
	if consult[1] then
		return parseInt(consult[1]["bank"])
	end

	return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- GETFINES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.getFines(user_id)
   local consult = vRP.getInformation(user_id)
    if consult[1] then
        return parseInt(consult[1]["fines"])
    end

    return 0
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- ADDFINES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.addFines(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		local user_id = parseInt(user_id)
		vRP.execute("characters/addFines",{ id = user_id, fines = amount })

		if vRP.userInfos[user_id] then
			vRP.userInfos[user_id]["fines"] = vRP.userInfos[user_id]["fines"] + amount
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- DELFINES
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.delFines(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		local user_id = parseInt(user_id)
		vRP.execute("characters/removeFines",{ id = user_id, fines = amount })

		if vRP.userInfos[user_id] then
			vRP.userInfos[user_id]["fines"] = vRP.userInfos[user_id]["fines"] - amount

			if vRP.userInfos[user_id]["fines"] < 0 then
				vRP.userInfos[user_id]["fines"] = 0
			end
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTGEMS
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.paymentGems(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		local user_id = parseInt(user_id)
		if vRP.userInfos[user_id] then
			if vRP.userGemstone(vRP.userInfos[user_id]["steam"]) >= amount then
				vRP.execute("accounts/removeGems",{ steam = vRP.userInfos[user_id]["steam"], gems = amount })
				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTBANK
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.paymentBank(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		local consult = vRP.getInformation(user_id)
		if consult[1] then
			if consult[1]["bank"] >= amount then
				vRP.execute("characters/removeBank",{ id = parseInt(user_id), bank = amount })

				local source = vRP.userSource(user_id)
				if source then
					TriggerClientEvent("itensNotify",source,{ "pagou","dollars",parseFormat(amount),"Dólares" })
				end

				return true
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- PAYMENTFULL
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.paymentFull(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		if vRP.tryGetInventoryItem(user_id,"dollars",amount,true) then
			return true
		else
			local consult = vRP.getInformation(user_id)
			if consult[1] then
				if consult[1]["bank"] >= amount then
					vRP.execute("characters/removeBank",{ id = parseInt(user_id), bank = amount })

					local source = vRP.userSource(user_id)
					if source then
						TriggerClientEvent("itensNotify",source,{ "pagou","dollars",parseFormat(amount),"Dólares" })
					end

					return true
				end
			end
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- WITHDRAWCASH
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.withdrawCash(user_id,amount)
	if parseInt(amount) > 0 then
		local amount = parseInt(amount)
		if vRP.getBank(user_id) >= amount then
			vRP.generateItem(user_id,"dollars",amount,true)
			vRP.execute("characters/removeBank",{ id = parseInt(user_id), bank = amount })

			return true
		end
	end

	return false
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- SMARTPHONE:BANK
-----------------------------------------------------------------------------------------------------------------------------------------
vRP.getBankMoney = vRP.getBank
vRP.giveBankMoney = vRP.addBank
vRP.removeBankMoney = vRP.delBank
-----------------------------------------------------------------------------------------------------------------------------------------
-- SMARTPHONE:SETBANKMONEY
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.setBankMoney(user_id, amount)
    local dif = amount - vRP.getBank(user_id)
    vRP.execute("characters/addBank", { id = user_id, bank = dif })
end