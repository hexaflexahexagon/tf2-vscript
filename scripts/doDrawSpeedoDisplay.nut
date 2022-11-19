// Find `game_text` with targetname `text_output` that already exists on the map.
// This could be refactored to use `SpawnEntityFromTable()` if you'd like instead.
SPEEDO_GAMETEXT <- Entities.FindByName(null, "text_output")

// Draw speed on screen. Optionally, in split H/V/A form. Must pass in a
// handle to player entity that speed should be drawn for. Best experienced
// when running every tick from another function. 
function doDrawSpeedoDisplay(player)
{
    // Calc horizontal vel, turn it into a string to display
    local velH = player.GetAbsVelocity().Length2D()
    local velV = abs(player.GetAbsVelocity().z)
    local velA = player.GetAbsVelocity().Length()
    
    local info = ""
    // Draw 3 lines, one per speedo type
    info += "H: " + floor(velH).tostring() + " u/s"
    info += "\nV: " + floor(velV).tostring() + " u/s"
    info += "\nA: " + floor(velA).tostring() + " u/s"

    // print using game_text entity
    SPEEDO_GAMETEXT.__KeyValueFromString("message", info)
    EntFireByHandle(SPEEDO_GAMETEXT, "Display", "", 0.0, player, player)

    // print to chat
    //ClientPrint(player, 3, info)
}
