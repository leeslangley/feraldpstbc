local Tinkr = ...
local Routine = Tinkr.Routine
local player = 'player' 
local target = 'target' 
-- Lees feral.
-- Once automatically loaded, enable in-game with
-- /routine load feral
Routine:RegisterRoutine(function()
local ep = power(PowerType.Energy)
local cp = GetComboPoints('player', 'target') 
    local function do_combat() 
    -- don't dismount us
    if mounted() then return 
    end
     -- Feral Cat Form Force
  if UnitExists and not buff(768) and castable(768) then
    return cast(768)
  end 
  

    -- don't spam on nothing
    if not UnitExists("target") then return end

    -- don't spam on friendly or other
    if not UnitCanAttack("player", "target") then return end

   -- Combo point Rip finisher
       if cp  >= 2 and ep > 30 and not debuff(9896,'target') then
        return cast(9896)
       end

  --  Bite
  if cp  >= 1 and ep > 35 and debuff(9896,'target') then
    return cast(31018)
        end

   -- Tigers Fury
   -- if combat() and ep > 30 and castable then
    -- return cast(9846)
   -- end
-- Regrowth
    if health() <= 35 and castable(9858) then
        return cast(9858)

    end

-- Mangle opener
    if ep > 45 and castable(33982) and spellInRange(33982) then
        return cast(33982)
    end

end 

local function do_resting() 

    -- MOTW buffing
    if not buff(9885,'player') then
        return cast(9885)
       end
-- Stealth not in combat
     if UnitExists and alive('target') and not buff(9913, 'player') and castable(9913) then
        return cast(9913)
    end
    -- Pounce
    if UnitExists('target')  and spellInRange(9827) and castable(9827) then
        return cast(9827)
    end
end 

  if UnitAffectingCombat('player') then 
    do_combat() 
    return 
  else 
    do_resting()
    return 
  end 
-- the .. stuff is dead spaces. 
end, Routine.Classes.Druid, 'Langsten')
