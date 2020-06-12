-- ModalMgr Spoon must be loaded explicitly, because this repository heavily relies upon it.
hs.loadSpoon("ModalMgr")

-- Define default Spoons
hspoon_list = {"WinWin"}

-- Load those Spoons
for _, v in pairs(hspoon_list) do
  hs.loadSpoon(v)
end

----------------------------------------------------------------------------------------------------
-- resizeM modal environment
if spoon.WinWin then
  spoon.ModalMgr:new("resizeM")
  local cmodal = spoon.ModalMgr.modal_list["resizeM"]
  cmodal:bind('', 'escape', 'Deactivate Resize Windows', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
  cmodal:bind('', 'Q', 'Deactivate Resize Windows', function() spoon.ModalMgr:deactivate({"resizeM"}) end)
  cmodal:bind('', 'tab', 'Toggle Cheatsheet', function() spoon.ModalMgr:toggleCheatsheet() end)

  cmodal:bind('', 'A', '←', function() spoon.WinWin:stepMove("left") end, nil, function() spoon.WinWin:stepMove("left") end)
  cmodal:bind('', 'D', '→', function() spoon.WinWin:stepMove("right") end, nil, function() spoon.WinWin:stepMove("right") end)
  cmodal:bind('', 'W', '↑', function() spoon.WinWin:stepMove("up") end, nil, function() spoon.WinWin:stepMove("up") end)
  cmodal:bind('', 'S', '↓', function() spoon.WinWin:stepMove("down") end, nil, function() spoon.WinWin:stepMove("down") end)

  cmodal:bind('', 'H', '←', function() spoon.WinWin:moveAndResize("halfleft") end)
  cmodal:bind('', 'L', '→', function() spoon.WinWin:moveAndResize("halfright") end)
  cmodal:bind('', 'K', '↑', function() spoon.WinWin:moveAndResize("halfup") end)
  cmodal:bind('', 'J', '↓', function() spoon.WinWin:moveAndResize("halfdown") end)

  cmodal:bind('', 'Y', '↖', function() spoon.WinWin:moveAndResize("cornerNW") end)
  cmodal:bind('', 'O', '↗', function() spoon.WinWin:moveAndResize("cornerNE") end)
  cmodal:bind('', 'U', '↙', function() spoon.WinWin:moveAndResize("cornerSW") end)
  cmodal:bind('', 'I', '↘', function() spoon.WinWin:moveAndResize("cornerSE") end)
  
  cmodal:bind('', 'F', '全屏', function() spoon.WinWin:moveAndResize("fullscreen") end)
  cmodal:bind('', 'C', '居中', function() spoon.WinWin:moveAndResize("center") end)
  -- cmodal:bind('', '=', 'Stretch Outward', function() spoon.WinWin:moveAndResize("expand") end, nil, function() spoon.WinWin:moveAndResize("expand") end)
  -- cmodal:bind('', '-', 'Shrink Inward', function() spoon.WinWin:moveAndResize("shrink") end, nil, function() spoon.WinWin:moveAndResize("shrink") end)

  cmodal:bind('shift', 'H', '←←', function() spoon.WinWin:stepResize("left") end, nil, function() spoon.WinWin:stepResize("left") end)
  cmodal:bind('shift', 'L', '→→', function() spoon.WinWin:stepResize("right") end, nil, function() spoon.WinWin:stepResize("right") end)
  cmodal:bind('shift', 'K', '↑↑', function() spoon.WinWin:stepResize("up") end, nil, function() spoon.WinWin:stepResize("up") end)
  cmodal:bind('shift', 'J', '↓↓', function() spoon.WinWin:stepResize("down") end, nil, function() spoon.WinWin:stepResize("down") end)
  
  cmodal:bind('', 'left', 'Move to Left Monitor', function() spoon.WinWin:moveToScreen("left") end)
  cmodal:bind('', 'right', 'Move to Right Monitor', function() spoon.WinWin:moveToScreen("right") end)
  cmodal:bind('', 'up', 'Move to Above Monitor', function() spoon.WinWin:moveToScreen("up") end)
  cmodal:bind('', 'down', 'Move to Below Monitor', function() spoon.WinWin:moveToScreen("down") end)
  cmodal:bind('', 'space', 'Move to Next Monitor', function() spoon.WinWin:moveToScreen("next") end)
  
  cmodal:bind('', '`', 'Center Cursor', function() spoon.WinWin:centerCursor() end)

  -- Register resizeM with modal supervisor
  hsresizeM_keys = hsresizeM_keys or {"alt", "R"}
  if string.len(hsresizeM_keys[2]) > 0 then
    spoon.ModalMgr.supervisor:bind(hsresizeM_keys[1], hsresizeM_keys[2], "Activate Resize Windows", function()
      -- Deactivate some modal environments or not before activating a new one
      spoon.ModalMgr:deactivateAll()
      -- Show an status indicator so we know we're in some modal environment now
      spoon.ModalMgr:activate({"resizeM"}, "#B22222")
    end)
  end
end

----------------------------------------------------------------------------------------------------
-- Register Hammerspoon console
hsconsole_keys = hsconsole_keys or {"alt", "Z"}
if string.len(hsconsole_keys[2]) > 0 then
  spoon.ModalMgr.supervisor:bind(hsconsole_keys[1], hsconsole_keys[2], "Toggle Hammerspoon Console", function() hs.toggleConsole() end)
end

----------------------------------------------------------------------------------------------------
-- Finally we initialize ModalMgr supervisor
spoon.ModalMgr.supervisor:enter()
