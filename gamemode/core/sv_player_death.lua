function GM:PlayerDeath( victim, inflictor, attacker )
	rp.dropMoney(0, victim, "death")
end