// Give the players beggars item attributes on their primary weapon

// Works mostly fine but may sputz out if the player is in the process of reloading 
// when you give them the attributes. Fixing this is an exercise left to the reader.
// Also, does not work on Cow Mangler unfortunately. Also left to the reader to implement. 
function doSetBeggars()
{
    local ply = activator
    if (!ply || !ply.IsPlayer() || (ply.GetTeam() == 1))
    {
        return
    }

    // Get primary weapon
    local weapon = NetProps.GetPropEntityArray(ply, "m_hMyWeapons", 0)

    // TODO: check if it's a rocket launcher or original first. Mangler may be too far gone

    // Clear primary ammo. 
    // TODO: also try and clear reloading status too because that messes with stuff a little
    NetProps.SetPropInt(weapon, "m_iClip1", 0)
    
    // Add beggars attributes
    weapon.AddAttribute("fire rate bonus HIDDEN", 0.3, -1)
    weapon.AddAttribute("auto fires full clip", 1, -1)
    weapon.AddAttribute("can overload", 1, -1)
    weapon.AddAttribute("reload time increased hidden", 1.3, -1)
    weapon.AddAttribute("clip size penalty HIDDEN", 0.75, -1)
    //weapon.AddAttribute("projectile spread angle penalty", 3, -1) // comedy
    weapon.AddAttribute("no primary ammo from dispensers while active", 1, -1)
    weapon.AddAttribute("blast radius decreased", 0.8, -1)
}
