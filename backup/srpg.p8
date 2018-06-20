pico-8 cartridge // http://www.pico-8.com
version 16
__lua__

palt(10, true)
palt(0,false)
mage = {}
mage.x = 32
mage.y = 16
mage.sprite = 1


bard = {}
bard.x = 48
bard.y = 16
bard.sprite = 2


paly = {}
paly.x = 64
paly.y = 16
paly.sprite = 3


priest = {}
priest.x = 80
priest.y = 16
priest.sprite = 4


manager = {}
manager.x = mage.x
manager.y = mage.y
manager.sprite = 16
manager.speed = 8


characters = {}
characters[1] = mage
characters[2] = bard
characters[3] = paly
characters[4] = priest

selection = false
debug = {}
debug.x = 0
debug.y = 0
debug.sprite=mget((6),(2))
characterselected = {}

function _init()
 cls()
 map(0,0,0,0,16,16)
 spr(manager.sprite, manager.x, manager.y)
 setstage()
end


function setstage()

 spr(mage.sprite, mage.x, mage.y)
 spr(bard.sprite, bard.x, bard.y)
 spr(paly.sprite, paly.x, paly.y)
 spr(priest.sprite, priest.x, priest.y)
end


function oncharacter(o)
 debug.x = manager.x
 debug.y = manager.y
 sprite = mget(manager.y,manager.x)
 debug.sprite = sprite
 if (sprite == o.sprite) then
  characterselected = o
  selection = true
 end
end
function move(o)
debug = characterselected
 if(o.sprite == characterselected.sprite) then

  o.x = manager.x
  o.y = manager.y
 end
end
function movecharacter()
selection = false
foreach(characters,move)
end

function _update()

   if btnp(0) then
     manager.x -= manager.speed
   end
   if btnp(1) then 
     manager.x += manager.speed

   end
   if btnp(2) then 
     manager.y -= manager.speed

   end
   if btnp(3) then 
     manager.y += manager.speed
   end

   if(selection) then
    if(btnp(4)) then
     movecharacter()
     //characterselected = {}
    end
   else
    if(btnp(4)) then

      //foreach(characters,oncharacter)
    end
   end

end
function _draw()
  cls()

  map(0,0,0,0,16,16)
  spr(manager.sprite, manager.x, manager.y)
  setstage()
  
end
__gfx__
aaaaaaaaaaa000aaaaa000aaaaa000aaaaa000aaf00000000000000faa0000aaaaaaaaaaaaaaaaaa000000000000000000000000000000000000000000000000
aaaaaaaaa009990aaa08880aa006660aaa01110a0555000000055500a0667c0aaaa000aaa00000aa000000000000000000000000000000000000000000000000
aaaaaaaa08099f90a0888f8004466f60aa0441600550111111100550aa060c0aaa07b30a0282880a000000000000000000000000000000000000000000000000
aaaaaaaa080fff90a088ff80046fff60008444600501000001111050a0666caaa0bb333002882880000000000000000000000000000000000000000000000000
aaaaaaaa0800e290043f1f300f6616600999886005004422201111000825510a0b0b033000090900000000000000000000000000000000000000000000000000
aaaaaaaa0f2ee20a0f44330a04866680098928400504444442011100082665000b33331002299920000000000000000000000000000000000000000000000000
aaaaaaaa082e2220a041f3300408680a0999220a0500444002011100082505000033110002888880000000000000000000000000000000000000000000000000
aaaaaaaa00000000000000000000000000000000050004004201100000000000a000000aa000000a000000000000000000000000000000000000000000000000
88aaaa88a0a000aaaaa000aaaaa000aaaaa0000a0500222042010200aa0000aaaaa000aa00000000000000000000000000000000000000000000000000000000
8aaaaaa80809990aaa08880a0446660aaa0111600022244444200200a066770aaa07b30a00000000000000000000000000000000000000000000000000000000
aaaaaaaa08099f90a0888f8004666f60aa0441600000444444222200aa060c0aa0bbb33000000000000000000000000000000000000000000000000000000000
aaaaaaaa080fff90a088ff800f6fff600999446049f0044222222050a0666caa0b0b033000000000000000000000000000000000000000000000000000000000
aaaaaaaa0f20e290043f1f300466166009898840499f00200222005008255c0a0bbb333000000000000000000000000000000000000000000000000000000000
aaaaaaaa082ee20a0f443330048666800999280a0009902222228050082661000b33331000000000000000000000000000000000000000000000000000000000
8aaaaaa8a00e2220a041f30aa008680aa002220a2809900088888800082505000033110000000000000000000000000000000000000000000000000000000000
88aaaa8800000000000000000000000000000000f20440000000000f00000000a000000a00000000000000000000000000000000000000000000000000000000
aaaaaaaaf00000000000000ff00000000000000ff00600000000000f000000000000000000000000000000000000000000000000000000000000000000000000
a88aa88a0555099990099f0005550000005555000506666660505500000000000000000000000000000000000000000000000000000000000000000000000000
a8aaaa8a055099ff90c099f005ccc888880555500550655566060550000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa05099ff9990c099405c8c8888880cc500506555666666600000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa050999990990c0940cc8c8880888c0500506666606560550000000000000000000000000000000000000000000000000000000000000000000000000
a8aaaa8a00999000409900940088c000408cc0500066600040556050000000000000000000000000000000000000000000000000000000000000000000000000
a88aa88a09900fff40f99094088ccf44408cc4000660044440650000000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa000fffff40f00094000fffff4080440006004f0040604000000000000000000000000000000000000000000000000000000000000000000000000000
22aaaa2200f0ff0f4094409400ffffff40844050004cffcf40644050000000000000000000000000000000000000000000000000000000000000000000000000
2aaaaaa20040440ff40440940000f000f404400000fffffff4044000000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa00ffffffff440094004444ffff4408000040000ff0600600000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa00fffff0ff40099400ffff00ff4008000006666006600600000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa00fff00ff402099400fff000f40300500066006666080050000000000000000000000000000000000000000000000000000000000000000000000000
aaaaaaaa020fffff00222090030fffff003330500050550660888050000000000000000000000000000000000000000000000000000000000000000000000000
2aaaaaa200e00000e022220003300000333333000806666660888800000000000000000000000000000000000000000000000000000000000000000000000000
22aaaa22f00000000000000ff00000000000000ff00000000000000f000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbb222222222222222222222222bb3b444222222444444bbbb3bbb3bbb4bbbbb3bb3bb4444b33bbbbbbbbbbbbbbbbbbb3bbbbb33bbbbbbbb3bb00000000
bbbbbbbb444444424444444442444422b44444b44444444444444444bb44424444444444444444442444444bbbbb3bbbbbbbbbbbbbbbbbbbbbbbbbbb00000000
bbbbbbbb4444444444444444444444424ccc2999424299944992cc1cb4cc44cccccccccccccccccccccccc43bbbbb444bb4b3bbbbbb4bbbbb3bbbbbb00000000
bbbbbbbb44fffff4fffffffff4fff444cc1cc22222222222222cccccb4cccccccccccc1ccccccccccccccc2bb3bb44444444bb4444bbbb3b4444b44400000000
bbbbbbbb44ffffffffffffffffffff44cccc2444424444444422cccc34ccc1c1cc1cc111cccccc11cc2ccc44bbb4444444444b444f4bbbbb4444444400000000
bbbbbbbb44ffffffffffffffffffff421cc1224444444444444411c1bb4ccc11cc1112111cc12111c11ccc44bbb4f44f44f444444444bbbb44444f4400000000
bbbbbbbb44ffffffffffffffffffff42111129449994994994921111b4ccc11cc111111111c11c111111cc4bb3bb444444444444f424bb3b44f4444400000000
bbbbbbbb44ffffffffffffffffffff441c1112222222222222211121b2cc121111111111111111111111cc4bbbb4444444444f444444bbbb4444444400000000
bbbbbbbb44ffffffffffffffffffff4411112424244444444442cc11b4cc111111111111111111111c11cc4bbbbbb444f44442444444bbbb44444f4400000000
bbbbbbbb44ffffffffffffffffffff44111144444444444444441111b4cc112c1111111111c1111111111c4bbb3b44444444444443fbbbbb4444444400000000
bbbbb3bb44ffffffffffffffffffff441cc1294994949929949211c134cc1c1111ccc111111111112111cc43bbb4444444444444444bb3bb4f44444400000000
bbbbb3bb44ffffffffffffffffffff44ccccc22222224222222ccccc344cccc11111111111111111111ccc4bbbbbbb4444444444444bbbbb4444444400000000
b3bbbbbb44ffffffffffffffffffff44cc1c2444442444444442c1ccb42ccc1111111111111111111111cc4bbbbb444444444f4444444bbb444b444400000000
bbbbbbbb44ffffffffffffffffffff44cccc2499444444429944ccccb4ccc11111111c11c11111111111cc4bbbbb44b4444444ff444bbbbbbbbbbbbb00000000
bbbbbbbb44ffffffffffffffffffff442424244244422992224224b4b4cccc11111111111111cc2111111c43b3b444444444444444444bbbbbbbbb3b00000000
bbbbbbbb44ffffffffffffffffffff44bbbbbbb44444422244bbbbbbbb4c1c1111111111111111111111cc4b3bbb4f44f4444444444b4bbbbb3bbbbb00000000
bbbbbbbb44ffffffffffffffffffff44bb000bbbbbbb00000000bbbbb4cc11111c111111111111c11c11cc4bbbbb4444444444444444bbbb4444444400000000
b3bbb3bb444fffffffffffffffffff42b03bb00bbb003bbbbb3300bbb4cc111c11111c111111111111111c4bbbbbbb4444404044b444b33b444f4f4400000000
bbbb33bb2444ffffffffffffffffff44b0bbb30bb03bbbbbb3b33b0bb44c1c11111111111c1111112111cc43bbbbb442404002444444bbbb4444444400000000
bb3bbbbb44ffffffffffffffffffff440b1bb3b0b0bb1bbbbb333330b44cccc111111111cc1111c1111ccc4bbbb4b444400004044444bbbb4244424400000000
bbbbbb3b44ffff4ffffffffffffff44403b13b300bbb11bbb3331330bb42cccccccc21ccc111ccccc1ccc44bbbbbb444f4000444444bbbbbbb44444400000000
bbbbbbbb444ff44ffffffffffffff4440b3bb3100b3111bb3b3331b0bb3321cccccccccccccccccccc44444bbbbb44f44000f40444444b3bbbbb444400000000
bbbbb3bb24444444444444444444442200b33100031bbbbbb3b33b10bbbb34444444444444cccc4444bb4433b33bb4f44444444444424bbbbbbbb44400000000
bbbbbbbb242222444444444444224442b000000b033b3b3b3b3333b0bbbbbbb3bbbbb3bbbb4422bb3bbbbbbbbbbbb444444444444f444bbbb3bb424400000000
bbbbbbbb22222222ffffffffffffffffbbbbbbbb0313b3b3b3133310111ccc2bbb4ccc11c11111111111c111bbbb4444444444444444bbbb444bbb3b00000000
bbbbbb3b44442444ffffffffffffffffbb0000bb033133333311313011cccc4b34cc1cc11111211111111111b3bbb44f44f44444ff44b3bb4444bbbb00000000
bbbb4b3b44444444ffffffffffffffffb066650bb00131333111100b11cc1cc4c2cccc1111111c1111111111bbbb444444444f444444bbbb4444b2bb00000000
bb444343fff4444fffffffffffffffffb061150bbb041111144130bb111ccccccccc1211111111ccccc111c1bbbb24f4444444444444b2bb424444bb00000000
bbb444bbffff44fffffffffffffffff40611550bbb01444441140bbb111c1cccccc1111111c1c1ccccc11cc1bb3bbb44f444bb44444bbbbb4444444300000000
bb34bbbbffffffff44444ff4fff444f405555510bbb01444411440bb111111cccc11c11c1111ccc4cccccc11bbbbbbb4bbbbbbbb44b4bb3b444f444400000000
b33bbbbbffffffff444444444444444400015000bb0111144144440b11c111111111111111cccc4344ccc111bbbbbbbbbbbbbb4bbbbbbbbb4444444400000000
bbbbbbbbffffffff4222444444422444b000000bb000000000000000111111111111111111ccc42bb42cc111bbbbbb3bbbbbbbbbb3bbbbbb44444f4400000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606660666006600660000066600660066000006660066000006660066006600660600066600000666066006660666006606660000060606660666060600000
60606060600060006000000060006000600000000600606000000600606060006000600060000000600060600600060060606060000060600600600060600000
66606600660066606660000066006660600000000600606000000600606060006000600066000000660060600600060060606600000060600600660060600000
60006060600000600060000060000060600000000600606000000600606060606060600060000000600060600600060060606060000066600600600066600000
60006060666066006600000066606600066000000600660000000600660066606660666066600000666066606660060066006060000006006660666066600000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606000666000006660660066606660666000006660066000006660066006600660600066600000666060606000600006600660666066606660660000000000
60606000060006006000606006006000606000000600606000000600606060006000600060000000600060606000600060006000606060006000606000000000
66606000060066606600606006006600660000000600606000000600606060006000600066000000660060606000600066606000660066006600606000000000
60606000060006006000606006006000606000000600606000000600606060606060600060000000600060606000600000606000606060006000606000000000
60606660060000006660606006006660606000000600660000000600660066606660666066600000600006606660666066000660606066606660606000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606000666000006660606000000660666000000660666066606000000006000000666006600000666066600660666006006060666066600000000000000000
60606000060006006000606000006060606000006000060060606000000060600000060060600000600060606000060060606060060006000000000000000000
66606000060066606600666000006060660000006000060066006000666060600000060060600000660066606660060060606060060006000000000000000000
60606000060006006000006000006060606000006000060060606000000066000000060060600000600060600060060066006060060006000000000000000000
60606660060000006000006000006600606000000660060060606660000006600000060066000000600060606600060006600660666006000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cc0ccc0ccc00000ccc0ccc00cc00cc0ccc00000ccc0c0c0ccc00000ccc00cc0ccc00000ccc00cc0ccc0ccc00000ccc0cc00ccc00cc000000000000000000000
c000c000c0000000c0c00c00c000c0c0c0c000000c00c0c00c000000c000c0c0c0c00000ccc0c0c0c0c0c00000000c00c0c0c000c0c000000000000000000000
ccc0cc00cc000000ccc00c00c000c0c0ccc000000c000c000c000000cc00c0c0cc000000c0c0c0c0cc00cc0000000c00c0c0cc00c0c000000000000000000000
00c0c000c0000000c0000c00c000c0c0c0c000000c00c0c00c000000c000c0c0c0c00000c0c0c0c0c0c0c00000000c00c0c0c000c0c000000000000000000000
cc00ccc0ccc00000c000ccc00cc0cc00ccc00c000c00c0c00c000000c000cc00c0c00000c0c0cc00c0c0ccc00000ccc0c0c0c000cc0000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0cc0ccc00000c0c0ccc00cc0ccc0ccc000000000c0c0c0c0c0c00000ccc0ccc00cc00cc00000ccc000000cc00cc0ccc000000000000000000000000000000000
c0c0c0c00000c0c00c00c0000c000c000c000000c0c0c0c0c0c00000c0c00c00c000c0c00000c0c00000c000c0c0ccc000000000000000000000000000000000
c0c0cc000000c0c00c00ccc00c000c0000000000c0c0c0c0c0c00000ccc00c00c000c0c0ccc0ccc00000c000c0c0c0c000000000000000000000000000000000
c0c0c0c00000ccc00c0000c00c000c000c000000ccc0ccc0ccc00000c0000c00c000c0c00000c0c00000c000c0c0c0c000000000000000000000000000000000
cc00c0c000000c00ccc0cc00ccc00c0000000000ccc0ccc0ccc00c00c000ccc00cc0cc000000ccc00c000cc0cc00c0c000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000770070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000707007707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000077077707070777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000700070707070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000777077707070770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000007070707770700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000770070700700777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66606000666066600660666000000660666066600660666066606060000066606660600066606600666066606660000000000000000000000000000000000000
60606000600060606000600000006000606060006000060060006060000060000600600060006060606066606000000000000000000000000000000000000000
66606000660066606660660000006660666066006000060066006660000066000600600066006060666060606600000000000000000000000000000000000000
60006000600060600060600000000060600060006000060060000060000060000600600060006060606060606000000000000000000000000000000000000000
60006660666060606600666000006600600066600660666060006660000060006660666066606060606060606660000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000077077707070777000000770777077700770000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000700070707070700000007000707070707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000777077707070770000007770770077707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000007070707770700000000070707070007070000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000770070700700777000007700707070007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06606660606066606600000006606660666006600000666066600000000000000000000000000000000000000000000000000000000000000000000000000000
60006060606060006060000060006060606060000000606060600000000000000000000000000000000000000000000000000000000000000000000000000000
66606660606066006060000066606600666060000000666066600000000000000000000000000000000000000000000000000000000000000000000000000000
00606060666060006060000000606060600060600000600060600000000000000000000000000000000000000000000000000000000000000000000000000000
66006060060066606660000066006060600066600600600066600000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707700000007707770777007700000777077700000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000070007070707070000000707070700000000000000000000000000000000000000000000000000000000000000000000000000000
00700000770070707070000077707700777070000000777077700000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000000707070700070700000700070700000000000000000000000000000000000000000000000000000000000000000000000000000
70000000707007707070000077007070700077700700700077700000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000770070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000707007707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000077077707070777000000770777077707770777077700770707077707770777000007770770007700000000000000000000000000000000000000000
07000000700070707070700000007000707070700700070070007000707070007000070000007070707070000000000000000000000000000000000000000000
00700000777077707070770000007770777077000700070077007770777077007700070000007770707070000000000000000000000000000000000000000000
07000000007070707770700000000070700070700700070070000070707070007000070000007000707070700000000000000000000000000000000000000000
70000000770070700700777000007700700070707770070077707700707077707770070007007000707077700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
90909990999099009990990009900000000090009990999099909000000099900990000099909000999099009090000000000000000000000000000000000000
90909090909090900900909090000900000090009090909090009000000009009000000090909000909090909090000000000000000000000000000000000000
90909990990090900900909090000000000090009990990099009000000009009990000099009000999090909900000000000000000000000000000000000000
99909090909090900900909090900900000090009090909090009000000009000090000090909000909090909090000000000000000000000000000000000000
99909090909090909990909099900000000099909090999099909990000099909900000099909990909090909090000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
aaa0a0a0aa0000000aa0aaa0aaa0aaa00000aaa0aa00aa000000a0a00aa0aaa00000aaa0aaa00000aaa00aa000000aa0aaa0aaa0aaa0a0a0aaa0aaa000000000
a0a0a0a0a0a00000a000a0a0a0a00a000000a0a0a0a0a0a00000a0a0a000a0000000a00000a000000a00a0a00000a000a0a0a0a00a00a0a0a0a0a00000000000
aa00a0a0a0a00000a000aaa0aa000a000000aaa0a0a0a0a00000a0a0aaa0aa000000aa0000a000000a00a0a00000a000aaa0aaa00a00a0a0aa00aa0000000000
a0a0a0a0a0a00000a000a0a0a0a00a000000a0a0a0a0a0a00000a0a000a0a0000000a00000a000000a00a0a00000a000a0a0a0000a00a0a0a0a0a00000000000
a0a00aa0a0a000000aa0a0a0a0a00a000000a0a0a0a0aaa000000aa0aa00aaa00000a00000a000000a00aa0000000aa0a0a0a0000a000aa0a0a0aaa000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06606660606066606600000006606660666066606660666006606060666066606660000066606660000066606600066000000000000000000000000000000000
60006060606060006060000060006060606006000600600060006060600060000600000060606060000060606060600000000000000000000000000000000000
66606660606066006060000066606660660006000600660066606660660066000600000066606660000066606060600000000000000000000000000000000000
00606060666060006060000000606000606006000600600000606060600060000600000060006060000060006060606000000000000000000000000000000000
66006060060066606660000066006000606066600600666066006060666066600600060060006660060060006060666000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000777070707700000007707770777077700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000070007070707007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000770070707070000070007770770007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000707070707070000070007070707007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000707007707070000007707070707007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70000000888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

__gff__
0101010101000001010100000000000000010101010000010100000000000000000000000000000000000000000000000000000000000000000000000000000000010101010001010101010000000000000000000100010101010100000000000000000001010101010101000000000000010000010101010101010000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
50406b6c5c5d4040404050406040575900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40406b6c6c7e4e4c4d4748494848785900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40646b6c6c6c5c6c5d5779686869686900000000007d7e7f807f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
40407b5e7c7c6e6c6d575a506040406000000000008d8e8f908f900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5060404040605b6c6d575a404040704000000000009d9e9fa09fa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
604040474949444546785a60404074400000007d7d7e7f80b0afb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
404060577969545556696a40656640400000008d8d8e8f900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
744749785a406b6c6d605040757660400000009d9d9e9fa07d7e7f8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
405759796a406b5c5d40404040404040000000adadaeafb08d8e8f9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6057585a40405b5c6d6040404050404000000000008d8e8f9d9e9fa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4978595a40406b5c5d4070644040405000000000009d9e9fadaeafb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5859595a40406b6c6d404040406040400000000000adaeafb000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4142427142427142424242424242424300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5123245252525252525252525252525300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5133345252525252525252525252525300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6162627362626262726262736273626300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000008384858600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009394959600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a3a4a5a600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000898a8b8c0000000000000000000000000000000000000000000000000000000000000000000000000000000000b3b4b5b6000088898a8b88898a8b88898a8b88898a8b88898a8b88898a8b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000999a9b9c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000098999a9b98999a9b98999a9b98999a9b98999a9b98999a9b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000a9aaabac0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a8a9aaaba8a9aaaba8a9aaaba8a9aaaba8a9aaaba8a9aaab0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000b9babbbc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b8b9babbb8b9babbb8b9babbb8b9babbb8b9babbb8b9babb0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
001e0000181421a1421c1421d1421c1421d1421f14221142181421a1421c1421d1421c1421d1421f142211421c1421d1421f142211421f1422114223142241421c1421d1421f142211421f142211422314224142
011e00000c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c1750c17509175091750917509175091750917509175091750917509175091750917509175091750917509175
011e0000240551f055180551f055240551f055180551f055240551f055180551f055240551f055180551f055210551c055180551c055210551c055180551c055210551c055180551c055210551c0551a05518055
011e00000005200052000520005200052000520005200052000520005200052000520005200052000520005209052090520905209052090520905209052090520905209052090520905209052090520905209052
000200201d6101f6302264027640296502c6502f650336503564034640326402f6302b6302b6302762023620236202462026620296302c6302f64033650346503565033650326502c6502a640286302363023630
01020000185721a5721c5721d5721f572215722357218572005020050200502005020050200502005020050200502005020050200502005020050200502000020000000000000000000000000000000000000000
__music__
03 00010203
03 04424344
00 05424344

